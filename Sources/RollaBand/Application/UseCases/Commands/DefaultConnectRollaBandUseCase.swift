import Foundation

public final class DefaultConnectRollaBandUseCase: ConnectRollaBandUseCase {
    private let deviceIdentityManager: DeviceIdentityManaging
    private let rollaBandCommandExecutor: RollaBandCommandExecutor
    private let workoutManager: RollaBandWorkoutManaging
    private let deviceManager: DeviceManager
    private let connector: Connector
    private let scanner: BLEScanner
    private let logger: Logging
    private let logCategory: LogCategory = .connection
    
    public init(
        deviceIdentityManager: DeviceIdentityManaging,
        rollaBandCommandExecutor: RollaBandCommandExecutor,
        deviceManager: DeviceManager,
        connector: Connector,
        scanner: BLEScanner,
        workoutManager: RollaBandWorkoutManaging,
        logger: Logging
    ) {
        self.deviceIdentityManager = deviceIdentityManager
        self.rollaBandCommandExecutor = rollaBandCommandExecutor
        self.deviceManager = deviceManager
        self.connector = connector
        self.scanner = scanner
        self.workoutManager = workoutManager
        self.logger = logger
    }
    
    public func execute(identifier: String, timeout: TimeInterval) async throws {
        logger.info("Connecting to RollaBand device: \(identifier)", category: logCategory)
        
        var deviceUUID: BLEDeviceIdentifier?
        var pairedDevice: PairedDevice?
        
        deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(identifier)
        
        if deviceUUID != nil {
            pairedDevice = await deviceIdentityManager.getPairedDevice(identifier: identifier)
            logger.info("Found paired device with UUID: \(deviceUUID!.uuidString)", category: logCategory)
        } else {
            if identifier.isValidMACAddress {
                logger.info("Identifier is a MAC address, looking for discovered device: \(identifier)", category: logCategory)
                if let discoveredDevice = await deviceManager.getDiscoveredDevice(byMacAddress: identifier) {
                    deviceUUID = discoveredDevice.id
                    logger.info("Found discovered device with UUID: \(deviceUUID!.uuidString) for MAC: \(identifier)", category: logCategory)
                } else {
                    logger.info("Device not found in discovered devices, starting scan for MAC: \(identifier)", category: logCategory)
                    deviceUUID = try await scanForDevice(macAddress: identifier)
                }
            } else if let uuidIdentifier = BLEDeviceIdentifier(identifier) {
                logger.info("Identifier is a UUID but not paired, checking repository for UUID: \(identifier)", category: logCategory)
                if let deviceState = await deviceManager.getDevice(deviceUUID: uuidIdentifier) {
                    deviceUUID = uuidIdentifier
                    logger.info("Found device with UUID in repository: \(uuidIdentifier.uuidString)", category: logCategory)
                } else {
                    logger.info("Device not found in repository, starting scan for UUID: \(identifier)", category: logCategory)
                    deviceUUID = try await scanForDevice(uuid: uuidIdentifier)
                }
            } else {
                logger.error("Device not found and identifier is not a valid MAC address or UUID: \(identifier)", category: logCategory)
                throw BLEPeripheralError.deviceNotFound(identifier)
            }
        }
        
        guard let finalDeviceUUID = deviceUUID else {
            logger.error("Failed to resolve device UUID for: \(identifier)", category: logCategory)
            throw BLEPeripheralError.deviceNotFound(identifier)
        }

        try await connector.connect(
            deviceUUID: finalDeviceUUID,
            timeout: timeout,
            brand: pairedDevice?.brand,
            type: pairedDevice?.deviceType,
            macAddress: pairedDevice?.macAddress
        )
        
        let isInActivity = await workoutManager.isUserInActivity()
        let isRestorePending = await workoutManager.isActivityRestorePending()

        // Suppress the automatic stop when a crash-recovery dialog is pending so the
        // band keeps running until the user makes a choice (resume / save / discard).
        if !isInActivity && !isRestorePending {
            let _ = try? await rollaBandCommandExecutor.execute(
                ActivityControlCommand(
                    deviceUUID: finalDeviceUUID,
                    timeout: 5,
                    mode: .stop,
                    activityType: .run,
                    fireAndForget: true
                )
            )
        } else if isRestorePending {
            // Store the reconnected device ID so the deferred stop can find it
            // when the user chooses save/discard in the ResumeActivityDialog.
            if let mac = await deviceIdentityManager.getMAC(for: finalDeviceUUID.value) {
                await workoutManager.setPendingRestoreDeviceId(mac)
            }
        }
        
        // Similarly skip the "outside activity" step threshold when restore is pending.
        if !isRestorePending {
            try? await rollaBandCommandExecutor.execute(
                SetStepCountThresholdCommand(
                    deviceUUID: finalDeviceUUID,
                    timeout: 5,
                    thresholdType: .stop
                )
            )
        }
        
        logger.success("Successfully connected to RollaBand device: \(identifier)", category: logCategory)
    }
    
