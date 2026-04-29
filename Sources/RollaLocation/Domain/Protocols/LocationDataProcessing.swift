import Foundation

public protocol LocationDataProcessing: Sendable {
    func processLocation(_ locationData: LocationData) async -> LocationData?
    func updateConfiguration(for activityType: LocationActivityType) async
    func setTrackingStartTime(_ date: Date) async
    func getLastValidLocation() async -> LocationData?
    func resetCalibration() async
    /// Called at the end of a session so the processor can emit its
    /// final summary (e.g. `pipeline-summary` event) before the debug
    /// logger closes. Default no-op for other implementations.
    func finalizeSession() async
}

public extension LocationDataProcessing {
    func finalizeSession() async {}
}
