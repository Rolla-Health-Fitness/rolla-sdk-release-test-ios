import Foundation

public enum BLEDeviceType: Sendable, Hashable, Equatable {
    case heartRateSensor
    case footPod
    case bikeTrainer
    case band
    case watch
    case rscSensor
    case speedSensor
    case powerMeter
    case unknown
    case custom(String)

    public var rawValue: String {
        switch self {
        case .heartRateSensor: return "heart_rate_sensor"
        case .footPod: return "foot_pod"
        case .bikeTrainer: return "bike_trainer"
        case .band: return "band"
        case .watch: return "watch"
        case .rscSensor: return "rsc_sensor"
        case .speedSensor: return "speed_sensor"
        case .powerMeter: return "power_meter"
        case .unknown: return "unknown"
        case .custom(let type): return type
        }
    }

    public init(rawValue: String) {
        switch rawValue {
        case "heart_rate_sensor": self = .heartRateSensor
        case "foot_pod": self = .footPod
        case "bike_trainer": self = .bikeTrainer
        case "band": self = .band
        case "watch": self = .watch
        case "rsc_sensor": self = .rscSensor
        case "speed_sensor": self = .speedSensor
        case "power_meter": self = .powerMeter
        case "unknown": self = .unknown
        default: self = .custom(rawValue)
        }
    }

    public static var allCases: [BLEDeviceType] {
        return [.heartRateSensor, .footPod, .bikeTrainer, .band, .watch, .rscSensor, .speedSensor, .powerMeter, .unknown]
    }
}
