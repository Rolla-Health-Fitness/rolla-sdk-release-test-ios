import Foundation
import CoreBluetooth

extension CBCharacteristic {
    func toDomain() -> BLECharacteristic {
        let properties = self.properties.asBLEProperties
        let uuid = NormalizedUUID(stringIdentifier: self.uuid.uuidString)
        return BLECharacteristic(uuid: uuid, properties: properties)
    }
}
