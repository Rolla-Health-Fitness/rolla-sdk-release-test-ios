import Foundation

public struct DiscoveredDevice: Sendable, Equatable, Hashable {
    public let id: BLEDeviceIdentifier
    public let name: String?
    public let rssi: Int
    public let brand: DeviceBrand
    public let type: BLEDeviceType
    public let timestamp: Date
    public let advertisedServices: [NormalizedUUID]
    public let manufacturerData: Data?
    public let macAddress: String?

    public init(
        id: BLEDeviceIdentifier,
        name: String?,
        rssi: Int,
        brand: DeviceBrand,
        type: BLEDeviceType,
        advertisedServices: [NormalizedUUID] = [],
        manufacturerData: Data? = nil,
        macAddress: String? = nil,
        timestamp: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.rssi = rssi
        self.brand = brand
        self.type = type
        self.advertisedServices = advertisedServices
        self.manufacturerData = manufacturerData
        self.macAddress = macAddress
        self.timestamp = timestamp
    }
}
