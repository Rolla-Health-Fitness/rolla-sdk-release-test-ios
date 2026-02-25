import Foundation

public struct BLECharacteristic: Equatable, Hashable, Sendable {
    public let uuid: NormalizedUUID
    public let properties: Set<BLECharacteristicProperty>
    public let isNotifying: Bool
    
    public init(
        uuid: NormalizedUUID,
        properties: Set<BLECharacteristicProperty> = [],
        isNotifying: Bool = false
    ) {
        self.uuid = uuid
        self.properties = properties
        self.isNotifying = isNotifying
    }
    
    public var characteristicType: BLECharacteristicType {
        return BLECharacteristicType.from(uuid: uuid)
    }
    
    public var displayName: String {
        return characteristicType.displayName
    }
    
    public func supports(_ property: BLECharacteristicProperty) -> Bool {
        return properties.contains(property)
    }
    
    public var canRead: Bool {
        return supports(.read)
    }
    
    public var canWrite: Bool {
        return supports(.write) || supports(.writeWithoutResponse)
    }
    
    public var canNotify: Bool {
        return supports(.notify) || supports(.indicate)
    }
}

