import Foundation

public struct RollaBandConnectionStrategy: BLEConnectionStrategy {
    public let deviceType: BLEDeviceType = .band
    public let deviceBrand: DeviceBrand? = .rolla

    private let commandExecutor: CommandExecutor
    private let rollaBandCommandExecutor: RollaBandCommandExecutor
    private let deviceIdentityManager: DeviceIdentityManaging
    private let logger: Logging

    public init(
        commandExecutor: CommandExecutor,
        rollaBandCommandExecutor: RollaBandCommandExecutor,
        deviceIdentityManager: DeviceIdentityManaging,
        logger: Logging
    ) {
        self.commandExecutor = commandExecutor
        self.rollaBandCommandExecutor = rollaBandCommandExecutor
        self.deviceIdentityManager = deviceIdentityManager
        self.logger = logger
    }
    
    public func connect(
        to device: DiscoveredDevice,
        timeout: TimeInterval
    ) async throws {
        logger.progress(
            "Connecting to RollaBand device: \(device.name ?? "Unknown") (\(device.id.uuidString))",
            category: .connection
        )
        
        try await commandExecutor.execute(ConnectCommand(
            deviceUUID: device.id,
            timeout: timeout
        ))
        
        logger.success("Successfully connected to RollaBand device", category: .connection)
    }
    
    public func postConnectionSetup(for device: DiscoveredDevice, timeout: TimeInterval) async throws -> ConnectedDevice {
        do {
            logger.progress("Starting RollaBand post-connection setup for: \(device.name ?? "Unknown")", category: .connection)
            let deviceUUID = device.id
            
            if let macAddress = device.manufacturerData?.extractedMACAddress {
                try await registerDevicePairing(
                    macAddress: macAddress,
                    appleUUID: deviceUUID,
                    deviceName: device.name
                )
            }
            
            let discoveredServices = try await discoverServicesAndCharacteristics(
                for: deviceUUID,
                timeout: timeout
            )
            
            try await enableRollaBandNotifications(
                for: deviceUUID,
                services: discoveredServices,
                timeout: timeout
            )
            
            try await performRollaBandSetup(for: deviceUUID)

            return ConnectedDevice(
                uuid: device.id,
                name: device.name,
                advertisedServices: device.advertisedServices,
                services: discoveredServices,
                deviceType: .band,
                brand: .rolla,
                macAddress: device.macAddress
            )
        } catch {
            logger.error("RollaBand post-connection setup failed: \(error)", category: .connection)
            try? await commandExecutor.execute(DisconnectCommand(deviceUUID: device.id, timeout: 5))
            throw error
        }
    }
    
