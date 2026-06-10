import Foundation

public enum AppleHealthError: Error, Sendable, Equatable {
    case notAvailable
    case invalidDateRange
    case unsupportedDataType(DataType)
    case queryFailed(String)
    case authorizationFailed(String)
    
    public static func == (lhs: AppleHealthError, rhs: AppleHealthError) -> Bool {
        switch (lhs, rhs) {
        case (.notAvailable, .notAvailable):
            return true
        case (.invalidDateRange, .invalidDateRange):
            return true
        case (.unsupportedDataType(let l), .unsupportedDataType(let r)):
            return l == r
        case (.queryFailed(let l), .queryFailed(let r)):
            return l == r
        case (.authorizationFailed(let l), .authorizationFailed(let r)):
            return l == r
        default:
            return false
        }
    }
}

extension AppleHealthError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notAvailable:
            return "HealthKit is not available on this device"
        case .invalidDateRange:
            return "Start date must be before or equal to end date"
        case .unsupportedDataType(let dataType):
            return "Data type '\(dataType.rawValue)' is not supported for this operation"
        case .queryFailed(let message):
            return "Health query failed: \(message)"
        case .authorizationFailed(let message):
            return "Authorization failed: \(message)"
        }
    }
}

