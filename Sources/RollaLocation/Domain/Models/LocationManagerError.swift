import Foundation

public enum LocationManagerError: Error, LocalizedError, Sendable {
    case notAuthorized
    case trackingAlreadyStarted

    public var errorDescription: String? {
        switch self {
        case .notAuthorized:
            return "Location permission not authorized"
        case .trackingAlreadyStarted:
            return "Location tracking is already active"
        }
    }
    
    public var code: String {
        switch self {
        case .notAuthorized:
            return "not_authorized"
        case .trackingAlreadyStarted:
            return "location_tracking_already_started"
        }
    }
}
