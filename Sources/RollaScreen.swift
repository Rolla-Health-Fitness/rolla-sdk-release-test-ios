import Foundation

/// SDK screens a host app can open directly via
/// ``Rolla/openScreen(_:from:transition:completion:)``.
public enum RollaScreen: String {
    /// The activity history — every recorded activity, with month and day
    /// filtering.
    case activityHistory
    /// The goals editor.
    case goals
    /// The SDK Home screen. Returns the SDK to its regular entry point after
    /// another screen was opened as the root — no engine restart needed.
    case home
    /// The insights feed. Requires the insights module to be enabled;
    /// with ``RollaDisabledModule/insights`` in
    /// ``RollaConfiguration/disabledModules`` the open resolves as
    /// ``RollaOpenScreenStatus/screenDisabled``.
    case insights
    /// The SDK UI exactly as the user left it — the last opened screen, or
    /// Home on a fresh engine. Performs no navigation and always resolves as
    /// ``RollaOpenScreenStatus/opened``.
    case resume
}
