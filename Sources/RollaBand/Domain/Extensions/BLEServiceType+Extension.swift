import Foundation

extension BLEServiceType {
    public static let rollaBand: BLEServiceType = {
        return BLEServiceType.custom(NormalizedUUID(stringIdentifier: "FFF0").uuidString)
    }()
}
