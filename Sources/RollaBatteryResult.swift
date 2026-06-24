import Foundation

/// Why a band-battery read did or didn't yield a live value.
///
/// Battery is a live BLE read from a **Rolla band**. A value is only present
/// when ``available`` — every other case is a typed "unavailable" reason so the
/// host app can present the right UI without crashing or treating a stale value
/// as live.
public enum RollaBatteryStatus: String {
    /// A fresh live battery level was read. ``RollaBatteryResult/level`` holds it.
    case available
    /// The user has no Rolla band paired.
    case noBandPaired
    /// A Rolla band is known but could not be reached (off / out of range).
    case disconnected
    /// Connecting to / reading from the band did not complete in time.
    case timeout
    /// The connected device is not a Rolla band.
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

/// Result of ``Rolla/getBatteryLevel(completion:)``.
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
    /// ``RollaBatteryStatus/unknown`` so older host integrations keep working.
    static func from(_ response: Any?) -> RollaBatteryResult {
        guard let map = response as? [String: Any],
              let raw = map["status"] as? String else {
            return RollaBatteryResult(status: .unknown, level: nil)
        }
        let status = RollaBatteryStatus(rawValue: raw) ?? .unknown
        let level = map["level"] as? Int
        return RollaBatteryResult(status: status, level: status == .available ? level : nil)
    }
}
