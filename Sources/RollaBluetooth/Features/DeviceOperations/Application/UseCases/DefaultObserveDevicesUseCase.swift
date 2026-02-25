import Foundation

final class DefaultObserveDevicesUseCase: StartObservingDeviceStatesUseCase {
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
    
    func execute() async -> AsyncStream<[DeviceState]> {
        logger.debug("Starting device observation stream", category: logCategory)
        return await deviceRepository.allDevicesStream()
    }
}

