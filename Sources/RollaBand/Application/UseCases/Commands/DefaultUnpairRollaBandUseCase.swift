import Foundation

public final class DefaultUnpairRollaBandUseCase: UnpairRollaBandUseCase {
    private let deviceIdentityManager: DeviceIdentityManaging
    private let connector: Connector
    private let deviceManager: DeviceManager
    private let logger: Logging

    public init(
        deviceIdentityManager: DeviceIdentityManaging,
        connector: Connector,
        deviceManager: DeviceManager,
        logger: Logging
    ) {
        self.deviceIdentityManager = deviceIdentityManager
        self.connector = connector
        self.deviceManager = deviceManager
        self.logger = logger
    }

    public func execute(deviceUUID: BLEDeviceIdentifier) async {
        logger.info("Unpairing RollaBand device: \(deviceUUID.uuidString)", category: .connection)

        await connector.cancelReconnection(for: deviceUUID)
        await connector.stopMonitoring(for: deviceUUID)

        await deviceManager.removeDevice(deviceUUID: deviceUUID)
        
        await deviceIdentityManager.removeDevice(identifier: deviceUUID)
        logger.success("RollaBand device unpaired successfully: \(deviceUUID.uuidString)", category: .connection)
    }
}

