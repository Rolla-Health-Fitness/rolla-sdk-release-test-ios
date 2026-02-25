import Foundation

final class DefaultGetAllDevicesUseCase: GetAllDevicesUseCase {
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
    
    func execute() async -> [DeviceState] {
        let devices = await deviceRepository.getAllDevicesWithStates()
        logger.debug("Retrieved \(devices.count) device(s)", category: logCategory)
        return devices
    }
}

