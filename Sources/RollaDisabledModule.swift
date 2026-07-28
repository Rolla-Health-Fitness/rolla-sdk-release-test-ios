import Foundation

/// SDK modules that can be disabled.
///
/// Pass values to `RollaConfiguration.disabledModules` 
/// to disable that module everywhere in the SDK UI.
public enum RollaDisabledModule: String {
    case bloodPressure
    case insights
    case leaderboards
    case weight
}
