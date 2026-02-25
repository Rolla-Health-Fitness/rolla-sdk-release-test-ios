import Foundation

public enum SleepStageValue: String, Codable, Sendable, Equatable {
    case deep
    case light
    case rem
    case awake
    
    static func from(_ value: UInt8) -> SleepStageValue {
        switch value {
        case 1:
            return .deep
        case 2:
            return .light
        case 3:
            return .rem
        default:
            return .awake
        }
    }
}
