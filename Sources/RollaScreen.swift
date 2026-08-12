import Foundation

/// SDK screens a host app can open directly via
/// ``Rolla/openScreen(_:from:completion:)``.
///
/// This is a deliberate whitelist, not a general router surface. Each value is
/// a self-contained top-level screen that is safe to enter from outside the
/// SDK's own navigation: it loads its own data, and its back affordance
/// returns to the SDK Home screen that the open always places underneath it.
/// Mid-flow screens (onboarding, consent, activity tracking) are intentionally
/// not listed — they carry flow state a direct entry would break.
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
