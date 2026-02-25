import Foundation

public struct PairedDevice: Sendable, Equatable {
    public let macAddress: String
    public let appleUUID: UUID
    public let name: String?
    public let lastSeen: Date
    public let deviceType: BLEDeviceType
    public let brand: DeviceBrand

    public init(macAddress: String, appleUUID: UUID, name: String?, lastSeen: Date, deviceType: BLEDeviceType, brand: DeviceBrand) {
        self.macAddress = macAddress
        self.appleUUID = appleUUID
        self.name = name
        self.lastSeen = lastSeen
        self.deviceType = deviceType
        self.brand = brand
    }
}
