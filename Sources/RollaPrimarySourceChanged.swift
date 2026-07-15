import Foundation

/// Payload of ``RollaDelegate/rollaDidChangePrimarySource(_:change:)``.
///
/// Reuses ``RollaSyncSource`` so hosts read one source vocabulary across the
/// sync APIs and this event. Fired when the SDK **observes** the user's
/// primary data source change — either committed inside the SDK UI or
/// discovered on a profile/connections refresh (a change made server-side or
/// on another device surfaces on the next refresh, not instantly).
public struct RollaPrimarySourceChanged {
    /// The primary source before the change.
    public let previousSource: RollaSyncSource
    /// The primary source after the change.
    public let currentSource: RollaSyncSource

    /// Build from the method-channel wire map. Unknown enum strings map to
    /// `.unknown`.
    static func from(_ arguments: Any?) -> RollaPrimarySourceChanged {
        let map = arguments as? [String: Any] ?? [:]
        return RollaPrimarySourceChanged(
            previousSource: RollaSyncSource(rawValue: map["previousSource"] as? String ?? "") ?? .unknown,
            currentSource: RollaSyncSource(rawValue: map["currentSource"] as? String ?? "") ?? .unknown
        )
    }
}
