import Foundation

public enum BLECentralError: Error, LocalizedError {
    case bluetoothPoweredOff
    case connectionFailed(BLEDeviceIdentifier, Error?)
    case alreadyScanning
    case scanDurationTooShort
    case bluetoothUnauthorized
    case bluetoothUnsupported
    case bluetoothResetting
    case unknown

    public var errorDescription: String? {
        switch self {
        case .bluetoothPoweredOff:
            return "Bluetooth is powered off"
        case .connectionFailed(let deviceID, let error):
            if let error {
                return "Connection failed for device \(deviceID.uuidString): \(error.localizedDescription)"
            } else {
                return "Connection failed for device \(deviceID.uuidString)"
            }
        case .alreadyScanning:
            return "Bluetooth scan is already in progress"
        case .scanDurationTooShort:
            return "Scan duration is too short (minimum 1 second)"
        case .bluetoothUnauthorized:
            return "Bluetooth access is not authorized"
        case .bluetoothUnsupported:
            return "Bluetooth is not supported on this device"
        case .bluetoothResetting:
            return "Bluetooth is resetting"
        case .unknown:
            return "Unknown Bluetooth error"
        }
    }

    public var code: String {
        switch self {
        case .bluetoothPoweredOff: return "bluetooth_powered_off"
        case .connectionFailed: return "connection_failed"
        case .alreadyScanning: return "already_scanning"
        case .scanDurationTooShort: return "scan_duration_too_short"
        case .bluetoothUnauthorized: return "bluetooth_unauthorized"
        case .bluetoothUnsupported: return "bluetooth_unsupported"
        case .bluetoothResetting: return "bluetooth_resetting"
        case .unknown: return "unknown_error"
        }
    }
}
