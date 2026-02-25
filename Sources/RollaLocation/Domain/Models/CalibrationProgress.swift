import Foundation

public struct CalibrationProgress: Sendable {
    let timeProgress: Double
    let pointsProgress: Double      
    let pointsCollected: Int
    let pointsRequired: Int
    let remainingTime: Double       // seconds
    let isStable: Bool
}
