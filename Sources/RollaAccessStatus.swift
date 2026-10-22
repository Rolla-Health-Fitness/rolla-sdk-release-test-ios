import Foundation

/// Where a user stands against the partner's access gate. Later versions may add cases, so keep an
/// `@unknown default` branch when switching over it (the SDK is built for library evolution).
public enum RollaAccessState: String {
    /// The user has never had access: they registered while the gate was off, or the gate was
    /// turned on after they registered. A code starts it.
    case inactive
    /// Access is running, until ``RollaAccessStatus/accessEndsAt`` or without an end when
    /// ``RollaAccessStatus/unlimited``.
    case active
    /// The access end date has passed. A new code restores access.
    case expired
    /// An admin removed the user's access. A code cannot restore it; only an admin can.
    case revoked
    /// The SDK reported a state this version does not recognize (forward-compat).
    /// ``RollaAccessStatus/isLocked`` still says whether the user is locked out.
    case unknown
}

/// Payload of ``RollaDelegate/rollaDidChangeAccess(_:status:)``: the signed-in user's access
/// status, as the backend last reported it to the SDK.
///
/// When the partner's gate is off (``gateEnabled`` is `false`) the SDK behaves as if the access
/// feature did not exist: ``state`` is `nil` and nothing is locked. When the gate is on, ``state``
/// is always set and the user may use the app only while it is ``RollaAccessState/active``.
public struct RollaAccessStatus {
    /// Whether the partner requires active access to use the app.
    public let gateEnabled: Bool
    /// The partner's "How do I get a code?" page, for a host's own lock screen. May be `nil`.
    public let helpUrl: String?
    /// The user's access state; `nil` exactly when the gate is off.
    public let state: RollaAccessState?
    /// When time-limited access ends (or ended). `nil` for unlimited access and for a user who
    /// never had access. A revoked user still carries the stored date, which the SDK does not show.
    public let accessEndsAt: Date?
    /// Whether the access never ends.
    public let unlimited: Bool
    /// Whether the user is locked out: the gate is on and access is not active. Decided by the SDK
    /// and carried on the wire, so it is right even for a ``state`` this version does not know.
    public let isLocked: Bool

    /// Builds a status by hand — for a host's own tests or previews of a ``RollaDelegate`` handler;
    /// the SDK fills every delivered status itself. `isLocked` defaults to the SDK's rule — the gate
    /// on and the state not active; the SDK passes the wire value itself.
    public init(
        gateEnabled: Bool,
        helpUrl: String? = nil,
        state: RollaAccessState? = nil,
        accessEndsAt: Date? = nil,
        unlimited: Bool = false,
        isLocked: Bool? = nil
    ) {
        self.gateEnabled = gateEnabled
        self.helpUrl = helpUrl
        self.state = state
        self.accessEndsAt = accessEndsAt
        self.unlimited = unlimited
        self.isLocked = isLocked ?? (gateEnabled && state != nil && state != .active)
    }

    /// Build from the method-channel wire map
    /// `{ "gateEnabled": Bool, "helpUrl": String?, "state": String?, "accessEndsAt": Int? (epoch ms),
    ///    "unlimited": Bool, "isLocked": Bool }`. An unknown state string maps to
    /// ``RollaAccessState/unknown``. A `nil` value arrives as `NSNull`, which every optional read
    /// below treats as absent.
    static func from(_ arguments: Any?) -> RollaAccessStatus {
        let map = arguments as? [String: Any] ?? [:]
        return RollaAccessStatus(
            gateEnabled: map["gateEnabled"] as? Bool ?? false,
            helpUrl: map["helpUrl"] as? String,
            state: (map["state"] as? String).map { RollaAccessState(rawValue: $0) ?? .unknown },
            accessEndsAt: (map["accessEndsAt"] as? NSNumber).map {
                Date(timeIntervalSince1970: TimeInterval($0.int64Value) / 1000)
            },
            unlimited: map["unlimited"] as? Bool ?? false,
            isLocked: map["isLocked"] as? Bool ?? false
        )
    }
}
