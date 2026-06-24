import Foundation

/// The terminal outcome of a headless ``Rolla/sync(completion:)`` call.
///
/// A sync connects the user's primary data source and uploads anything new,
/// with no SDK UI. The outcome is always one of these — the call never fails
/// silently.
public enum RollaSyncOutcome: String {
    /// The sync ran to completion. ``RollaSyncResult/hasNewData`` says whether
    /// anything new was uploaded.
    case success
    /// Some data uploaded before an error stopped the rest. Reserved for a
    /// future per-stage-aware sync; not emitted today.
    case partial
    /// Nothing was synced and that's expected — see
    /// ``RollaSyncResult/skipReason``. Not an error.
    case skipped
    /// The sync started but failed — see ``RollaSyncResult/error``.
    case failure
    /// The SDK returned an outcome this version does not recognize (forward-compat).
    case unknown
}

/// Which data source a headless sync ran against.
public enum RollaSyncSource: String {
    /// The Rolla band (BLE).
    case band
    /// Apple HealthKit.
    case appleHealth
    /// Android Health Connect (not applicable on iOS, present for parity).
    case healthConnect
    /// Garmin (syncs server-side via OAuth).
    case garmin
    /// Oura (syncs server-side via OAuth).
    case oura
    /// The active source could not be determined.
    case unknown
}

/// Why a headless sync did nothing (only set when ``RollaSyncResult/outcome``
/// is ``RollaSyncOutcome/skipped``).
public enum RollaSyncSkipReason: String {
    /// The user's primary source is the band, but no band is connected/known.
    case noBandConnected
    /// A sync was already in progress, so this call was a no-op.
    case alreadyInProgress
    /// The user's primary source syncs server-side (Garmin/Oura).
    case serverSideSource
    /// The user's primary source is the band, but the Bluetooth runtime
    /// permission has not been granted. A headless sync cannot prompt, so the
    /// host should request it before retrying. The band-battery API reports the
    /// same missing permission as ``RollaBatteryStatus/bluetoothPermissionRequired``
    /// (identical raw value), so a host can map it once across both APIs.
    case bluetoothPermissionRequired
    /// The user's primary source is Apple Health, but HealthKit read
    /// authorization has never been requested/granted for this app. The host
    /// should present the authorization flow before retrying. (HealthKit hides
    /// granted-vs-declined for read types, so this is reported when the app has
    /// never been authorized at all.)
    case appleHealthPermissionRequired
    /// The user's primary source is Health Connect, but read authorization has
    /// not been granted. The host should request it before retrying.
    case healthConnectPermissionRequired
    /// The SDK is not initialized.
    case notInitialized
    /// The device is offline.
    case offline
    /// The SDK returned a reason this version does not recognize (forward-compat).
    case unknown
}

/// Result of ``Rolla/sync(completion:)``.
///
/// ``hasNewData`` is meaningful only for ``RollaSyncOutcome/success`` /
/// ``RollaSyncOutcome/partial``; ``skipReason`` is set only for
/// ``RollaSyncOutcome/skipped``; ``error`` only for ``RollaSyncOutcome/failure``.
public struct RollaSyncResult {
    /// The terminal outcome.
    public let outcome: RollaSyncOutcome
    /// Whether the sync uploaded any new data.
    public let hasNewData: Bool
    /// Which source the sync ran against.
    public let source: RollaSyncSource
    /// When this sync completed on the device. Present only on a successful
    /// sync (nil for `.skipped` / `.failure`). A client-side completion time,
    /// consistent across every source — suitable for a "Last synced at …"
    /// label; not a backend-confirmed write time.
    public let lastSyncAt: Date?
    /// Why the sync did nothing. Non-nil only when ``outcome`` is ``RollaSyncOutcome/skipped``.
    public let skipReason: RollaSyncSkipReason?
    /// The error message if the sync failed. Non-nil only when ``outcome`` is ``RollaSyncOutcome/failure``.
    public let error: String?

    public init(
        outcome: RollaSyncOutcome,
        hasNewData: Bool,
        source: RollaSyncSource,
        lastSyncAt: Date? = nil,
        skipReason: RollaSyncSkipReason? = nil,
        error: String? = nil
    ) {
        self.outcome = outcome
        self.hasNewData = hasNewData
        self.source = source
        self.lastSyncAt = lastSyncAt
        self.skipReason = skipReason
        self.error = error
    }

    /// Whether the sync ran to completion (success or partial).
    public var didRun: Bool {
        outcome == .success || outcome == .partial
    }

    // Two formatters: one that requires fractional seconds, one that forbids
    // them. Dart's `toIso8601String()` emits 3- OR 6-digit fractional seconds
    // (microseconds whenever the DateTime carries sub-millisecond precision),
    // and `ISO8601DateFormatter` with `.withFractionalSeconds` parses both the
    // 3- and 6-digit forms to the correct instant; the no-fractional formatter
    // covers whole-second timestamps. `parseDate` tries fractional first.
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

    /// Build a result from the method-channel wire map
    /// `{ "outcome": String, "hasNewData": Bool, "source": String,
    ///    "lastSyncAt": String?, "skipReason": String?, "error": String? }`.
    /// Unknown enum strings map to their `.unknown` case so older host
    /// integrations keep working.
    static func from(_ response: Any?) -> RollaSyncResult {
        guard let map = response as? [String: Any] else {
            return RollaSyncResult(outcome: .unknown, hasNewData: false, source: .unknown)
        }
        let outcome = RollaSyncOutcome(rawValue: map["outcome"] as? String ?? "") ?? .unknown
        let hasNewData = map["hasNewData"] as? Bool ?? false
        let source = RollaSyncSource(rawValue: map["source"] as? String ?? "") ?? .unknown
        let skipReason: RollaSyncSkipReason? = (map["skipReason"] as? String).map {
            RollaSyncSkipReason(rawValue: $0) ?? .unknown
        }
        let error = map["error"] as? String
        var lastSyncAt: Date?
        if let raw = map["lastSyncAt"] as? String {
            lastSyncAt = parseDate(raw)
        }
        return RollaSyncResult(
            outcome: outcome,
            hasNewData: hasNewData,
            source: source,
            lastSyncAt: lastSyncAt,
            skipReason: skipReason,
            error: error
        )
    }
}
