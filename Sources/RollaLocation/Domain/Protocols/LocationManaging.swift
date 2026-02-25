import Foundation

public protocol LocationManaging: Sendable {
    func requestAlwaysLocationPermission() async throws
    func startLocationTracking(config: LocationTrackingConfig) async throws
    func stopLocationTracking() async
    func locationStream() async -> AsyncStream<LocationData>
    func isLocationTracking() async -> Bool
    func getCurrentActivityType() async -> LocationActivityType?
    func setCurrentActivityType(_ activityType: LocationActivityType?) async
}
