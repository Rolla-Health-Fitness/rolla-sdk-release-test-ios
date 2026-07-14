import Foundation

/// A band descriptor shared by several public surfaces: the payload of the
/// pair/unpair events (``RollaDelegate/rollaDidPairBand(_:band:)`` /
/// ``RollaDelegate/rollaDidUnpairBand(_:band:)``) and the live-link events
/// (``RollaDelegate/rollaDidConnectBand(_:band:)`` /
/// ``RollaDelegate/rollaDidDisconnectBand(_:band:)``), and the
/// ``RollaPairedBandResult/band`` returned by
/// ``Rolla/getPairedBandInfo(completion:)``.
///
/// One shared shape; which fields are populated depends on the moment it is
/// produced:
/// - **paired**: ``name``, ``macAddress``, ``deviceType``, ``rssi`` —
///   firmware/battery are read from the band only seconds after pairing, so
///   they are not part of the pairing payload.
/// - **everywhere else** (unpaired, connected, disconnected, paired-band
///   query): ``macAddress`` plus the last cached ``batteryPercent``,
///   ``firmwareVersion``, ``serialNumber``; the band name is not cached
///   locally, so it is absent.
public struct RollaBandInfo {
    /// Advertised band name (pairing only).
    public let name: String?
    /// The band's MAC address — the stable identifier.
    public let macAddress: String
    /// Signal strength at pairing time (pairing only).
    public let rssi: Int?
    /// Device type reported by the BLE layer (pairing only).
    public let deviceType: String?
    /// Last known battery percent (cached; absent at pairing time).
    public let batteryPercent: Int?
    /// Last known firmware version (cached; absent at pairing time).
    public let firmwareVersion: String?
    /// Last known serial number (cached; absent at pairing time).
    public let serialNumber: String?

    /// Build from the method-channel wire map; a malformed payload never throws.
    static func from(_ arguments: Any?) -> RollaBandInfo {
        let map = arguments as? [String: Any] ?? [:]
        return RollaBandInfo(
            name: map["name"] as? String,
            macAddress: map["macAddress"] as? String ?? "",
            rssi: map["rssi"] as? Int,
            deviceType: map["deviceType"] as? String,
            batteryPercent: map["batteryPercent"] as? Int,
            firmwareVersion: map["firmwareVersion"] as? String,
            serialNumber: map["serialNumber"] as? String
        )
    }
}
