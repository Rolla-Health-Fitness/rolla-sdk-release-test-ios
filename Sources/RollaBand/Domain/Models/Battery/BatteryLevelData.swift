import Foundation

public struct BatteryLevelData: Sendable, Equatable {
    public let deviceUUID: BLEDeviceIdentifier
    public let batteryLevel: Int
    public let timestamp: Int
    
    public init(deviceUUID: BLEDeviceIdentifier, batteryLevel: Int, timestamp: Int = Int(Date().timeIntervalSince1970 * 1000)) {
        self.deviceUUID = deviceUUID
        self.batteryLevel = batteryLevel
        self.timestamp = timestamp
    }
}
