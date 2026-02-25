import Foundation

extension BLECharacteristicType {
    public static let rollaBandWriteCommand: BLECharacteristicType = {
        return BLECharacteristicType.custom(NormalizedUUID(stringIdentifier: "FFF6").uuidString)
    }()
    
    public static let rollaBandNotification: BLECharacteristicType = {
        return BLECharacteristicType.custom(NormalizedUUID(stringIdentifier: "FFF7").uuidString)
    }()
}
