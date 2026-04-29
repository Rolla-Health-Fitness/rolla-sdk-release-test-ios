import Foundation

/// On-device JSONL capture of raw GPS samples and pipeline decisions.
///
/// Each event is one JSON line. Every event carries three header fields:
///   - `t`: ISO8601 wall-clock timestamp (fractional seconds)
///   - `seq`: monotonic per-session counter (assigned on the write queue so
///     it matches file order exactly)
///   - `evt`: event type discriminator (see the logXxx methods below)
///
/// The first four events (`input`, `emit`, `suppress`, `state`) also carry
/// a `kind` field that mirrors `evt` so older offline parsers keep working;
/// newer events only carry `evt`.
///
/// ## Opt-in by default
///
/// `isEnabled` is `false` by default. No file is created, no directory
/// is touched, and every `logXxx` call becomes a no-op unless a developer
/// explicitly flips the flag before starting a session:
///
/// ```swift
/// LocationDebugCapture.isEnabled = true   // developer opts in
/// // ...start tracking...
/// ```
///
/// Writes go to `Documents/RollaLocationLogs/<timestamp>.jsonl`. All file
/// I/O runs on a serial queue so `processLocation` is never blocked by
/// disk. Files are capped at 10 MB with a graceful truncate-and-continue.
public final class LocationDebugCapture: @unchecked Sendable {
    public static let shared = LocationDebugCapture()

    /// Master switch. `false` by default so the pipeline never touches
    /// the filesystem unless a developer explicitly opts in. Works on any
    /// build configuration (Debug, Release, TestFlight, App Store).
    ///
    /// Set to `true` if you want to record a file log on your iPhone for
    /// activity map / location tracking logs in detail.
    ///
    /// NOTE: you have to enable `UIFileSharingEnabled` in `wl-rolla-mobile`
    /// (or whichever host app is embedding the SDK) so the captured JSONL
    /// files become visible in Finder under the device's `Files` share.
    public static var isEnabled: Bool = false

    private static let maxFileSizeBytes: UInt64 = 10 * 1024 * 1024 // 10 MB
    private let queue = DispatchQueue(label: "com.rolla.location.debug-capture", qos: .utility)
    private var fileHandle: FileHandle?
    private var currentFileURL: URL?
    private var bytesWritten: UInt64 = 0
    private var truncated = false
    // Monotonic per-session event counter. Only mutated on `queue`.
    private var seqCounter: Int = 0

    private init() {}

    // MARK: - Session lifecycle

    public func startSession() {
        guard Self.isEnabled else { return }
        queue.async { [weak self] in self?._startSession() }
    }

    public func stopSession() {
        guard Self.isEnabled else { return }
        queue.async { [weak self] in self?._stopSession() }
    }

    // MARK: - Legacy events (back-compat: `kind` and `evt` both present)

    public func logInput(_ loc: LocationData) {
        guard Self.isEnabled else { return }
        write(evt: "input", extra: [
            "kind": "input",
            "ts": Self.iso8601(loc.timestamp),
            "lat": loc.coordinate.latitude,
            "lon": loc.coordinate.longitude,
            "acc": loc.horizontalAccuracy,
            "spd": loc.speed,
            "course": loc.course,
            "alt": loc.altitude,
            "vAcc": loc.verticalAccuracy
        ])
    }

    public func logEmit(_ loc: LocationData) {
        guard Self.isEnabled else { return }
        write(evt: "emit", extra: [
            "kind": "emit",
            "ts": Self.iso8601(loc.timestamp),
            "lat": loc.coordinate.latitude,
            "lon": loc.coordinate.longitude,
            "acc": loc.horizontalAccuracy,
            "spd": loc.speed,
            "course": loc.course
        ])
    }

    public func logSuppress(_ loc: LocationData, reason: String) {
        guard Self.isEnabled else { return }
        write(evt: "suppress", extra: [
            "kind": "suppress",
            "ts": Self.iso8601(loc.timestamp),
            "lat": loc.coordinate.latitude,
            "lon": loc.coordinate.longitude,
            "acc": loc.horizontalAccuracy,
            "spd": loc.speed,
            "reason": reason
        ])
    }

