import Foundation

public protocol LocationDataProcessing: Sendable {
    func processLocation(_ locationData: LocationData) async -> LocationData?
    func updateConfiguration(for activityType: LocationActivityType) async
    func setTrackingStartTime(_ date: Date) async
    func getBufferedLocations() async -> [LocationData]
    func clearBuffer() async
    func getLastValidLocation() async -> LocationData?
    func resetCalibration() async
    func getCalibrationState() async -> GPSCalibrationState
}
