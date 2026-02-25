import Foundation
@preconcurrency import CoreBluetooth
@preconcurrency import NordicDFU

final class FirmwareUpdateManager: @unchecked Sendable, FirmwareUpdateManaging {
    private let centralManager: CoreBLECentralManaging
    private let logger: Logging
    private let firmwareUpdateEventsStream: EventStreamSource<FirmwareUpdateEvent>
    private var dfuController: DFUServiceController?
    private var firmware: DFUFirmware?
    private let state = UpdateState()

    init(
        centralManager: CoreBLECentralManaging,
        deviceRepository: DeviceRepository,
        logger: Logging
    ) {
        self.centralManager = centralManager
        self.logger = logger
        self.firmwareUpdateEventsStream = EventStreamSource<FirmwareUpdateEvent>(
            maxContinuations: 10,
            bufferingPolicy: .bufferingNewest(50)
        )
    }
    
    func getEventsStream() async -> AsyncStream<FirmwareUpdateEvent> {
        let (stream, _) = await firmwareUpdateEventsStream.makeStream()
        return stream
    }
    
    func startFirmwareUpdate(
        firmwareUrlString: String,
        deviceUUID: BLEDeviceIdentifier
    ) async {
        guard !(await state.isInProgress) else {
            let curId = await state.currentDeviceId()?.uuidString ?? "unknown"
            let err = "Firmware update is already in progress for device: \(curId)"
            logger.error(err, category: .firmwareUpdate)
            await firmwareUpdateEventsStream.yield(.preparationFailed(deviceId: deviceUUID, error: err))
            await cleanupUpdateState()
            return
        }

        guard !firmwareUrlString.isEmpty else {
            let err = "Firmware URL string is empty"
            logger.error(err, category: .firmwareUpdate)
            await firmwareUpdateEventsStream.yield(.preparationFailed(deviceId: deviceUUID, error: err))
            await cleanupUpdateState()
            return
        }

        await firmwareUpdateEventsStream.yield(.preparationStarted(deviceId: deviceUUID))
        logger.progress("Starting firmware update for device: \(deviceUUID)", category: .firmwareUpdate)

        let firmwareUrl = URL(fileURLWithPath: firmwareUrlString)
        guard let fw = try? DFUFirmware(urlToZipFile: firmwareUrl) else {
            let err = "Failed to create firmware object from URL: \(firmwareUrlString)"
            logger.error(err, category: .firmwareUpdate)
            await firmwareUpdateEventsStream.yield(.preparationFailed(deviceId: deviceUUID, error: err))
            await cleanupUpdateState()
            return
        }

        self.firmware = fw
        await state.start(deviceId: deviceUUID)

        await firmwareUpdateEventsStream.yield(.preparationCompleted(deviceId: deviceUUID))

        logger.info("Waiting for device to reboot into DFU mode...", category: .firmwareUpdate)

        guard let dfuPeripheral = await scanForDFUDevice(timeout: 30.0) else {
            let err = "Device did not appear in DFU mode within 30 seconds"
            logger.error(err, category: .firmwareUpdate)
            await firmwareUpdateEventsStream.yield(.preparationFailed(deviceId: deviceUUID, error: err))
            await cleanupUpdateState()
            return
        }

        logger.success("Found DFU device - proceeding with update", category: .firmwareUpdate)

        await performDFUUpdate(for: dfuPeripheral, deviceUUID: deviceUUID)
    }
    
    func abortFirmwareUpdate() {
        Task {
            await self.performAbortFirmwareUpdate()
        }
    }
    
    func isUpdateInProgress() async -> Bool {
        await state.isInProgress
    }
}