    public func logState(transition: String, details: [String: Any] = [:]) {
        guard Self.isEnabled else { return }
        var extra: [String: Any] = [
            "kind": "state",
            "ts": Self.iso8601(Date()),
            "transition": transition
        ]
        for (k, v) in details { extra[k] = v }
        write(evt: "state", extra: extra)
    }

    // MARK: - New decision-level events

    /// Single gate evaluation. `gate` is one of `"A"`, `"B"`, `"C"`,
    /// `"warmup"`, `"pending-confirm"`, `"emit-threshold"`. `reason` is
    /// `"pass"` on success or the suppression reason string on failure.
    public func logGate(
        gate: String,
        passed: Bool,
        reason: String,
        inputs: [String: Any],
        fixTs: Date
    ) {
        guard Self.isEnabled else { return }
        write(evt: "gate", extra: [
            "gate": gate,
            "passed": passed,
            "reason": reason,
            "inputs": Self.sanitize(inputs),
            "fixTs": Self.iso8601(fixTs)
        ])
    }

    /// Per-tier pending-exit confirmation sample. Fired for every fix
    /// while pending-exit is armed — both the tier that triggered the
    /// re-anchor and the tier that didn't. `tier` is `"speed"` or
    /// `"distance"`.
    public func logPendingConfirm(
        tier: String,
        fired: Bool,
        inputs: [String: Any]
    ) {
        guard Self.isEnabled else { return }
        write(evt: "pending-confirm", extra: [
            "tier": tier,
            "fired": fired,
            "inputs": Self.sanitize(inputs)
        ])
    }

    /// Per-fix StationaryDetector observation. `ruleFired` captures the
    /// transition that happened this fix (if any):
    /// `"speed-enter"`, `"disp-enter"`, `"speed-exit"`, `"disp-exit"`,
    /// or `"none"`.
    public func logStationaryDetail(
        speed: Double,
        displacement: Double,
        consecutiveSlowReadings: Int,
        isStationary: Bool,
        isPendingStationary: Bool,
        ruleFired: String,
        fixTs: Date
    ) {
        guard Self.isEnabled else { return }
        write(evt: "stationary-detail", extra: [
            "speed": Self.sanitize(speed),
            "displacement": Self.sanitize(displacement),
            "consecutiveSlowReadings": consecutiveSlowReadings,
            "isStationary": isStationary,
            "isPendingStationary": isPendingStationary,
            "ruleFired": ruleFired,
            "fixTs": Self.iso8601(fixTs)
        ])
    }

    /// Fired whenever the processor swaps one of its tracked anchors:
    /// `lastAccepted`, `lastEmitted`, `secondLastEmitted`, `smoothed`,
    /// `stationaryEntry`. `reason` identifies the code path that caused
    /// the change (see LocationDataProcessor for the vocabulary).
    public func logAnchorChange(
        variable: String,
        reason: String,
        old: [String: Any]?,
        new: [String: Any]?
    ) {
        guard Self.isEnabled else { return }
        var extra: [String: Any] = [
            "var": variable,
            "reason": reason
        ]
        if let old = old { extra["old"] = Self.sanitize(old) }
        if let new = new { extra["new"] = Self.sanitize(new) }
        write(evt: "anchor-change", extra: extra)
    }

    /// Fired whenever `consecutiveGateRejections` changes. `gate` is
    /// `"A"`, `"B"`, `"C"`, `"reset"`, `"rebootstrap"`, or
    /// `"rebootstrap-suppressed"`.
    public func logRejectionCounter(old: Int, new: Int, gate: String) {
        guard Self.isEnabled else { return }
        write(evt: "rejection-counter", extra: [
            "old": old,
            "new": new,
            "gate": gate
        ])
    }

    /// Fired once at `startSession` after `updateConfiguration`. Captures
    /// the full tuning surface so post-hoc log readers can reason about
    /// which thresholds were active during the run.
    public func logConfigSnapshot(payload: [String: Any]) {
        guard Self.isEnabled else { return }
        write(evt: "config-snapshot", extra: Self.sanitize(payload))
    }

