import Foundation

public struct CalibrationProgress: Sendable {
    public let timeProgress: Double
    public let pointsProgress: Double
    public let pointsCollected: Int
    public let pointsRequired: Int
    public let remainingTime: Double       // seconds
    public let isStable: Bool
}
