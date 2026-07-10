import Foundation

/// Why an activity's record ceased to exist when
/// ``RollaDelegate/rollaDidRemoveActivity(_:activity:)`` fired.
public enum RollaActivityRemovalReason: String {
    /// The activity started but was never saved: the session was discarded
    /// during crash recovery — the user chose Discard on the recovery prompt,
    /// or the SDK silently discarded a session that recorded no data. Covers
    /// what hosts commonly expect as "activity canceled".
    case canceled
    /// A saved (possibly already uploaded) activity the user deleted from the
    /// activity review screen. Fires only once the backend confirmed the
    /// deletion (or the record was never uploaded, so only the local copy
    /// existed).
    case deleted
    /// The SDK sent a reason this version does not recognize (forward-compat).
    case unknown
}

/// Payload of ``RollaDelegate/rollaDidRemoveActivity(_:activity:)``.
///
/// Fires when an activity's record is gone without a kept result — the method
/// names the effect (record removed), ``reason`` names the cause. Together
/// with the started/completed events this closes the lifecycle: every started
/// activity terminates in a `finished` completion or a removal, except
/// sessions abandoned mid-tracking for over a day, which are cleaned up
/// silently.
public struct RollaRemovedActivity {
    public let activityId: String
    public let reason: RollaActivityRemovalReason

    /// Build from the method-channel wire map. Unknown reason strings map to
    /// `.unknown` so older host integrations keep working; a malformed payload
    /// never throws.
    static func from(_ arguments: Any?) -> RollaRemovedActivity {
        let map = arguments as? [String: Any] ?? [:]
        return RollaRemovedActivity(
            activityId: map["activityId"] as? String ?? "",
            reason: RollaActivityRemovalReason(rawValue: map["reason"] as? String ?? "") ?? .unknown
        )
    }
}
