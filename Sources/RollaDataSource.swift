import Foundation

/// Data sources the host app can hide from the SDK UI.
///
/// Pass values to `RollaConfiguration.disabledDataSources` to stop offering
/// that source anywhere the user picks a data source to connect — primarily
/// the Data Sources page and the onboarding data-source gate. A source the
/// user has already connected still renders so it can be viewed or
/// disconnected; only new connections are suppressed.
///
/// This is a deny-list: an empty set (the default) offers every source.
public enum RollaDataSource: String {
    case band
    case garmin
    case oura
    case appleHealth
    case healthConnect
}
