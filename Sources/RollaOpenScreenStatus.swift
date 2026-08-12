import Foundation

/// Outcome of an ``Rolla/openScreen(_:from:completion:)`` request.
///
/// Every outcome is one of these typed statuses — the call never throws and
/// never fails silently.
public enum RollaOpenScreenStatus: String {
    /// The SDK UI is on the requested screen. The screen is the root of the
    /// SDK UI — back returns the user to the host app, exactly where they
    /// tapped, never to an SDK Home they did not visit.
    case opened
    /// The SDK session is not initialized.
    /// ``Rolla/openScreen(_:from:completion:)`` configures the SDK itself
    /// before navigating, so this indicates the configuration did not produce
    /// a usable session (e.g. it was rejected).
    case notInitialized
    /// The requested screen belongs to a module the host disabled via
    /// ``RollaConfiguration/disabledModules`` (e.g. ``RollaScreen/insights``
    /// with ``RollaDisabledModule/insights``). Nothing was opened.
    case screenDisabled
    /// A mandatory startup step (onboarding, consent, permissions, or
    /// data-source connection) is in front of the user. The SDK kept that
    /// step in place instead of navigating; the request is not retried.
    case blockedByGate
    /// The SDK UI could not be shown or did not become ready in time to
    /// perform the navigation — the `from` view controller is not attached to
    /// a window, or the SDK's home screen never mounted after initialization.
    /// Nothing was opened.
    case uiUnavailable
    /// A newer `openScreen` request replaced this one while waiting for the
    /// SDK UI to become ready. Only the latest request is honored.
    case superseded
    /// The navigation request could not be delivered or its response could
    /// not be understood — an internal error or a build mismatch between this
    /// wrapper and the SDK engine. Should not occur.
    case unknownError

    /// Build a status from the method-channel wire map `{ "status": String }`.
    /// Anything unparseable — including an error response — maps to
    /// ``unknownError``.
    static func from(_ response: Any?) -> RollaOpenScreenStatus {
        guard let map = response as? [String: Any],
              let raw = map["status"] as? String else {
            return .unknownError
        }
        return RollaOpenScreenStatus(rawValue: raw) ?? .unknownError
    }
}
