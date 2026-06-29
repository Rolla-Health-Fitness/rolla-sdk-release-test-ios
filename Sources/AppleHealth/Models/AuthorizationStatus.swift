import Foundation

public enum AHAuthorizationStatus: Sendable, Equatable {
    case success // Authorization was granted (or user was prompted)
    case notAvailable
    case error(String)
}

/// Whether HealthKit would still present its authorization sheet for a set of
/// read types — i.e. whether the app has ever requested them. Mirrors
/// `HKAuthorizationRequestStatus`. For read types HealthKit never reports
/// granted-vs-declined, so the meaningful states are "never requested"
/// (`shouldRequest`) and "already requested" (`unnecessary`); `unknown`
/// covers HealthKit being unavailable or unable to determine the status.
public enum AHReadRequestStatus: Sendable, Equatable {
    case unnecessary
    case shouldRequest
    case unknown
}

