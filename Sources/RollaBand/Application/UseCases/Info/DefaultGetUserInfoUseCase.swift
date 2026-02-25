import Foundation

public final class DefaultGetUserInfoUseCase: GetUserInfoUseCase {
    private let commandExecutor: CommandExecutor
    private let rollaBandCommandExecutor: RollaBandCommandExecutor
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager
    private let logger: Logging

    public init(
        commandExecutor: CommandExecutor,
        rollaBandCommandExecutor: RollaBandCommandExecutor,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager,
        logger: Logging
    ) {
        self.commandExecutor = commandExecutor
        self.rollaBandCommandExecutor = rollaBandCommandExecutor
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
        self.logger = logger
    }

    public func execute(for deviceId: String) async throws -> UserInfo {
        logger.info("Getting user info for device: \(deviceId)", category: .deviceInfo)

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }
        
        do {
            
            let firmwareVersion = try? await commandExecutor.execute(
                ReadFirmwareRevisionCommand(
                    deviceUUID: deviceUUID,
                    timeout: 5
                ),
                retryPolicy: .immediate
            )
            
            let command = GetUserInfoCommand(
                deviceUUID: deviceUUID,
                timeout: 10.0,
                firmwareVersion: firmwareVersion
            )

            let userInfo = try await rollaBandCommandExecutor.execute(command)
            
            logger.success("Successfully retrieved user info for device: \(deviceUUID.value)", category: .deviceInfo)
            logger.info("User info - Gender: \(userInfo.gender.displayName), Age: \(userInfo.age), Height: \(userInfo.height)cm, Weight: \(userInfo.weight)kg", category: .deviceInfo)
            
            return userInfo
            
        } catch {
            logger.error("Failed to get user info: \(error)", category: .deviceInfo)
            throw error
        }
    }
}
