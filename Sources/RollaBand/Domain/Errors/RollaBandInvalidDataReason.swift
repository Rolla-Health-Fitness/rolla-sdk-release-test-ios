import Foundation

public enum RollaBandInvalidDataReason: Sendable {
    case noResponse
    case emptyResponse
    case missingStatusByte
    case responseTooShort(expected: Int, actual: Int)
    case wrongLength(expected: Int, actual: Int)
    case unexpectedStatusByte(UInt8)
    case commandEchoMismatch(expected: UInt8, actual: UInt8)
    case checksumMismatch(expected: UInt8, actual: UInt8)
    case malformedData
    case missingRequiredField(String)
    case invalidGender(UInt8)
    case invalidAge(UInt8)
    case invalidHeight(UInt8)
    case invalidWeight(Float)
}

extension RollaBandInvalidDataReason {
    var description: String {
        switch self {
        case .noResponse:
            return "No response received"
        case .emptyResponse:
            return "Empty response received"
        case .missingStatusByte:
            return "Missing status byte"
        case .responseTooShort(let expected, let actual):
            return "Response too short (expected ≥\(expected) bytes, got \(actual))"
        case .wrongLength(let expected, let actual):
            return "Wrong data length (expected \(expected) bytes, got \(actual))"
        case .unexpectedStatusByte(let byte):
            return "Unexpected status byte: \(String(format: "0x%02X", byte))"
        case .commandEchoMismatch(let expected, let actual):
            return "Command echo mismatch (expected \(String(format: "0x%02X", expected)), got \(String(format: "0x%02X", actual)))"
        case .checksumMismatch(let expected, let actual):
            return "Checksum mismatch (expected \(String(format: "0x%02X", expected)), got \(String(format: "0x%02X", actual)))"
        case .malformedData:
            return "Malformed data"
        case .missingRequiredField(let field):
            return "Missing required field: \(field)"
        case .invalidGender(let value):
            return "Invalid gender value: \(value) (expected 0 or 1)"
        case .invalidAge(let value):
            return "Invalid age value: \(value)"
        case .invalidHeight(let value):
            return "Invalid height value: \(value)"
        case .invalidWeight(let value):
            return "Invalid weight value: \(value)"
        }
    }
}
