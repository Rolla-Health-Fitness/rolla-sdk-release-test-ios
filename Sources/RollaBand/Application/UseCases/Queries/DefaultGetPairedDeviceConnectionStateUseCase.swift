import Foundation

public final class DefaultGetPairedDeviceConnectionStateUseCase: GetPairedDeviceConnectionStateUseCase {
    private let deviceIdentityManager: DeviceIdentityManaging
    private let connector: Connector
    private let logger: Logging
    private let logCategory: LogCategory = .connection
    
    public init(
        deviceIdentityManager: DeviceIdentityManaging,
        connector: Connector,
        logger: Logging
    ) {
        self.deviceIdentityManager = deviceIdentityManager
        self.connector = connector
        self.logger = logger
    }
    
    public func execute(identifier: String) async throws -> DeviceState {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(identifier) else {
            logger.error("Device not found: \(identifier)", category: logCategory)
            throw BLEPeripheralError.deviceNotFound(identifier)
        }
        
        return try await connector.getConnectionState(deviceId: deviceUUID)
    }
}

