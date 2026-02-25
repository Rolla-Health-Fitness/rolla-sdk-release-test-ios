import Foundation

public struct BLEService: Equatable, Hashable, Sendable {
    public let uuid: NormalizedUUID
    public let characteristics: [BLECharacteristic]
    public let isPrimary: Bool
    
    public init(uuid: NormalizedUUID, characteristics: [BLECharacteristic] = [], isPrimary: Bool = true) {
        self.uuid = uuid
        self.characteristics = characteristics
        self.isPrimary = isPrimary
    }
    
    public var serviceType: BLEServiceType {
        return BLEServiceType.from(uuid: uuid)
    }
}
