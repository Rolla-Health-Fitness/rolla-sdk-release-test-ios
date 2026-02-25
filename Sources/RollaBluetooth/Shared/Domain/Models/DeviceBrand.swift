import Foundation

public enum DeviceBrand: Sendable, Hashable, Equatable {
    case rolla
    case wahoo
    case garmin
    case tacx
    case polar
    case suunto
    case apple
    case unknown
    case custom(String)
    
    public var rawValue: String {
        switch self {
        case .rolla: return "Rolla"
        case .wahoo: return "Wahoo"
        case .garmin: return "Garmin"
        case .tacx: return "Tacx"
        case .polar: return "Polar"
        case .suunto: return "Suunto"
        case .apple: return "Apple"
        case .unknown: return "Unknown"
        case .custom(let name): return name
        }
    }
    
    public init(rawValue: String) {
        switch rawValue {
        case "Rolla": self = .rolla
        case "Wahoo": self = .wahoo
        case "Garmin": self = .garmin
        case "Tacx": self = .tacx
        case "Polar": self = .polar
        case "Suunto": self = .suunto
        case "Apple": self = .apple
        case "Unknown": self = .unknown
        default: self = .custom(rawValue)
        }
    }
    
    public static var allCases: [DeviceBrand] {
        return [
            .rolla,
            .wahoo,
            .garmin,
            .tacx,
            .polar,
            .suunto,
            .apple,
            .unknown
        ]
    }
}
