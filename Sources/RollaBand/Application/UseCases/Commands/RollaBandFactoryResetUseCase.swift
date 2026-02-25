import Foundation

public final class RollaBandFactoryResetUseCase: FactoryResetUseCase {
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

    public func execute(for deviceId: String) async throws {
        logger.info("Performing factory reset for device: \(deviceId)", category: .deviceInfo)

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }
        
        do {
            let command = FactoryResetCommand(
                deviceUUID: deviceUUID,
                timeout: 10.0
            )
            
            try await rollaBandCommandExecutor.execute(command, retryPolicy: .immediate)
            
            logger.success("Successfully performed factory reset for device: \(deviceId)", category: .deviceInfo)
        } catch {
            logger.error("Failed to perform factory reset: \(error)", category: .deviceInfo)
            throw error
        }
    }
}

