import Foundation

public final class DefaultGetDeviceBatteryUseCase: GetDeviceBatteryUseCase {
    private let commandExecutor: CommandExecutor
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager
    private let logger: Logging

    public init(
        commandExecutor: CommandExecutor,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager,
        logger: Logging
    ) {
        self.commandExecutor = commandExecutor
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
        self.logger = logger
    }

    public func execute(for deviceId: String) async throws -> Int {
        logger.info("Reading battery level for device: \(deviceId)", category: .deviceInfo)

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        do {
            let command = ReadBatteryLevelCommand(deviceUUID: deviceUUID, timeout: 10.0)
            let batteryLevel = try await commandExecutor.execute(command)

            logger.success("Successfully read battery level: \(batteryLevel)%", category: .deviceInfo)
            return batteryLevel

        } catch {
            logger.error("Failed to read battery level: \(error)", category: .deviceInfo)
            throw error
        }
    }
}
