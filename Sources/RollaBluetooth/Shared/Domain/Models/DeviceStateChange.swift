import Foundation

public struct DeviceStateChange: Sendable, Equatable {
    public let deviceUUID: BLEDeviceIdentifier
    public let currentState: DeviceState
    public let previousState: DeviceState?
    public let disconnectionReason: DisconnectionReason?
    public let timestamp: Date
    
    public init(
        deviceId: BLEDeviceIdentifier,
        currentState: DeviceState,
        previousState: DeviceState?,
        disconnectionReason: DisconnectionReason? = nil,
        timestamp: Date = Date()
    ) {
        self.deviceUUID = deviceId
        self.currentState = currentState
        self.previousState = previousState
        self.disconnectionReason = disconnectionReason
        self.timestamp = timestamp
    }
}
