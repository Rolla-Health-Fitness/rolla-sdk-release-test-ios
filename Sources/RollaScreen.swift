import Foundation

/// SDK screens a host app can open directly via
/// ``Rolla/openScreen(_:from:completion:)``.
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
    /// The insights feed. Requires the insights module to be enabled: opening
    /// it while ``RollaDisabledModule/insights`` is in
    /// ``RollaConfiguration/disabledModules`` resolves as
    /// ``RollaOpenScreenStatus/screenDisabled``.
    case insights
}
