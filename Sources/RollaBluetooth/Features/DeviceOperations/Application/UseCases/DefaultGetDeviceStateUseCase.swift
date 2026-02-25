import Foundation

final class DefaultGetDeviceStateUseCase: GetDeviceStateUseCase {
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

    func execute(deviceUUID: BLEDeviceIdentifier) async -> DeviceState? {
        logger.debug("Getting device state for: \(deviceUUID.uuidString)", category: logCategory)

        guard let state = await deviceRepository.getDevice(deviceUUID) else {
            logger.error("Device not found in repository: \(deviceUUID.uuidString)", category: logCategory)
            return nil
        }

        logger.debug("Device state retrieved: \(state.description)", category: logCategory)
        return state
    }
}

