import Foundation

public enum AsyncRequestError: Error, Equatable, LocalizedError {
    case cancelled
    case timeout
    case superseded
    case notRegistered
    case alreadyWaiting
    case managerDeallocated
    case matcherFailed(String)
    case invalidState
    case deviceDisconnected(BLEDeviceIdentifier)

    public var errorDescription: String? {
        switch self {
        case .cancelled:
            return "The request was cancelled"
        case .timeout:
            return "The request timed out"
        case .superseded:
            return "The request was superseded by a newer request"
        case .notRegistered:
            return "No request found with the specified key"
        case .alreadyWaiting:
            return "A request is already waiting for this key"
        case .managerDeallocated:
            return "The request manager has been deallocated"
        case .matcherFailed(let reason):
            return "Request matcher failed: \(reason)"
        case .invalidState:
            return "The request is in an invalid state"
        case .deviceDisconnected(let deviceId):
            return "Device disconnected during request: \(deviceId.uuidString)"
        }
    }
}
