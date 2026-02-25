import Foundation

enum UpdateFirmwareError: Error, LocalizedError {
    case updateAlreadyInProgress
    
    var code: String {
        switch self {
        case .updateAlreadyInProgress:
            return "update_already_in_progress"
        }
    }
}
