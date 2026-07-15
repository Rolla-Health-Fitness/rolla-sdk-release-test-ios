import Foundation

/// Payload of ``RollaDelegate/rollaDidUpdateProfile(_:update:)``.
///
/// Carries ONLY the fields that changed, as a sparse dictionary — nothing that
/// didn't change is re-sent. Hosts inspect ``changedFields`` for the keys they
/// care about. Values are plain JSON types; units live in the key names.
///
/// Documented keys per source of the update:
/// - profile details edit: `birthdate` (ISO date string), `gender`,
///   `heightCm`, `weightKg`, `units`, `username`, `country`, `cityId`,
///   `language`, `timezone`, `maxHeartRate`
/// - weight log (add/edit): `weightKg`, `timestamp` (epoch)
/// - blood-pressure log (add/edit): `bloodPressureSystolic`,
///   `bloodPressureDiastolic`, `timestamp` (epoch)
///
/// New keys may be added over time; ignore keys you don't know.
public struct RollaProfileUpdated {
    public let changedFields: [String: Any]

    /// Build from the method-channel wire map.
    static func from(_ arguments: Any?) -> RollaProfileUpdated {
        let map = arguments as? [String: Any] ?? [:]
        return RollaProfileUpdated(changedFields: map["changedFields"] as? [String: Any] ?? [:])
    }
}
