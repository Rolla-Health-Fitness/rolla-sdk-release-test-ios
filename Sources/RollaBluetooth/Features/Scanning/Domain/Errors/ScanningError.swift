import Foundation

public enum ScanningError: Error, LocalizedError {
    case alreadyScanning(sessionOwner: String)
    case noActiveSession
    case sessionNotFound(UUID)

    public var code: String {
        switch self {
        case .alreadyScanning:
            return "already_scanning"
        case .noActiveSession:
            return "no_active_session"
        case .sessionNotFound:
            return "session_not_found"
        }
    }

    public var errorDescription: String? {
        switch self {
        case .alreadyScanning(let owner):
            return "Scanning is already in progress (owned by: \(owner)). Stop current scan before starting a new one."
        case .noActiveSession:
            return "No active scanning session found."
        case .sessionNotFound(let id):
            return "Scanning session with ID \(id) not found."
        }
    }
}
