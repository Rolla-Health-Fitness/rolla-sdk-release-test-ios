import Foundation

public enum RollaBandCommandError: Error, LocalizedError, Sendable {
    case failure(command: RollaBandCommand, response: Data)
    case invalidData(command: RollaBandCommand, reason: RollaBandInvalidDataReason, raw: Data?)
    case timeout(command: RollaBandCommand, duration: TimeInterval)
    case writeOperationFailed(command: RollaBandCommand, underlying: Error)
    case deviceDisconnected(command: RollaBandCommand)
    case deviceRejectedCommand(command: RollaBandCommand, statusByte: UInt8)
    case unexpectedStatus(command: RollaBandCommand, expected: [RollaBandStatusByte], actual: RollaBandStatusByte)
    
    public var errorDescription: String? {
        switch self {
        case .failure(let command, let response):
            return "\(command.name) command failed with response: \(response.hexString)"
        case .invalidData(let command, let reason, let raw):
            let rawStr = raw?.hexString ?? "nil"
            return "\(command.name) invalid data: \(reason.description) (raw: \(rawStr))"
        case .timeout(let command, let duration):
            return "\(command.name) command timeout after \(duration)s"
        case .writeOperationFailed(let command, let underlying):
            return "\(command.name) write operation failed: \(underlying.localizedDescription)"
        case .deviceDisconnected(let command):
            return "Device disconnected during \(command.name) command"
        case .deviceRejectedCommand(let command, let statusByte):
            return "Device rejected \(command.name) command (status: \(String(format: "0x%02X", statusByte)))"
        case .unexpectedStatus(let command, let expected, let actual):
            let expectedStr = expected.map { String(format: "0x%02X", $0.rawValue) }.joined(separator: ", ")
            return "\(command.name) unexpected status (expected [\(expectedStr)], got \(String(format: "0x%02X", actual.rawValue)))"
        }
    }
    
    var command: RollaBandCommand {
        switch self {
        case .failure(let command, _),
                .invalidData(let command, _, _),
                .timeout(let command, _),
                .writeOperationFailed(let command, _),
                .deviceDisconnected(let command),
                .deviceRejectedCommand(let command, _),
                .unexpectedStatus(let command, _, _):
            return command
        }
    }
    
    var isRetryable: Bool {
        switch self {
        case .deviceDisconnected, .deviceRejectedCommand:
            return false
        case .writeOperationFailed, .timeout:
            return true
        case .invalidData(_, let reason, _):
            switch reason {
            case .unexpectedStatusByte(_):
                return false
            case .wrongLength(_, _):
                return true
            case .checksumMismatch:
                return true
            default:
                return true
            }
        case .failure, .unexpectedStatus:
            return false
        }
    }
}

extension RollaBandCommandError {
    static func noResponse(command: RollaBandCommand) -> RollaBandCommandError {
        return .invalidData(command: command, reason: .noResponse, raw: nil)
    }
    
    static func responseTooShort(command: RollaBandCommand, expected: Int, actual: Int) -> RollaBandCommandError {
        return .invalidData(command: command, reason: .responseTooShort(expected: expected, actual: actual), raw: nil)
    }
    
    static func commandEchoMismatch(command: RollaBandCommand, expected: UInt8, actual: UInt8, raw: Data?) -> RollaBandCommandError {
        return .invalidData(command: command, reason: .commandEchoMismatch(expected: expected, actual: actual), raw: raw)
    }
    
    static func invalidStatusByte(command: RollaBandCommand, statusByte: UInt8, raw: Data?) -> RollaBandCommandError {
        return .invalidData(command: command, reason: .unexpectedStatusByte(statusByte), raw: raw)
    }
    
    static func checksumMismatch(command: RollaBandCommand, expected: UInt8, actual: UInt8, raw: Data?) -> RollaBandCommandError {
        return .invalidData(command: command, reason: .checksumMismatch(expected: expected, actual: actual), raw: raw)
    }
    
    static func malformedData(command: RollaBandCommand, description: String, raw: Data?) -> RollaBandCommandError {
        return .invalidData(command: command, reason: .malformedData, raw: raw)
    }
}

private extension Data {
    var hexString: String {
        return map { String(format: "%02X", $0) }.joined(separator: " ")
    }
}
