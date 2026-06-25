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
    /// The user's primary source is the band, but Bluetooth is powered off (the
    /// permission is granted — the radio is off). The host should prompt the
    /// user to enable Bluetooth before retrying. The band-battery API reports
    /// the same condition as ``RollaBatteryStatus/bluetoothUnavailable``
    /// (identical raw value), so a host can map "turn Bluetooth on" once across
    /// both APIs.
    case bluetoothUnavailable
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

// MARK: - Synced health data

/// A per-stream summary: how many samples synced and the time window they span.
///
/// `from`/`to` are epoch-millisecond UTC timestamps (nil only when `count` is 0,
/// though a summary is present only when the stream had data).
public struct RollaSyncedStreamSummary {
    public let count: Int
    /// Earliest sample timestamp, epoch ms (UTC).
    public let from: Int?
    /// Latest sample timestamp, epoch ms (UTC).
    public let to: Int?
    /// Total step count (steps stream only; nil for other streams).
    public let total: Int?
    /// Sleep block count (sleep stream only; nil otherwise).
    public let blocks: Int?
    /// Total sleep minutes (sleep stream only; nil otherwise).
    public let minutes: Int?

    static func from(_ map: [String: Any]?) -> RollaSyncedStreamSummary? {
        guard let map = map else { return nil }
        // from/to are epoch-MILLISECOND timestamps — read as Int64 (matching the
        // Android `toLong()` contract). `Int` is 64-bit on all current Apple
        // devices, but int64Value is explicit and overflow-proof. count/total/
        // blocks/minutes are small counts.
        return RollaSyncedStreamSummary(
            count: (map["count"] as? NSNumber)?.intValue ?? 0,
            from: (map["from"] as? NSNumber).map { Int($0.int64Value) },
            to: (map["to"] as? NSNumber).map { Int($0.int64Value) },
            total: (map["total"] as? NSNumber)?.intValue,
            blocks: (map["blocks"] as? NSNumber)?.intValue,
            minutes: (map["minutes"] as? NSNumber)?.intValue
        )
    }
}

/// A single heart-rate reading. `timestamp` is epoch ms (UTC).
public struct RollaSyncedHeartRateSample {
    public let timestamp: Int
    public let hr: Int
}

/// A single HRV reading. `timestamp` is epoch ms (UTC).
public struct RollaSyncedHrvSample {
    public let timestamp: Int
    public let hrv: Int
}

/// A single steps bucket. `timestamp` is epoch ms (UTC).
public struct RollaSyncedStepsSample {
    public let timestamp: Int
    public let stepsDelta: Double
    public let caloriesDelta: Double
}

/// A single sleep-stage block. `startTime`/`endTime` are epoch ms (UTC);
/// `stage` ∈ `awake` | `light` | `deep` | `rem`.
public struct RollaSyncedSleepSample {
    public let startTime: Int
    public let endTime: Int
    public let stage: String
}

/// A single weight reading (kg). `timestamp` is epoch ms (UTC).
public struct RollaSyncedWeightSample {
    public let timestamp: Int
    public let weight: Double
}

/// A single blood-pressure reading. `timestamp` is epoch ms (UTC).
public struct RollaSyncedBloodPressureSample {
    public let timestamp: Int
    public let systolic: Int
    public let diastolic: Int
}

/// The raw sample arrays, present only when the host requested
/// `includeSamples: true`. Each array is empty when its stream had no data.
public struct RollaSyncedSamples {
    public let heartRate: [RollaSyncedHeartRateSample]
    public let hrv: [RollaSyncedHrvSample]
    public let steps: [RollaSyncedStepsSample]
    public let sleep: [RollaSyncedSleepSample]
    public let weight: [RollaSyncedWeightSample]
    public let bloodPressure: [RollaSyncedBloodPressureSample]

