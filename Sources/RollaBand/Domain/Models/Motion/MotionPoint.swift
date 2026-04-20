import Foundation

public struct MotionPoint: Sendable, Equatable {
    public let timestamp: Int
    public let heartRate: Int
    public let spm: Int
    public let identifier: Int?

    public init(timestamp: Int, heartRate: Int, spm: Int, identifier: Int? = nil) {
        self.timestamp = timestamp
        self.heartRate = heartRate
        self.spm = spm
        self.identifier = identifier
    }
}

