import Foundation
import CoreBluetooth

extension CBService {
    func toDomain() -> BLEService {
        let bleUUID = NormalizedUUID(stringIdentifier: self.uuid.uuidString)
        let characteristics = self.characteristics?.map { $0.toDomain() } ?? []
        return BLEService(
            uuid: bleUUID,
            characteristics: characteristics,
            isPrimary: self.isPrimary
        )
    }
}
