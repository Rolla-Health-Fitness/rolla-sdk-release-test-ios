import Foundation

public protocol LocationTrackingUseCase: Sendable {
    func startLocationTracking(for activityType: LocationActivityType) async throws
    func stopLocationTracking() async
    func getLocationStream() async -> AsyncStream<LocationData>
}
