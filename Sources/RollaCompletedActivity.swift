import Foundation

/// The lifecycle phase an in-SDK activity has reached when
/// ``RollaDelegate/rollaDidCompleteActivity(_:activity:)`` fires.
///
/// One activity emits up to three events, keyed by phase. Treat
/// `(activityId, phase)` as the idempotency key: ``uploaded`` and
/// ``uploadFailed`` can re-fire across retries (e.g. the engine died after the
/// server accepted an upload but before the pending marker cleared).
public enum RollaActivityPhase: String {
    /// Saved/finished locally inside the SDK. Instant signal — the backend has
    /// NOT confirmed it yet, so anything the host does now may need
    /// reconciling on ``uploadFailed``.
    case finished
    /// The backend confirmed the activity (the user's source of truth). May
    /// arrive much later than ``finished`` when the first upload attempt
    /// failed and a later in-SDK sync retried it.
    case uploaded
    /// The upload gave up permanently — the activity is not in the backend and
    /// will no longer be retried. Reconcile whatever was done on ``finished``.
    case uploadFailed
    /// The SDK sent a phase this version does not recognize (forward-compat).
    case unknown
}

/// How a completed activity was produced inside the SDK.
public enum RollaActivitySource: String {
    /// Recorded live with the tracker (band or phone sensors).
    case rolla
    /// Entered manually by the user.
    case manual
    /// The source could not be determined (forward-compat).
    case unknown
}

/// Payload of ``RollaDelegate/rollaDidCompleteActivity(_:activity:)``.
///
/// Field vocabulary mirrors the Partner API activity summary.
public struct RollaCompletedActivity {
    public let activityId: String
    public let phase: RollaActivityPhase
    public let source: RollaActivitySource
    public let catalogId: String?
    /// Base activity type (e.g. `walk`, `run`, `cycling`, `cardio`).
    public let type: String?
    /// `outdoor` or `indoor`.
    public let environment: String?
    /// Catalog category (e.g. `cardio`).
    public let category: String?
    public let totalDurationS: Int?
    public let totalDistanceM: Double?
    public let totalCalories: Double?
    public let startTime: Date?
    public let endTime: Date?

    /// Build from the method-channel wire map. Unknown enum strings map to
    /// their `.unknown` case so older host integrations keep working; a
    /// malformed payload never throws.
    static func from(_ arguments: Any?) -> RollaCompletedActivity {
        let map = arguments as? [String: Any] ?? [:]
        return RollaCompletedActivity(
            activityId: map["activityId"] as? String ?? "",
            phase: RollaActivityPhase(rawValue: map["phase"] as? String ?? "") ?? .unknown,
            source: RollaActivitySource(rawValue: map["source"] as? String ?? "") ?? .unknown,
            catalogId: map["catalogId"] as? String,
            type: map["type"] as? String,
            environment: map["environment"] as? String,
            category: map["category"] as? String,
            totalDurationS: map["totalDurationS"] as? Int,
            totalDistanceM: (map["totalDistanceM"] as? NSNumber)?.doubleValue,
            totalCalories: (map["totalCalories"] as? NSNumber)?.doubleValue,
            startTime: (map["startTime"] as? String).flatMap(parseDate),
            endTime: (map["endTime"] as? String).flatMap(parseDate)
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
