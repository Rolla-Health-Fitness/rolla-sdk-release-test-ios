import Foundation

/// How the live session was running when
/// ``RollaDelegate/rollaDidStartActivity(_:activity:)`` fired.
public enum RollaActivityStartOrigin: String {
    /// A brand-new live-tracked session the user just started.
    case fresh
    /// A session restored after the app terminated mid-activity (crash, kill).
    /// The started event re-fires with this origin so a host whose in-memory
    /// state died with the app can re-sync; key on `activityId` to dedupe it
    /// against the original `fresh` event.
    case crashRecovery
    /// The SDK sent an origin this version does not recognize (forward-compat).
    case unknown
}

/// Payload of ``RollaDelegate/rollaDidStartActivity(_:activity:)``.
///
/// Fires when a live tracking session begins running — a fresh start or a
/// crash-recovery resume (``origin`` says which). Manual activities never
/// fire it (they are logged after the fact and enter the lifecycle at
/// `finished`), and pausing/resuming inside a session fires nothing. Every
/// started activity terminates in an activity-completed `finished` or an
/// activity-removed event; the two can arrive in **different app sessions**
/// when the app dies in between. Two exceptions are cleaned up silently,
/// without an event: a session abandoned mid-tracking for over a day, and an
/// interrupted session neither resumed nor discarded before the user starts
/// their next activity.
public struct RollaStartedActivity {
    public let activityId: String
    /// Base activity type (e.g. `walk`, `run`, `cycling`, `cardio`).
    public let type: String?
    public let startTime: Date?
    public let origin: RollaActivityStartOrigin
    public let catalogId: String?

    /// Build from the method-channel wire map. Unknown enum strings map to
    /// `.unknown` so older host integrations keep working; a malformed payload
    /// never throws.
    static func from(_ arguments: Any?) -> RollaStartedActivity {
        let map = arguments as? [String: Any] ?? [:]
        return RollaStartedActivity(
            activityId: map["activityId"] as? String ?? "",
            type: map["type"] as? String,
            startTime: (map["startTime"] as? String).flatMap(parseDate),
            origin: RollaActivityStartOrigin(rawValue: map["origin"] as? String ?? "") ?? .unknown,
            catalogId: map["catalogId"] as? String
        )
    }

    // Dual ISO8601 parsing — same rationale as RollaSyncResult.parseDate:
    // Dart's toIso8601String() emits fractional or whole-second timestamps.
    private static let isoFractionalFormatter: ISO8601DateFormatter = {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return f
    }()

    private static let isoPlainFormatter: ISO8601DateFormatter = {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime]
        return f
    }()

    private static func parseDate(_ raw: String) -> Date? {
        isoFractionalFormatter.date(from: raw) ?? isoPlainFormatter.date(from: raw)
    }
}
