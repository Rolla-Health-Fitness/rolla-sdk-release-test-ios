import Foundation

public protocol WorkoutSessionUseCase: Sendable {
    func startWorkoutSession(for deviceId: String, activityType: RollaBandWorkoutType) async throws
    func stopWorkoutSession(for deviceId: String, activityType: RollaBandWorkoutType) async throws
    func workoutSessionStateStream() async -> AsyncStream<WorkoutSessionState>
}
