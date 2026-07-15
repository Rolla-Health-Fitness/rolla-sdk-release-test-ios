import Foundation

/// One goal as seen by the host event listener.
public struct RollaGoalInfo {
    public let id: Int
    public let name: String
    public let enabled: Bool

    static func from(_ map: [String: Any]) -> RollaGoalInfo {
        RollaGoalInfo(
            id: map["id"] as? Int ?? 0,
            name: map["name"] as? String ?? "",
            enabled: map["enabled"] as? Bool ?? false
        )
    }
}

/// Payload of ``RollaDelegate/rollaDidChangeGoals(_:change:)``.
///
/// Goals are committed as a batch: the user toggles any number of goals in the
/// SDK UI and saves once. One event fires per successful save, carrying both
/// the delta (``changedGoals`` — what the user toggled, with their new enabled
/// values) and the resulting state (``enabledGoals`` — every goal enabled
/// after the save), so hosts need no query API to know the current set.
public struct RollaGoalsChanged {
    public let changedGoals: [RollaGoalInfo]
    public let enabledGoals: [RollaGoalInfo]

    /// Build from the method-channel wire map.
    static func from(_ arguments: Any?) -> RollaGoalsChanged {
        let map = arguments as? [String: Any] ?? [:]
        let changed = (map["changedGoals"] as? [[String: Any]] ?? []).map(RollaGoalInfo.from)
        let enabled = (map["enabledGoals"] as? [[String: Any]] ?? []).map(RollaGoalInfo.from)
        return RollaGoalsChanged(changedGoals: changed, enabledGoals: enabled)
    }
}
