import Foundation

final class DefaultGetDiscoveredDeviceByMacAddressUseCase: GetDiscoveredDeviceByMacAddressUseCase {
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

    func execute(macAddress: String) async -> DiscoveredDevice? {
        logger.debug("Getting discovered device by MAC address: \(macAddress)", category: logCategory)

        guard let device = await deviceRepository.getDiscoveredDevice(byMacAddress: macAddress) else {
            logger.debug("No discovered device found with MAC address: \(macAddress)", category: logCategory)
            return nil
        }

        logger.debug("Found discovered device: \(device.name ?? "Unknown") with UUID: \(device.id.uuidString)", category: logCategory)
        return device
    }
}

