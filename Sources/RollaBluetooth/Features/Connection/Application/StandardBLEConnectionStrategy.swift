import Foundation

struct StandardBLEConnectionStrategy: BLEStandardConnectionStrategy {
    public let deviceType: BLEDeviceType = .unknown
    public let deviceBrand: DeviceBrand? = nil  // Applies to all brands
    private let commandExecutor: BLECommandExecuting
    private let logger: Logging

    init(commandExecutor: BLECommandExecuting, logger: Logging) {
        self.commandExecutor = commandExecutor
        self.logger = logger
    }
    
    func connect(
        to device: DiscoveredDevice,
        timeout: TimeInterval
    ) async throws {
        let connectCommand = ConnectCommand(
            deviceUUID: device.id,
            timeout: timeout
        )
        try await commandExecutor.execute(connectCommand)
    }
    
    func postConnectionSetup(for device: DiscoveredDevice, timeout: TimeInterval) async throws -> ConnectedDevice {
        let services = try await commandExecutor.execute(DiscoverServicesCommand(
            deviceID: device.id,
            timeout: timeout
        ))
        
        var discoveredServices: [BLEService] = []
        for service in services {
            let characteristics = try await commandExecutor.execute(DiscoverCharacteristicsCommand(
                deviceID: device.id,
                serviceUUID: service.uuid,
                timeout: timeout
            ))
            let newService = BLEService(
                uuid: service.uuid,
                characteristics: characteristics,
                isPrimary: service.isPrimary
            )
            discoveredServices.append(newService)
        }
        
        return ConnectedDevice(
            uuid: device.id,
            name: device.name,
            advertisedServices: device.advertisedServices,
            services: discoveredServices,
            deviceType: device.type,
            brand: device.brand,
            macAddress: device.macAddress
        )
    }
    
    func disconnect(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws {
        try await commandExecutor.execute(
            DisconnectCommand(deviceUUID: deviceUUID, timeout: timeout)
        )
    }
}