    /// Fired once per processLocation call at the top of the pipeline.
    /// All four deltas are nullable: they are absent (rendered as null)
    /// when the referenced marker hasn't been set yet in the session.
    public func logTimer(
        fixTs: Date,
        dtSec: Double?,
        dtSinceLastEmit: Double?,
        dtSincePendingArm: Double?,
        dtSinceLastStationary: Double?
    ) {
        guard Self.isEnabled else { return }
        var extra: [String: Any] = ["fixTs": Self.iso8601(fixTs)]
        if let v = dtSec, v.isFinite { extra["dtSec"] = v }
        if let v = dtSinceLastEmit, v.isFinite { extra["dtSinceLastEmit"] = v }
        if let v = dtSincePendingArm, v.isFinite { extra["dtSincePendingArm"] = v }
        if let v = dtSinceLastStationary, v.isFinite { extra["dtSinceLastStationary"] = v }
        write(evt: "timer", extra: extra)
    }

    /// Fired once at `stopSession` with the whole-session tallies.
    /// Consumers can eyeball a run at a glance (see `jq` cheat-sheet).
    public func logPipelineSummary(payload: [String: Any]) {
        guard Self.isEnabled else { return }
        write(evt: "pipeline-summary", extra: Self.sanitize(payload))
    }

    // MARK: - Internal

    private func _startSession() {
        _stopSession()
        truncated = false
        bytesWritten = 0
        seqCounter = 0

        guard let docsDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let logsDir = docsDir.appendingPathComponent("RollaLocationLogs", isDirectory: true)
        try? FileManager.default.createDirectory(at: logsDir, withIntermediateDirectories: true)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        let filename = "location-\(formatter.string(from: Date())).jsonl"
        let fileURL = logsDir.appendingPathComponent(filename)

        FileManager.default.createFile(atPath: fileURL.path, contents: nil)
        fileHandle = try? FileHandle(forWritingTo: fileURL)
        currentFileURL = fileURL
    }

    private func _stopSession() {
        try? fileHandle?.synchronizeFile()
        try? fileHandle?.close()
        fileHandle = nil
        currentFileURL = nil
    }

    /// Enqueue a write. Header fields (`seq`, `evt`, `t`) are stamped
    /// inside the queue block so their order matches file order exactly.
    private func write(evt: String, extra: [String: Any]) {
        queue.async { [weak self] in
            guard let self, let fh = self.fileHandle, !self.truncated else { return }

            if self.bytesWritten >= Self.maxFileSizeBytes {
                let note = "{\"kind\":\"truncated\",\"evt\":\"truncated\",\"t\":\"\(Self.iso8601(Date()))\"}\n"
                if let data = note.data(using: .utf8) {
                    try? fh.write(contentsOf: data)
                }
                self.truncated = true
                return
            }

            self.seqCounter += 1
            var dict: [String: Any] = [
                "seq": self.seqCounter,
                "evt": evt,
                "t": Self.iso8601(Date())
            ]
            for (k, v) in extra { dict[k] = v }

            guard let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [.sortedKeys]),
                  var line = String(data: jsonData, encoding: .utf8) else { return }
            line += "\n"
            if let lineData = line.data(using: .utf8) {
                try? fh.write(contentsOf: lineData)
                self.bytesWritten += UInt64(lineData.count)
            }
        }
    }

    private static func iso8601(_ date: Date) -> String {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return f.string(from: date)
    }

    /// JSONSerialization rejects non-finite Doubles. Coerce to finite
    /// values recursively so we never drop a whole log line over a NaN.
    private static func sanitize(_ value: Double) -> Any {
        return value.isFinite ? value : NSNull()
    }

    private static func sanitize(_ value: [String: Any]) -> [String: Any] {
        var out: [String: Any] = [:]
        for (k, v) in value {
            switch v {
            case let d as Double:
                out[k] = d.isFinite ? d : NSNull()
            case let arr as [Any]:
                out[k] = arr.map { Self.sanitizeAny($0) }
            case let nested as [String: Any]:
                out[k] = sanitize(nested)
            default:
                out[k] = v
            }
        }
        return out
    }

    private static func sanitizeAny(_ v: Any) -> Any {
        switch v {
        case let d as Double:
            return d.isFinite ? d : NSNull()
        case let nested as [String: Any]:
            return sanitize(nested)
        case let arr as [Any]:
            return arr.map { sanitizeAny($0) }
        default:
            return v
        }
    }
}