    static func from(_ map: [String: Any]?) -> RollaSyncedSamples? {
        guard let map = map else { return nil }
        // Sample timestamps are epoch MILLISECONDS — read as Int64 (matching
        // Android's `toLong()`). hr/hrv/systolic/diastolic are small counts.
        func ms(_ d: [String: Any], _ key: String) -> Int { Int(((d[key] as? NSNumber)?.int64Value) ?? 0) }
        let heartRate = (map["heartRate"] as? [[String: Any]] ?? []).map {
            RollaSyncedHeartRateSample(
                timestamp: ms($0, "timestamp"),
                hr: ($0["hr"] as? NSNumber)?.intValue ?? 0
            )
        }
        let hrv = (map["hrv"] as? [[String: Any]] ?? []).map {
            RollaSyncedHrvSample(
                timestamp: ms($0, "timestamp"),
                hrv: ($0["hrv"] as? NSNumber)?.intValue ?? 0
            )
        }
        let steps = (map["steps"] as? [[String: Any]] ?? []).map {
            RollaSyncedStepsSample(
                timestamp: ms($0, "timestamp"),
                stepsDelta: ($0["stepsDelta"] as? NSNumber)?.doubleValue ?? 0,
                caloriesDelta: ($0["caloriesDelta"] as? NSNumber)?.doubleValue ?? 0
            )
        }
        let sleep = (map["sleep"] as? [[String: Any]] ?? []).map {
            RollaSyncedSleepSample(
                startTime: ms($0, "startTime"),
                endTime: ms($0, "endTime"),
                stage: $0["stage"] as? String ?? ""
            )
        }
        let weight = (map["weight"] as? [[String: Any]] ?? []).map {
            RollaSyncedWeightSample(
                timestamp: ms($0, "timestamp"),
                weight: ($0["weight"] as? NSNumber)?.doubleValue ?? 0
            )
        }
        let bloodPressure = (map["bloodPressure"] as? [[String: Any]] ?? []).map {
            RollaSyncedBloodPressureSample(
                timestamp: ms($0, "timestamp"),
                systolic: ($0["systolic"] as? NSNumber)?.intValue ?? 0,
                diastolic: ($0["diastolic"] as? NSNumber)?.intValue ?? 0
            )
        }
        return RollaSyncedSamples(
            heartRate: heartRate, hrv: hrv, steps: steps,
            sleep: sleep, weight: weight, bloodPressure: bloodPressure
        )
    }
}

/// The health data a single ``Rolla/sync(includeSamples:completion:)`` call
/// uploaded.
///
/// A per-stream summary (counts, time windows, step total, sleep minutes,
/// battery, synced dates) is always present; the raw ``samples`` arrays are
/// present only when the host passed `includeSamples: true`. Streams the source
/// can't produce are nil (e.g. ``weight``/``bloodPressure``/``workouts`` on a
/// band sync). See `RollaSyncedHealthData` in the Dart SDK for the full model.
public struct RollaSyncedHealthData {
    public let source: RollaSyncSource
    /// Device-local calendar dates (yyyy-mm-dd) touched by this sync.
    public let syncedDates: [String]
    /// Band battery level (0–100) at sync time, or nil.
    public let batteryLevel: Int?
    public let heartRate: RollaSyncedStreamSummary?
    public let hrv: RollaSyncedStreamSummary?
    public let steps: RollaSyncedStreamSummary?
    public let sleep: RollaSyncedStreamSummary?
    public let weight: RollaSyncedStreamSummary?
    public let bloodPressure: RollaSyncedStreamSummary?
    public let workouts: RollaSyncedStreamSummary?
    /// Raw samples, non-nil only when `includeSamples: true` was requested.
    public let samples: RollaSyncedSamples?

    /// Build from the `syncedData` wire sub-map. Returns nil when absent so
    /// older host integrations keep working.
    static func from(_ response: Any?) -> RollaSyncedHealthData? {
        guard let map = response as? [String: Any] else { return nil }
        return RollaSyncedHealthData(
            source: RollaSyncSource(rawValue: map["source"] as? String ?? "") ?? .unknown,
            syncedDates: map["syncedDates"] as? [String] ?? [],
            batteryLevel: (map["batteryLevel"] as? NSNumber)?.intValue,
            heartRate: RollaSyncedStreamSummary.from(map["heartRate"] as? [String: Any]),
            hrv: RollaSyncedStreamSummary.from(map["hrv"] as? [String: Any]),
            steps: RollaSyncedStreamSummary.from(map["steps"] as? [String: Any]),
            sleep: RollaSyncedStreamSummary.from(map["sleep"] as? [String: Any]),
            weight: RollaSyncedStreamSummary.from(map["weight"] as? [String: Any]),
            bloodPressure: RollaSyncedStreamSummary.from(map["bloodPressure"] as? [String: Any]),
            workouts: RollaSyncedStreamSummary.from(map["workouts"] as? [String: Any]),
            samples: RollaSyncedSamples.from(map["samples"] as? [String: Any])
        )
    }
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

    /// The health data this sync uploaded — per-stream summaries always, raw
    /// samples when `includeSamples: true` was requested. Non-nil on a success
    /// that had data; nil for `.skipped` / `.failure` and on an empty success.
    public let syncedData: RollaSyncedHealthData?

    public init(
        outcome: RollaSyncOutcome,
        hasNewData: Bool,
        source: RollaSyncSource,
        lastSyncAt: Date? = nil,
        skipReason: RollaSyncSkipReason? = nil,
        error: String? = nil,
        syncedData: RollaSyncedHealthData? = nil
    ) {
        self.outcome = outcome
        self.hasNewData = hasNewData
        self.source = source
        self.lastSyncAt = lastSyncAt
        self.skipReason = skipReason
        self.error = error
        self.syncedData = syncedData
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
        let syncedData = RollaSyncedHealthData.from(map["syncedData"])
        return RollaSyncResult(
            outcome: outcome,
            hasNewData: hasNewData,
            source: source,
            lastSyncAt: lastSyncAt,
            skipReason: skipReason,
            error: error,
            syncedData: syncedData
        )
    }
}
