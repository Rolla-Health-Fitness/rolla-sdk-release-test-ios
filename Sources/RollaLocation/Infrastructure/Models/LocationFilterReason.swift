import Foundation

public enum LocationFilterReason: Sendable {
    case tooCloseToLastLocation(distance: Double, time: TimeInterval)
    case unrealisticSpeed(speed: Double, maxSpeed: Double)
    case outOfOrderTimestamp(timeDiff: TimeInterval)
    case accuracyNotImproved(currentAccuracy: Double, lastAccuracy: Double)
    case distanceJumpTooLarge(distance: Double, timeInterval: TimeInterval)
}
