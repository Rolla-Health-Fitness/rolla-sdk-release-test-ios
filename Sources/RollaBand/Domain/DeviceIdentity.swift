import Foundation

public struct DeviceIdentity: Codable {
    public let mac: String
    public var appleUUID: UUID
    public let name: String?
    public var lastSeen: Date
    public let brand: String
    public let type: String
    public let dateAdded: Date
    
    public var deviceBrand: DeviceBrand {
        return DeviceBrand(rawValue: brand)
    }
    
    public var deviceType: BLEDeviceType {
        return BLEDeviceType(rawValue: type)
    }
    
    public init(mac: String, appleUUID: UUID, name: String?, lastSeen: Date, brand: String, type: String, dateAdded: Date) {
        self.mac = mac
        self.appleUUID = appleUUID
        self.name = name
        self.lastSeen = lastSeen
        self.brand = brand
        self.type = type
        self.dateAdded = dateAdded
    }
}