    private func discoverServicesAndCharacteristics(for deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws -> [BLEService] {
        logger.progress("Discovering services and characteristics", category: .connection)
        
        let services = try await commandExecutor.execute(DiscoverServicesCommand(
            deviceID: deviceUUID,
            timeout: timeout
        ))
        
        var discoveredServices: [BLEService] = []
        for service in services {
            let characteristics = try await commandExecutor.execute(DiscoverCharacteristicsCommand(
                deviceID: deviceUUID,
                serviceUUID: service.uuid,
                timeout: timeout
            ))
            
            let completeService = BLEService(
                uuid: service.uuid,
                characteristics: characteristics,
                isPrimary: service.isPrimary
            )
            discoveredServices.append(completeService)
        }
        
        return discoveredServices
    }
    
    private func enableRollaBandNotifications(
        for deviceUUID: BLEDeviceIdentifier,
        services: [BLEService],
        timeout: TimeInterval
    ) async throws {
        logger.progress("Enabling RollaBand notifications", category: .connection)
        
        let enableNotificationCommand = EnableNotificationCommand(
            deviceID: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid,
            timeout: timeout
        )
        try await commandExecutor.execute(enableNotificationCommand)
    }
    
    private func performRollaBandSetup(for deviceUUID: BLEDeviceIdentifier) async throws {
        logger.progress("Performing RollaBand device setup", category: .connection)
        
        try await performRollaBandHandshake(for: deviceUUID)
        try await setRollaBandCurrentTime(for: deviceUUID)
        try await configureAutomaticDetection(for: deviceUUID)
        try? await setMotionSavingInterval(for: deviceUUID)

        logger.success("RollaBand device setup completed successfully", category: .connection)
    }
    
    private func performRollaBandHandshake(for deviceUUID: BLEDeviceIdentifier) async throws {
        logger.progress("Performing RollaBand handshake", category: .connection)

        _ = try await rollaBandCommandExecutor.execute(
            HandshakeCommand(deviceUUID: deviceUUID, timeout: 5),
            retryPolicy: .immediate
        )

        logger.success("RollaBand handshake completed successfully", category: .connection)
    }

    private func setRollaBandCurrentTime(for deviceUUID: BLEDeviceIdentifier) async throws {
        logger.progress("Setting RollaBand current time", category: .connection)

        _ = try await rollaBandCommandExecutor.execute(
            SetCurrentTimeCommand(deviceUUID: deviceUUID, timeout: 5),
            retryPolicy: .immediate
        )
        logger.success("RollaBand current time set successfully", category: .connection)
    }
    
    private func configureAutomaticDetection(for deviceUUID: BLEDeviceIdentifier) async throws {
        logger.progress("Configuring automatic detection (HRV and HR)", category: .connection)
        
        let hrvSettings = AutomaticDetectionSettings.create(
            intervalMinutes: AutomaticModeType.hrv.timeInterval,
            modeType: .hrv
        )
        
        _ = try await rollaBandCommandExecutor.execute(
            SetAutomaticDetectionCommand(
                deviceUUID: deviceUUID,
                timeout: 10,
                settings: hrvSettings
            ),
            retryPolicy: .immediate
        )
        
        let hrSettings = AutomaticDetectionSettings.create(
            intervalMinutes: AutomaticModeType.hrv.timeInterval,
            modeType: .heartRate
        )
        
        _ = try await rollaBandCommandExecutor.execute(
            SetAutomaticDetectionCommand(
                deviceUUID: deviceUUID,
                timeout: 10,
                settings: hrSettings
            ),
            retryPolicy: .immediate
        )
        
        logger.success("Automatic detection configured successfully", category: .connection)
    }

    private func setMotionSavingInterval(for deviceUUID: BLEDeviceIdentifier) async throws {
        logger.progress("Setting motion saving interval to 1 second", category: .connection)

        let confirmedInterval = try await rollaBandCommandExecutor.execute(
            SetMotionSavingIntervalCommand(
                deviceUUID: deviceUUID,
                timeout: 5,
                intervalSeconds: 1
            ),
            retryPolicy: .immediate
        )

        logger.success("Motion saving interval set to \(confirmedInterval) second(s)", category: .connection)
    }
    
    private func registerDevicePairing(macAddress: String, appleUUID: BLEDeviceIdentifier, deviceName: String?) async throws {
        logger.progress("Registering device pairing: \(macAddress)", category: .connection)

        guard let uuid = UUID(uuidString: appleUUID.uuidString) else {
            logger.error("Invalid Apple UUID format: \(appleUUID.uuidString)", category: .connection)
            return
        }

        await deviceIdentityManager.registerDevice(
            mac: macAddress,
            appleUUID: uuid,
            name: deviceName,
            brand: .rolla,
            type: .band
        )

        logger.success("Device pairing registered: \(deviceName ?? "Unknown") (\(macAddress)) → \(uuid)", category: .connection)
    }
    
    public func disconnect(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws {
        logger.progress("Disconnecting from RollaBand device: \(deviceUUID.uuidString)", category: .connection)
        
        try await commandExecutor.execute(DisconnectCommand(
            deviceUUID: deviceUUID,
            timeout: timeout)
        )
        
        logger.success("Successfully disconnected from RollaBand device", category: .connection)
    }
}




//    private func readBandCurrentTime(for deviceUUID: BLEUUID) async throws {
//        logger.info("[RollaBandStrategy] AAA Time set successfully")
//
//        let cmd = GetCurrentTimeCommand(deviceUUID: deviceUUID, timeout: 10)
//        let utcDate = try await commandExecutor.execute(cmd)
//
//        let formatter = DateFormatter()
//        formatter.calendar = Calendar(identifier: .gregorian)
//        formatter.timeZone = .current
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .medium
//        let localString = formatter.string(from: utcDate)
//
//        logger.info("[RollaBandStrategy] AAA Band time (local): \(localString)")
//    }
