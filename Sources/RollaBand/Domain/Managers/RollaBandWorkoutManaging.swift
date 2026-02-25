import Foundation

public protocol RollaBandWorkoutManaging: Sendable {
    func startWorkout(
        deviceUUID: BLEDeviceIdentifier,
        activityType: RollaBandWorkoutType,
        timeout: TimeInterval
    ) async throws -> WorkoutState

    func stopWorkout(
        deviceUUID: BLEDeviceIdentifier,
        activityType: RollaBandWorkoutType,
        timeout: TimeInterval
    ) async throws -> WorkoutState

    func isUserInActivity() async -> Bool
    func isActivityRestorePending() async -> Bool
    func setActivityRestorePending(_ pending: Bool) async
    func markActivityAsActive() async
    func setPendingRestoreDeviceId(_ identifier: String?) async
    func getPendingRestoreDeviceId() async -> String?
}
