import Foundation

public struct HeartRateData: Sendable, Equatable {
    public let deviceUUID: BLEDeviceIdentifier
    public let heartRate: Int
    public let timestamp: Date
    
    public init(
        deviceUUID: BLEDeviceIdentifier,
        heartRate: Int,
        timestamp: Date = Date()
    ) {
        self.deviceUUID = deviceUUID
        self.heartRate = heartRate
        self.timestamp = timestamp
    }
}

