import Foundation

public enum BLEServiceType: Sendable, Hashable {
    case heartRate
    case battery
    case deviceInformation
    case runningSpeedAndCadence
    case pulseOximeter
    case dfu

    case custom(String)
    
    public var uuid: NormalizedUUID {
        switch self {
        case .heartRate: return NormalizedUUID(stringIdentifier: "180D")
        case .battery: return NormalizedUUID(stringIdentifier: "180F")
        case .deviceInformation: return NormalizedUUID(stringIdentifier: "180A")
        case .runningSpeedAndCadence: return NormalizedUUID(stringIdentifier: "1814")
        case .pulseOximeter: return NormalizedUUID(stringIdentifier: "1822")
        case .dfu: return NormalizedUUID(stringIdentifier: "FE59")

        case .custom(let uuidString): return NormalizedUUID(stringIdentifier: uuidString)
        }
    }
    
    public static func from(uuid: NormalizedUUID) -> BLEServiceType {
        switch uuid.normalizedShortForm {
        case "180D": return .heartRate
        case "180F": return .battery
        case "180A": return .deviceInformation
        case "1814": return .runningSpeedAndCadence
        case "1822": return .pulseOximeter
        case "FE59": return .dfu

        default: return .custom(uuid.uuidString)
        }
    }
}
