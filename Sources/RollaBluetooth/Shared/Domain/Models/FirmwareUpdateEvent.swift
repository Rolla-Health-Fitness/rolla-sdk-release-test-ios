import Foundation

public enum FirmwareUpdateEvent: Sendable {
    case preparationStarted(deviceId: BLEDeviceIdentifier)
    case preparationCompleted(deviceId: BLEDeviceIdentifier)
    case preparationFailed(deviceId: BLEDeviceIdentifier, error: String)
    case updateStarted(deviceId: BLEDeviceIdentifier)
    case progressChanged(deviceId: BLEDeviceIdentifier, progress: Int, stage: String)
    case updateCompleted(deviceId: BLEDeviceIdentifier)
    case updateFailed(deviceId: BLEDeviceIdentifier, error: String)
    case updateAborted(deviceId: BLEDeviceIdentifier)
}
