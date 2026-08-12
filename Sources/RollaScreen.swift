import Foundation

/// SDK screens a host app can open directly via
/// ``Rolla/openScreen(_:from:transition:completion:)``.
///
/// This is a deliberate whitelist, not a general router surface. Each value is
/// a self-contained top-level screen that is safe to enter from outside the
/// SDK's own navigation: it loads its own data, and — opened directly — it is
/// the root of the SDK UI, so its back affordance returns the user to the
/// host app (never to an SDK Home they did not visit). Mid-flow screens
/// (onboarding, consent, activity tracking) are intentionally not listed —
/// they carry flow state a direct entry would break.
public enum RollaScreen: String {
    /// The activity history list — every recorded activity with month/day
    /// filtering; activities open their detail page from here.
    case activityHistory
    /// The goals editor, where the user enables and adjusts their goals.
    case goals
    /// The SDK Home screen. Use it to bring the SDK back to its regular entry
    /// point after a previous open made another screen the root — no engine
    /// restart needed. Home keeps its usual affordances, such as the
    /// back-to-host button.
    case home
    /// The insights feed. Requires the insights module to be enabled: opening
    /// it while ``RollaDisabledModule/insights`` is in
    /// ``RollaConfiguration/disabledModules`` resolves as
    /// ``RollaOpenScreenStatus/screenDisabled``.
    case insights
    /// No navigation at all: show the SDK UI exactly as the user left it —
    /// the last opened screen while the engine stays alive, or Home on a
    /// fresh engine. Behaves like ``Rolla/show(from:transition:)`` but
    /// reports a typed result; since nothing navigates, it always resolves
    /// as ``RollaOpenScreenStatus/opened``.
    case resume
}
