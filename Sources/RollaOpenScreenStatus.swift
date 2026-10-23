import Foundation

/// Outcome of an ``Rolla/openScreen(_:from:transition:completion:)`` call.
/// Every call resolves with exactly one status.
public enum RollaOpenScreenStatus: String {
    /// The SDK UI is on the requested screen.
    case opened
    /// The SDK session could not be initialized from the configuration.
    case notInitialized
    /// The screen's module is disabled via
    /// ``RollaConfiguration/disabledModules``. Nothing was opened.
    case screenDisabled
    /// A mandatory startup step (onboarding, consent, permissions, or
    /// data-source connection) is in front of the user and stays there.
    case blockedByGate
    /// The SDK UI could not be shown or did not become ready to navigate.
    /// Nothing was opened.
    case uiUnavailable
    /// A newer `openScreen` request replaced this one — only the latest
    /// request is honored.
    case superseded
    /// The request could not be delivered or its response could not be read.
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
