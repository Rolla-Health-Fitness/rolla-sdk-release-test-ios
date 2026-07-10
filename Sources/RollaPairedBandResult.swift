import Foundation

/// Whether the user's account currently has a Rolla band paired.
///
/// This answers a **pairing-state query with zero Bluetooth** — no scan, no
/// connect, no BLE permission; it works with Bluetooth off. It says nothing
/// about the live link (see
/// ``RollaDelegate/rollaDidConnectBand(_:band:)`` /
/// ``RollaDelegate/rollaDidDisconnectBand(_:band:)`` for that).
public enum RollaPairedBandStatus: String {
    /// A band is paired for this account — ``RollaPairedBandResult/band``
    /// describes it.
    case bandPaired
    /// The user's profile confirms no band is paired.
    case noBandPaired
    /// The pairing state could not be determined — the profile was unreachable
    /// (offline/timeout) and no local record exists (e.g. a fresh login while
    /// offline). Reported instead of guessing.
    case undetermined
    /// The SDK sent a status this version does not recognize (forward-compat).
    case unknown
}

/// Result of ``Rolla/getPairedBandInfo(completion:)``.
///
/// ``band`` is non-nil **only** when ``status`` is
/// ``RollaPairedBandStatus/bandPaired``.
public struct RollaPairedBandResult {
    /// Whether a band is paired, or why that couldn't be determined.
    public let status: RollaPairedBandStatus
    /// The paired band. The MAC address is authoritative; every other field is
    /// a best-effort cached value from the last time the SDK talked to the
    /// band (and may be nil).
    public let band: RollaBandInfo?

    /// Whether a paired ``band`` is present.
    public var isPaired: Bool {
        status == .bandPaired && band != nil
    }

    /// Build from the method-channel wire map
    /// `{ "status": String, "band": [String: Any]? }`. Unknown status strings
    /// map to `.unknown`; a malformed payload never throws.
    static func from(_ response: Any?) -> RollaPairedBandResult {
        let map = response as? [String: Any] ?? [:]
        let status = RollaPairedBandStatus(rawValue: map["status"] as? String ?? "") ?? .unknown
        let band = (map["band"] as? [String: Any]).map { RollaBandInfo.from($0) }
        return RollaPairedBandResult(status: status, band: status == .bandPaired ? band : nil)
    }
}
