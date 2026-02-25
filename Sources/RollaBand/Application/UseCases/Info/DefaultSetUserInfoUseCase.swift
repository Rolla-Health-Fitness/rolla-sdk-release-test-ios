import Foundation

public final class DefaultSetUserInfoUseCase: SetUserInfoUseCase {
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

    public func execute(for deviceId: String, userInfo: UserInfo) async throws {
        logger.info("Setting user info for device: \(deviceId)", category: .deviceInfo)
        logger.info("User info - Gender: \(userInfo.gender.displayName), Age: \(userInfo.age), Height: \(userInfo.height)cm, Weight: \(userInfo.weight)kg", category: .deviceInfo)

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
            
            let command = SetUserInfoCommand(
                deviceUUID: deviceUUID,
                timeout: 10.0,
                userInfo: userInfo,
                firmwareVersion: firmwareVersion
            )

            try await rollaBandCommandExecutor.execute(
                command,
                retryPolicy: .immediate
            )
            
            logger.success("Successfully set user info for device: \(deviceUUID.value)", category: .deviceInfo)
            
        } catch {
            logger.error("Failed to set user info: \(error)", category: .deviceInfo)
            throw error
        }
    }
}
