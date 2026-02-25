import Foundation

public enum BLEConnectionError: Error, LocalizedError {
    case alreadyConnected(BLEDeviceIdentifier)
    case alreadyDisconnected(BLEDeviceIdentifier)
    case connectionInProgress(BLEDeviceIdentifier)
    case disconnectionInProgress(BLEDeviceIdentifier)
    case connectionTimeout(BLEDeviceIdentifier, TimeInterval)
    case deviceNotReady(BLEDeviceIdentifier, String)
    case bluetoothNotReady(CBBluetoothState)
    case invalidConnectionState(BLEDeviceIdentifier, String)
    case connectionLost(BLEDeviceIdentifier)
    case disconnectionFailed(BLEDeviceIdentifier, Error?)
    case deviceNotConnected(BLEDeviceIdentifier)
    case unknown(BLEDeviceIdentifier, String?)

    public var errorDescription: String? {
        switch self {
        case .alreadyConnected(let deviceUUID):
            return "Device \(deviceUUID.uuidString) is already connected"
        case .alreadyDisconnected(let deviceUUID):
            return "Device \(deviceUUID.uuidString) is already disconnected"
        case .connectionInProgress(let deviceUUID):
            return "Connection to device \(deviceUUID.uuidString) is already in progress"
        case .disconnectionInProgress(let deviceUUID):
            return "Disconnection from device \(deviceUUID.uuidString) is already in progress"
        case .connectionTimeout(let deviceUUID, let timeout):
            return "Connection to device \(deviceUUID.uuidString) timed out after \(timeout) seconds"
        case .deviceNotReady(let deviceUUID, let reason):
            return "Device \(deviceUUID.uuidString) is not ready for connection: \(reason)"
        case .bluetoothNotReady(let state):
            return "Bluetooth is not ready for connection. Current state: \(state)"
        case .invalidConnectionState(let deviceUUID, let reason):
            return "Invalid connection state for device \(deviceUUID.uuidString): \(reason)"
        case .connectionLost(let deviceUUID):
            return "Connection to device \(deviceUUID.uuidString) was lost unexpectedly"
        case .disconnectionFailed(let deviceUUID, let underlyingError):
            let errorDetail = underlyingError?.localizedDescription ?? "Unknown reason"
            return "Failed to disconnect from device \(deviceUUID.uuidString): \(errorDetail)"
        case .deviceNotConnected(let deviceUUID):
            return "Device \(deviceUUID.uuidString) is not connected"
        case .unknown(let deviceUUID, let reason):
            let reasonDetail = reason ?? "Unknown error"
            return "Unknown connection error for device \(deviceUUID.uuidString): \(reasonDetail)"
        }
    }

    public var code: String {
        switch self {
        case .alreadyConnected:
            return "already_connected"
        case .alreadyDisconnected:
            return "already_disconnected"
        case .connectionInProgress:
            return "connection_in_progress"
        case .disconnectionInProgress:
            return "disconnection_in_progress"
        case .connectionTimeout:
            return "connection_timeout"
        case .deviceNotReady:
            return "device_not_ready"
        case .bluetoothNotReady:
            return "bluetooth_not_ready"
        case .invalidConnectionState:
            return "invalid_connection_state"
        case .connectionLost:
            return "connection_lost"
        case .disconnectionFailed:
            return "disconnection_failed"
        case .deviceNotConnected:
            return "device_not_connected"
        case .unknown:
            return "unknown_error"
        }
    }

    public var deviceUUID: BLEDeviceIdentifier? {
        switch self {
        case .alreadyConnected(let uuid),
             .alreadyDisconnected(let uuid),
             .connectionInProgress(let uuid),
             .disconnectionInProgress(let uuid),
             .deviceNotConnected(let uuid),
             .connectionTimeout(let uuid, _),
             .deviceNotReady(let uuid, _),
             .invalidConnectionState(let uuid, _),
             .connectionLost(let uuid),
             .disconnectionFailed(let uuid, _),
             .unknown(let uuid, _):
            return uuid
        case .bluetoothNotReady:
            return nil
        }
    }
}
