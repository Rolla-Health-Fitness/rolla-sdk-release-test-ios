import Foundation

public enum LocationInvalidReason: Sendable {
    case negativeAccuracy(accuracy: Double)
    case accuracyTooLow(accuracy: Double, maxAccuracy: Double)
    case nullIslandCoordinates
    case invalidLatitude(latitude: Double)
    case invalidLongitude(longitude: Double)
    case locationTooOld(age: TimeInterval, maxAge: TimeInterval)
    case futureTimestamp(timeDiff: TimeInterval)
}
