import Foundation

public enum BLEPeripheralError: Error, LocalizedError {
    case invalidUUIDFormat(String)
    case notConnected(String)
    case deviceNotFound(String)
    case serviceNotFound(String)
    case characteristicNotFound(String)
    case notificationsNotSupported(String)
    case writeNotSupported(String, BLECharacteristicWriteType)
    case readNotSupported(String)
    case disconnected
    case timeout
    case unknown(String)

    case noData
    case operationTimeout(String, String)
    case unsupportedOperation(String, BLECharacteristicProperty)
    case invalidData(String, String)
    case deviceBusy(String)
    case cacheOperationFailed(String)
    case invalidDeviceState(String, String)
    case unexpectedResult(String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidUUIDFormat(let deviceID):
            return "Invalid UUID format for device \(deviceID)"
        case .notConnected(let deviceID):
            return "Device \(deviceID) is not connected"
        case .deviceNotFound(let deviceID):
            return "Device \(deviceID) not found"
        case .serviceNotFound(let serviceID):
            return "Service \(serviceID) not found"
        case .characteristicNotFound(let characteristicID):
            return "Characteristic \(characteristicID) not found"
        case .notificationsNotSupported(let characteristicID):
            return "Notifications not supported for characteristic \(characteristicID)"
        case .writeNotSupported(let characteristicID, let writeType):
            return "Write type \(writeType) not supported for characteristic \(characteristicID)"
        case .readNotSupported(let characteristicID):
            return "Read not supported for characteristic \(characteristicID)"
        case .disconnected:
            return "Device disconnected unexpectedly"
        case .timeout:
            return "Operation timed out"
        case .unknown(let message):
            return "Unknown peripheral error: \(message)"
        case .noData:
            return "No data received from characteristic"
        case .operationTimeout(let deviceID, let operation):
            return "Operation '\(operation)' timed out on device \(deviceID)"
        case .unsupportedOperation(let deviceID, let property):
            return "Device \(deviceID) does not support \(property.rawValue) operation"
        case .invalidData(let deviceID, let reason):
            return "Invalid data from device \(deviceID): \(reason)"
        case .deviceBusy(let deviceID):
            return "Device \(deviceID) is busy with another operation"
        case .cacheOperationFailed(let reason):
            return "Cache operation failed: \(reason)"
        case .invalidDeviceState(let deviceID, let reason):
            return "Invalid state for device \(deviceID): \(reason)"
        case .unexpectedResult(let description):
            return "Unexpected operation result: \(description)"
        }
    }
    
    public var code: String {
        switch self {
        case .invalidUUIDFormat: return "invalid_uuid_format"
        case .notConnected: return "not_connected"
        case .deviceNotFound: return "device_not_found"
        case .serviceNotFound: return "service_not_found"
        case .characteristicNotFound: return "characteristic_not_found"
        case .notificationsNotSupported: return "notifications_not_supported"
        case .writeNotSupported: return "write_not_supported"
        case .readNotSupported: return "read_not_supported"
        case .disconnected: return "disconnected"
        case .timeout: return "timeout"
        case .unknown: return "unknown_error"
        case .noData: return "no_data"
        case .operationTimeout: return "operation_timeout"
        case .unsupportedOperation: return "unsupported_operation"
        case .invalidData: return "invalid_data"
        case .deviceBusy: return "device_busy"
        case .cacheOperationFailed: return "cache_operation_failed"
        case .invalidDeviceState: return "invalid_device_state"
        case .unexpectedResult: return "unexpected_result"
        }
    }
}
