import Foundation

public enum WorkoutSessionError: Error, Sendable {
    case noActiveSession
    case sessionAlreadyActive
    case deviceNotFound(String)
    case activityStartFailed(String)
    case activityStopFailed(String)
    case observationStartFailed(Error)
    case reconnectionFailed(Error)
    case invalidDeviceState

    var code: String {
        switch self {
        case .noActiveSession:
            return "no_active_session"
        case .sessionAlreadyActive:
            return "session_already_active"
        case .deviceNotFound:
            return "device_not_found"
        case .activityStartFailed:
            return "activity_start_failed"
        case .activityStopFailed:
            return "activity_stop_failed"
        case .observationStartFailed:
            return "observation_start_failed"
        case .reconnectionFailed:
            return "reconnection_failed"
        case .invalidDeviceState:
            return "invalid_device_state"
        }
    }
}
