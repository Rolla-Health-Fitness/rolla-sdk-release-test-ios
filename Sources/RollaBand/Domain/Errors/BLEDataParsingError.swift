import Foundation

public enum BLEDataParsingError: Error, Sendable {
    case parsingFailed(String)
    case invalidData(String)
    case insufficientData(String)
    case invalidFormat(String)
    case timestampParsingFailed(String)
    
    public var localizedDescription: String {
        switch self {
        case .parsingFailed(let reason):
            return "Parsing failed: \(reason)"
        case .invalidData(let reason):
            return "Invalid data: \(reason)"
        case .insufficientData(let reason):
            return "Insufficient data: \(reason)"
        case .invalidFormat(let reason):
            return "Invalid format: \(reason)"
        case .timestampParsingFailed(let reason):
            return "Timestamp parsing failed: \(reason)"
        }
    }
    
    public var code: String {
        switch self {
        case .parsingFailed:
            return "parsing_failed"
        case .invalidData:
            return "invalid_data"
        case .insufficientData:
            return "insufficient_data"
        case .invalidFormat:
            return "invalid_format"
        case .timestampParsingFailed:
            return "timestamp_parsing_failed"
        }
    }
}
