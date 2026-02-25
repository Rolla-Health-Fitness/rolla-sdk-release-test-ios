import Foundation

public final class DefaultGetDeviceFirmwareUseCase: GetDeviceFirmwareUseCase {
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
        logger.info("Reading firmware version for device: \(deviceId)", category: .deviceInfo)

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }
        
        do {
            let command = ReadFirmwareRevisionCommand(
                deviceUUID: deviceUUID,
                timeout: 5
            )
            
            let firmwareVersion = try await commandExecutor.execute(
                command,
                retryPolicy: .immediate
            )
            
            guard let firmwareVersion else {
                logger.warning("Firmware version unavailable for device: \(deviceUUID.uuidString)", category: .deviceInfo)
                return nil
            }
            
            logger.success("Successfully read firmware version: \(firmwareVersion)", category: .deviceInfo)
            return firmwareVersion
            
        } catch {
            logger.error("Error reading firmware: \(error.localizedDescription)", category: .deviceInfo)
            throw error
        }
    }
}
