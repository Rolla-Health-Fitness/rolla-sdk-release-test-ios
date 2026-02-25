import Foundation

public struct ReconnectionStrategy: Sendable {
    public let deviceId: BLEDeviceIdentifier
    public let shouldReconnect: Bool
    public let delay: TimeInterval
    public let timeout: TimeInterval
    public let attemptNumber: Int
    public let maxAttempts: Int
    
    public init(
        deviceId: BLEDeviceIdentifier,
        shouldReconnect: Bool,
        delay: TimeInterval = 0,
        timeout: TimeInterval = 30,
        attemptNumber: Int = 1,
        maxAttempts: Int = 5
    ) {
        self.deviceId = deviceId
        self.shouldReconnect = shouldReconnect
        self.delay = delay
        self.timeout = timeout
        self.attemptNumber = attemptNumber
        self.maxAttempts = maxAttempts
    }
}

public enum ReconnectionResult: Sendable {
    case success(deviceId: BLEDeviceIdentifier, attemptNumber: Int, totalDuration: TimeInterval)
    case failure(deviceId: BLEDeviceIdentifier, attemptNumber: Int, error: Error)
    case cancelled(deviceId: BLEDeviceIdentifier)
    case maxAttemptsReached(deviceId: BLEDeviceIdentifier, totalDuration: TimeInterval)
}