    private func scanForDevice(macAddress: String) async throws -> BLEDeviceIdentifier {
        let scanTimeout: TimeInterval = 10.0
        
        return try await withThrowingTaskGroup(of: BLEDeviceIdentifier.self) { group in
            group.addTask { [weak self] in
                guard let self = self else {
                    throw BLEPeripheralError.deviceNotFound(macAddress)
                }
                
                try await self.scanner.start(filters: ScanFilters(brands: [.rolla], types: [.band]), duration: scanTimeout)
                
                let deviceStream = await self.deviceManager.allDevicesStream()
                for await deviceStates in deviceStream {
                    for deviceState in deviceStates {
                        let deviceMacAddress: String?
                        switch deviceState {
                        case .discovered(let device), .connecting(let device), .disconnected(let device):
                            deviceMacAddress = device.macAddress
                        case .connected(let device), .disconnecting(let device):
                            deviceMacAddress = device.macAddress
                        }
                        
                        if deviceMacAddress == macAddress {
                            await self.scanner.stop()
                            return deviceState.deviceId
                        }
                    }
                }
                
                throw BLEPeripheralError.deviceNotFound(macAddress)
            }
            
            group.addTask {
                try await Task.sleep(nanoseconds: UInt64(scanTimeout * 1_000_000_000))
                throw BLEPeripheralError.deviceNotFound(macAddress)
            }
            
            do {
                guard let result = try await group.next() else {
                    throw BLEPeripheralError.deviceNotFound(macAddress)
                }
                group.cancelAll()
                await scanner.stop()
                return result
            } catch {
                group.cancelAll()
                await scanner.stop()
                throw error
            }
        }
    }
    
    private func scanForDevice(uuid: BLEDeviceIdentifier) async throws -> BLEDeviceIdentifier {
        let scanTimeout: TimeInterval = 10.0
        
        return try await withThrowingTaskGroup(of: BLEDeviceIdentifier.self) { group in
            group.addTask { [weak self] in
                guard let self = self else {
                    throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
                }
                
                try await self.scanner.start(filters: ScanFilters(brands: [.rolla], types: [.band]), duration: scanTimeout)
                
                let deviceStream = await self.deviceManager.allDevicesStream()
                for await deviceStates in deviceStream {
                    for deviceState in deviceStates {
                        if deviceState.deviceId == uuid {
                            await self.scanner.stop()
                            return uuid
                        }
                    }
                }
                
                throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
            }
            
            group.addTask {
                try await Task.sleep(nanoseconds: UInt64(scanTimeout * 1_000_000_000))
                throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
            }
            
            do {
                guard let result = try await group.next() else {
                    throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
                }
                group.cancelAll()
                await scanner.stop()
                return result
            } catch {
                group.cancelAll()
                await scanner.stop()
                throw error
            }
        }
    }
}

