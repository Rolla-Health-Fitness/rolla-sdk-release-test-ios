import Foundation

public enum ChargingState: Sendable {
    case charging
    case notCharging
}

public struct ChargingStateData: Sendable {
    public let state: ChargingState
    public let deviceUUID: BLEDeviceIdentifier
    public let timestamp: Date
    
    public init(
        state: ChargingState,
        deviceUUID: BLEDeviceIdentifier,
        timestamp: Date = Date()
    ) {
        self.state = state
        self.deviceUUID = deviceUUID
        self.timestamp = timestamp
    }
}