extension FirmwareUpdateManager {
    private func performDFUUpdate(
        for peripheral: CBPeripheral,
        deviceUUID: BLEDeviceIdentifier
    ) async {
        guard let firmware else {
            let err = "Failed to start DFU update - firmware object not found"
            logger.error(err, category: .firmwareUpdate)
            await firmwareUpdateEventsStream.yield(.updateFailed(deviceId: deviceUUID, error: err))
            await cleanupUpdateState()
            return
        }

        logger.progress("Starting DFU update...", category: .firmwareUpdate)

        await state.markInProgress(true)
        await firmwareUpdateEventsStream.yield(.updateStarted(deviceId: deviceUUID))

        let initiator = DFUServiceInitiator().with(firmware: firmware)
        initiator.delegate = self
        initiator.progressDelegate = self

        // Configure DFU settings
        initiator.packetReceiptNotificationParameter = 0
        initiator.enableUnsafeExperimentalButtonlessServiceInSecureDfu = false
        initiator.disableResume = true

        let controller = initiator.start(target: peripheral)
        self.dfuController = controller

        if controller == nil {
            let err = "Failed to create DFU controller - device may not be in DFU mode"
            logger.error(err, category: .firmwareUpdate)
            logger.error("Make sure the device is in DFU mode with DFU service available", category: .firmwareUpdate)
            await cleanupUpdateState()
            await firmwareUpdateEventsStream.yield(.updateFailed(deviceId: deviceUUID, error: err))
        } else {
            logger.success("DFU controller created successfully", category: .firmwareUpdate)
        }
    }
    
    private func performAbortFirmwareUpdate() async {
        guard let deviceId = await state.currentDeviceId() else {
            return
        }
        
        guard await state.isInProgress else {
            let err = "Firmware update is not in progress"
            logger.warning(err, category: .firmwareUpdate)
            await firmwareUpdateEventsStream.yield(.updateFailed(deviceId: deviceId, error: err))
            await cleanupUpdateState()
            return
        }
        
        logger.info("Aborting firmware update for device: \(deviceId.uuidString)", category: .firmwareUpdate)
        let abortSucceeded = (dfuController?.abort() != nil)
        logger.info("DFU abort result: \(abortSucceeded ? "success" : "failed")", category: .firmwareUpdate)
        
        await cleanupUpdateState()
        await firmwareUpdateEventsStream.yield(.updateAborted(deviceId: deviceId))
    }
    
    private func scanForDFUDevice(timeout: TimeInterval) async -> CBPeripheral? {
        let dfuServiceUUID = BLEServiceType.dfu.uuid
        let scanOptions = ScanOptions(
            allowDuplicates: false,
            serviceUUIDs: [dfuServiceUUID]
        )

        do {
            try await centralManager.startScanning(options: scanOptions)
            let scanStream = await centralManager.scanResultsStream()

            return await withTaskGroup(of: CBPeripheral?.self) { group in
                group.addTask { [weak self] in
                    guard let self = self else { return nil }

                    for await scanResult in scanStream {
                        let hasDFUService = scanResult.advertisedServices.contains { serviceUUID in
                            serviceUUID == dfuServiceUUID
                        }

                        guard hasDFUService else { continue }

                        self.logger.info(
                            "Found DFU device - UUID: \(scanResult.deviceUUID.uuidString), Name: '\(scanResult.name ?? "nil")', RSSI: \(scanResult.rssi) dBm",
                            category: .firmwareUpdate
                        )

                        if let peripheral = await self.centralManager.getPeripheral(for: BLEDeviceIdentifier(scanResult.deviceUUID)) {
                            return peripheral
                        }
                    }

                    self.logger.error("Scan stream ended without finding any DFU device", category: .firmwareUpdate)
                    return nil
                }

                group.addTask { [weak self] in
                    let nanoseconds = UInt64(timeout * 1_000_000_000)
                    try? await Task.sleep(nanoseconds: nanoseconds)
                    if !Task.isCancelled {
                        self?.logger.error("Timeout: No DFU device found within \(timeout) seconds", category: .firmwareUpdate)
                    }
                    return nil
                }

                for await result in group {
                    if let peripheral = result {
                        group.cancelAll()
                        self.centralManager.stopScanning()
                        return peripheral
                    }
                }

                self.centralManager.stopScanning()
                return nil
            }

        } catch {
            logger.error("Failed to start DFU scan: \(error)", category: .firmwareUpdate)
            centralManager.stopScanning()
            return nil
        }
    }
    
