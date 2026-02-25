import Foundation

final class DefaultRemoveDeviceUseCase: RemoveDeviceUseCase {
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
    
    func execute(deviceUUID: BLEDeviceIdentifier) async {
        await deviceRepository.removeDevice(deviceUUID)
        logger.success("Device removed from repository: \(deviceUUID.uuidString)", category: logCategory)
    }
}

