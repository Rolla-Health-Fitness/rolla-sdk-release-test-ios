import Foundation

final class DefaultScanningUseCase {
    private let scanSessionManager: ScanSessionManager
    private let deviceRepository: DeviceRepository
    private let deviceRecognizer: DeviceRecognizing
    private let taskStorage: TaskStorage
    private let sessionOwner = "StartScanningUseCase"

    private let logger: Logging
    private let logCategory: LogCategory = .scanning

    init(
        scanSessionManager: ScanSessionManager,
        deviceRepository: DeviceRepository,
        deviceRecognizer: DeviceRecognizing,
        logger: Logging
    ) {
        self.scanSessionManager = scanSessionManager
        self.deviceRepository = deviceRepository
        self.deviceRecognizer = deviceRecognizer
        self.logger = logger
        self.taskStorage = TaskStorage()
    }
}

extension DefaultScanningUseCase: ScanningUseCase {
    func startScanning() async throws {
        try await startScanning(filters: .none)
    }
    
    func startScanning(filters: ScanFilters, duration: TimeInterval? = nil) async throws {
        if let duration, duration < 1 {
            throw BLECentralError.scanDurationTooShort
        }

        await taskStorage.cancelCurrentTask()

        await deviceRepository.clearDiscoveredDevices()
        logger.debug("Cleared discovered devices before starting new scan", category: logCategory)

        let session = ScanSession(
            owner: sessionOwner,
            filters: filters
        )

        let scanResultsStream = try await scanSessionManager.startScanningSession(session)

        await startScanResultProcessing(
            session: session,
            scanResultsStream: scanResultsStream,
            duration: duration
        )
    }
    
    func isScanning() async -> Bool {
        return await scanSessionManager.isScanning()
    }
    
    func stopScanning() async {
        await taskStorage.cancelCurrentTask()
        await scanSessionManager.stopAllSessions()
    }
}

extension DefaultScanningUseCase {
    private func startScanResultProcessing(
        session: ScanSession,
        scanResultsStream: AsyncStream<ScanResult>,
        duration: TimeInterval?
    ) async {
        let task = Task { [weak self] in
            guard let self = self else { return }

            defer {
                Task { [taskStorage] in
                    await taskStorage.cancelCurrentTask()
                }
            }

            await withTaskGroup(of: Void.self) { group in
                group.addTask { [weak self] in
                    guard let self = self else { return }

                    for await scanResult in scanResultsStream {
                        if Task.isCancelled {
                            self.logger.debug("Scan result processing cancelled", category: self.logCategory)
                            break
                        }

                        let activeSession = await self.scanSessionManager.getActiveSession()
                        guard let activeSession, activeSession.id == session.id else {
                            self.logger.debug(
                                "Session \(session.id) no longer active, stopping result processing",
                                category: self.logCategory
                            )
                            break
                        }

                        await self.processScanResult(scanResult, session: activeSession)
                    }
                }

                if let duration {
                    group.addTask { [weak self] in
                        guard let self = self else { return }

                        try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
                        if !Task.isCancelled {
                            self.logger.info(
                                "Scan duration expired (\(duration)s), stopping scanning",
                                category: self.logCategory
                            )
                            await self.stopScanning()
                        }
                    }
                }
                await group.next()
                group.cancelAll()
            }
        }

        await taskStorage.setCurrentTask(task)
    }
    
    private func processScanResult(_ scanResult: ScanResult, session: ScanSession) async {
        let deviceUUID = BLEDeviceIdentifier(scanResult.deviceUUID)
        
        let recognizedDevice = await deviceRecognizer.recognize(
            deviceId: deviceUUID,
            name: scanResult.name,
            advertisedServices: scanResult.advertisedServices,
            manufacturerData: scanResult.manufacturerData)
        
        guard session.filters.passes(recognizedDevice) else {
            return
        }

        let macAddress = scanResult.manufacturerData?.extractedMACAddress

        let discoveredDevice = DiscoveredDevice(
            id: deviceUUID,
            name: scanResult.name,
            rssi: scanResult.rssi,
            brand: recognizedDevice.brand,
            type: recognizedDevice.type,
            advertisedServices: scanResult.advertisedServices,
            manufacturerData: scanResult.manufacturerData,
            macAddress: macAddress,
            timestamp: scanResult.timestamp
        )
        
        await deviceRepository.reportDiscovery(discoveredDevice)
    }
}

private actor TaskStorage {
    private var currentTask: Task<Void, Never>?
    
    func setCurrentTask(_ task: Task<Void, Never>) {
        currentTask?.cancel()
        currentTask = task
    }
    
    func cancelCurrentTask() {
        currentTask?.cancel()
        currentTask = nil
    }
}
