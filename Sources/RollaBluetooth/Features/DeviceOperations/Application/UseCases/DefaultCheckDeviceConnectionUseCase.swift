import Foundation

final class DefaultCheckDeviceConnectionUseCase: CheckDeviceConnectionUseCase {
    private let deviceRepository: DeviceRepository
    private let logger: Logging
    private let logCategory: LogCategory = .devices

    init(
        deviceRepository: DeviceRepository,
        logger: Logging
    ) {
        self.deviceRepository = deviceRepository
        self.logger = logger
    }

    func execute(deviceUUID: BLEDeviceIdentifier) async -> Bool {
        logger.debug("Checking connection status for: \(deviceUUID.uuidString)", category: logCategory)

        let isConnected = await deviceRepository.isDeviceConnected(deviceUUID: deviceUUID)
        logger.debug("Device \(deviceUUID.uuidString) connection status: \(isConnected)", category: logCategory)
        return isConnected
    }
}

