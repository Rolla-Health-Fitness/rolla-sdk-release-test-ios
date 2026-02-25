import Foundation

public struct ConnectedDevice: Sendable, Equatable, Hashable {
    public let id: BLEDeviceIdentifier
    public let name: String?
    public let advertisedServices: [NormalizedUUID]?
    public let services: [BLEService]
    public let deviceType: BLEDeviceType
    public let brand: DeviceBrand
    public let macAddress: String?

    public init(
        uuid: BLEDeviceIdentifier,
        name: String?,
        advertisedServices: [NormalizedUUID]?,
        services: [BLEService],
        deviceType: BLEDeviceType = .unknown,
        brand: DeviceBrand = .unknown,
        macAddress: String? = nil
    ) {
        self.id = uuid
        self.name = name
        self.advertisedServices = advertisedServices
        self.services = services
        self.deviceType = deviceType
        self.brand = brand
        self.macAddress = macAddress
    }
    
    public func hasService(_ serviceType: BLEServiceType) -> Bool {
        return services.contains { $0.serviceType == serviceType }
    }
}
