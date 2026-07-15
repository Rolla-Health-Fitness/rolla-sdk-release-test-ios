import Foundation

/// Why a band-battery read did or didn't yield a live value.
///
/// Battery is a live BLE read from a **Rolla band**. A value is only present
/// when ``available`` — every other case is a typed "unavailable" reason the
/// host can branch on.
public enum RollaBatteryStatus: String {
    /// A fresh live battery level was read. ``RollaBatteryResult/level`` holds it.
    case available
    /// The user has no Rolla band paired.
    case noBandPaired
    /// A band is paired, but it could not be reached right now — powered off,
    /// out of range, or the connect/read attempt ran out of time. The sync API
    /// reports the same fact as ``RollaSyncSkipReason/bandNotConnected``
    /// (identical raw value).
    case bandNotConnected
    /// The connected device is not a Rolla band. The current battery read never
    /// returns this — it only connects to the user's own known band — so the case
    /// exists for native/forward-compatibility.
    case notRollaDevice
    /// Bluetooth is powered off or otherwise unavailable. (Missing Bluetooth
    /// permission is reported separately as ``bluetoothPermissionRequired``.)
    case bluetoothUnavailable
    /// The Bluetooth runtime permission has not been granted. Shares its raw
    /// value with ``RollaSyncSkipReason/bluetoothPermissionRequired`` so a host
    /// can map "Bluetooth permission required" once across the battery and sync
    /// APIs. The host should request the permission before retrying.
    case bluetoothPermissionRequired
    /// An unexpected error occurred while reading.
    case unknownError
    /// The SDK returned a status this version does not recognize (forward-compat).
    case unknown
}

/// Result of ``Rolla/getBandBatteryLevel(completion:)``.
///
/// ``level`` is non-nil **only** when ``status`` is ``RollaBatteryStatus/available``.
public struct RollaBatteryResult {
    /// Why the read did or didn't produce a live value.
    public let status: RollaBatteryStatus
    /// Battery percentage (0–100). Non-nil only when ``isAvailable``.
    public let level: Int?

    public init(status: RollaBatteryStatus, level: Int? = nil) {
        self.status = status
        self.level = level
    }

    /// Whether a live battery ``level`` is present.
    public var isAvailable: Bool {
        status == .available && level != nil
    }

    /// Build a result from the method-channel wire map
    /// `{ "status": String, "level": Int? }`. Unknown statuses map to
    /// ``RollaBatteryStatus/unknown``.
    static func from(_ response: Any?) -> RollaBatteryResult {
        guard let map = response as? [String: Any],
              let raw = map["status"] as? String else {
            return RollaBatteryResult(status: .unknown, level: nil)
        }
        let status = RollaBatteryStatus(rawValue: raw) ?? .unknown
        // Read the int via NSNumber.intValue to match how the sync parser reads
        // batteryLevel (RollaSyncResult.swift) and the Android wrapper — the
        // Flutter standard codec delivers a Dart int as NSNumber on iOS.
        let level = (map["level"] as? NSNumber)?.intValue
        return RollaBatteryResult(status: status, level: status == .available ? level : nil)
    }
}