    private func cleanupUpdateState() async {
        await state.cleanup()
        firmware = nil
        dfuController = nil
    }
    
    private func deviceUUID() async -> BLEDeviceIdentifier? {
        await state.currentDeviceId()
    }
}

extension FirmwareUpdateManager: DFUServiceDelegate, DFUProgressDelegate {
    public func dfuStateDidChange(to state: DFUState) {
        Task { @Sendable in
            guard let deviceId = await deviceUUID() else {
                return
            }

            switch state {
            case .connecting:
                logger.info("Connecting to device in DFU mode...", category: .firmwareUpdate)

            case .starting:
                logger.info("Starting DFU process...", category: .firmwareUpdate)

            case .enablingDfuMode:
                logger.info("Enabling DFU mode...", category: .firmwareUpdate)

            case .uploading:
                logger.info("Uploading firmware...", category: .firmwareUpdate)

            case .validating:
                logger.info("Validating firmware...", category: .firmwareUpdate)

            case .disconnecting:
                logger.info("Disconnecting after firmware update...", category: .firmwareUpdate)

            case .completed:
                logger.success("Firmware update completed successfully", category: .firmwareUpdate)
                await cleanupUpdateState()
                await firmwareUpdateEventsStream.yield(.updateCompleted(deviceId: deviceId))

            case .aborted:
                logger.warning("Firmware update aborted", category: .firmwareUpdate)
                await cleanupUpdateState()
                await firmwareUpdateEventsStream.yield(.updateAborted(deviceId: deviceId))

            @unknown default:
                logger.info("DFU state: \(state)", category: .firmwareUpdate)
            }
        }
    }
    
    public func dfuError(_ error: DFUError, didOccurWithMessage message: String) {
        Task {
            guard let deviceId = await deviceUUID() else {
                return
            }
            logger.error("DFU Error: \(message)", category: .bluetooth)
            await cleanupUpdateState()
            await firmwareUpdateEventsStream.yield(.updateFailed(deviceId: deviceId, error: message))
        }
    }
    
    public func dfuProgressDidChange(
        for part: Int,
        outOf totalParts: Int,
        to progress: Int,
        currentSpeedBytesPerSecond: Double,
        avgSpeedBytesPerSecond: Double
    ) {
        Task {
            guard let deviceId = await deviceUUID() else {
                return
            }
            
            guard await state.shouldSendProgress(progress) else {
                return
            }

            if progress % 5 == 0 {
                logger.progress("Firmware update: \(progress)% (part \(part)/\(totalParts)) - \(String(format: "%.1f", avgSpeedBytesPerSecond/1024)) KB/s", category: .firmwareUpdate)
            }

            await firmwareUpdateEventsStream.yield(.progressChanged(deviceId: deviceId, progress: progress, stage: "uploading"))
        }
    }
}

private actor UpdateState {
    private(set) var isInProgress: Bool = false
    private(set) var deviceId: BLEDeviceIdentifier?
    private(set) var lastSentProgress: Int = 0

    func start(deviceId: BLEDeviceIdentifier) {
        self.isInProgress = true
        self.deviceId = deviceId
        self.lastSentProgress = 0
    }

    func markInProgress(_ flag: Bool) {
        self.isInProgress = flag
    }

    func currentDeviceId() -> BLEDeviceIdentifier? {
        deviceId
    }

    func shouldSendProgress(_ newProgress: Int) -> Bool {
        guard newProgress > lastSentProgress else {
            return false
        }
        lastSentProgress = newProgress
        return true
    }

    func cleanup() {
        isInProgress = false
        deviceId = nil
        lastSentProgress = 0
    }
}
