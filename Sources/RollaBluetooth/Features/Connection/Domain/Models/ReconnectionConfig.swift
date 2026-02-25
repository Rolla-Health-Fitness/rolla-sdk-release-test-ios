import Foundation

public struct ReconnectionConfig: Sendable {
    public let maxAttempts: Int
    public let initialDelay: TimeInterval
    public let maxDelay: TimeInterval
    public let multiplier: Double
    public let autoReconnectEnabled: Bool

    public init(
        maxAttempts: Int = 3,
        initialDelay: TimeInterval = 2.0,
        maxDelay: TimeInterval = 10.0,
        multiplier: Double = 1.5,
        autoReconnectEnabled: Bool = false
    ) {
        self.maxAttempts = maxAttempts
        self.initialDelay = initialDelay
        self.maxDelay = maxDelay
        self.multiplier = multiplier
        self.autoReconnectEnabled = autoReconnectEnabled
    }
}

