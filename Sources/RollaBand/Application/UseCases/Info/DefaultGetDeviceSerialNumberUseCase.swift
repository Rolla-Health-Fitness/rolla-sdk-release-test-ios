import Foundation

public final class DefaultGetDeviceSerialNumberUseCase: GetDeviceSerialNumberUseCase {
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

    public func execute(for deviceId: String) async throws -> String? {
        logger.info("Reading serial number for device: \(deviceId)", category: .deviceInfo)

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }
        
        do {
            let command = ReadSerialNumberCommand(
                deviceUUID: deviceUUID,
                timeout: 5
            )
            let serialNumber = try await commandExecutor.execute(command)
        
            guard let serialNumber else {
                logger.warning("Serial number unavailable for device: \(deviceUUID.value)", category: .deviceInfo)
                return nil
            }
            
            logger.success("Successfully read serial number: \(serialNumber)", category: .deviceInfo)
            return serialNumber
            
        } catch {
            logger.error("Error reading serial number: \(error.localizedDescription)", category: .deviceInfo)
            throw error
        }
    }
}
