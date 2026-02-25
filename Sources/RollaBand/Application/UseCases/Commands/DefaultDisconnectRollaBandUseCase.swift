import Foundation

public final class DefaultDisconnectRollaBandUseCase: DisconnectRollaBandUseCase {
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

    public func execute(identifier: String, timeout: TimeInterval) async throws -> BLEDeviceIdentifier {
        logger.info("Disconnecting from RollaBand device: \(identifier)", category: logCategory)

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(identifier) else {
            logger.error("Device not found: \(identifier)", category: logCategory)
            throw BLEPeripheralError.deviceNotFound(identifier)
        }

        try await connector.disconnect(
            deviceUUID: deviceUUID,
            timeout: timeout
        )

        logger.success("Successfully disconnected from RollaBand device: \(identifier)", category: logCategory)

        return deviceUUID
    }
}

