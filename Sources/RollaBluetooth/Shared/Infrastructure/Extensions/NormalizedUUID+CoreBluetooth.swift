import Foundation
import CoreBluetooth

extension NormalizedUUID {
    public init(_ cbuuid: CBUUID) {
        self.init(stringIdentifier: cbuuid.uuidString)
    }
    
    public var asCBUUID: CBUUID {
        return CBUUID(string: uuidString)
    }
    
    public func matches(_ other: NormalizedUUID) -> Bool {
        return self.asCBUUID.isEqual(other.asCBUUID)
    }
}

extension Set where Element == BLECharacteristicProperty {
    public var asCBCharacteristicProperties: CBCharacteristicProperties {
        var properties: CBCharacteristicProperties = []
        
        for property in self {
            switch property {
            case .read:
                properties.insert(.read)
            case .write:
                properties.insert(.write)
            case .writeWithoutResponse:
                properties.insert(.writeWithoutResponse)
            case .notify:
                properties.insert(.notify)
            case .indicate:
                properties.insert(.indicate)
            case .authenticatedSignedWrites:
                properties.insert(.authenticatedSignedWrites)
            case .extendedProperties:
                properties.insert(.extendedProperties)
            case .notifyEncryptionRequired:
                properties.insert(.notifyEncryptionRequired)
            case .indicateEncryptionRequired:
                properties.insert(.indicateEncryptionRequired)
            }
        }
        
        return properties
    }
}

extension CBCharacteristicProperties {
    public var asBLEProperties: Set<BLECharacteristicProperty> {
        var properties: Set<BLECharacteristicProperty> = []
        
        if contains(.read) { properties.insert(.read) }
        if contains(.write) { properties.insert(.write) }
        if contains(.writeWithoutResponse) { properties.insert(.writeWithoutResponse) }
        if contains(.notify) { properties.insert(.notify) }
        if contains(.indicate) { properties.insert(.indicate) }
        if contains(.authenticatedSignedWrites) { properties.insert(.authenticatedSignedWrites) }
        if contains(.extendedProperties) { properties.insert(.extendedProperties) }
        if contains(.notifyEncryptionRequired) { properties.insert(.notifyEncryptionRequired) }
        if contains(.indicateEncryptionRequired) { properties.insert(.indicateEncryptionRequired) }
        
        return properties
    }
}
