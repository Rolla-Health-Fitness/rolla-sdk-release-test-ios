import Foundation

public enum RollaError: Error, LocalizedError {
    case engineFailedToStart
    case initializationFailed(String)
    case flutterError(code: String, message: String)
    case alreadyPresenting
    case invalidPresentationContext
    case underlying(Error)
    case unknown

    public var code: String {
        switch self {
        case .engineFailedToStart: return "ENGINE_FAILED"
        case .initializationFailed: return "INIT_FAILED"
        case .flutterError: return "FLUTTER_ERROR"
        case .alreadyPresenting: return "ALREADY_PRESENTING"
        case .invalidPresentationContext: return "INVALID_CONTEXT"
        case .underlying: return "UNDERLYING_ERROR"
        case .unknown: return "UNKNOWN"
        }
    }

    public var errorDescription: String? {
        switch self {
        case .engineFailedToStart:
            return "The Flutter engine failed to start."
        case .initializationFailed(let message):
            return "SDK initialization failed: \(message)"
        case .flutterError(let code, let message):
            return "Flutter error [\(code)]: \(message)"
        case .alreadyPresenting:
            return "Rolla is already presenting."
        case .invalidPresentationContext:
            return "The presentation context is not available."
        case .underlying(let error):
            return error.localizedDescription
        case .unknown:
            return "An unknown error occurred."
        }
    }

    public var failureReason: String? {
        switch self {
        case .alreadyPresenting:
            return "The SDK UI is already on screen."
        case .invalidPresentationContext:
            return "The presenting view controller is not in the window hierarchy."
        default:
            return nil
        }
    }

    public var recoverySuggestion: String? {
        switch self {
        case .alreadyPresenting:
            return "Dismiss the current Rolla UI before presenting again."
        case .invalidPresentationContext:
            return "Ensure the view controller is visible before presenting."
        default:
            return nil
        }
    }
}

