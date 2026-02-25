import Foundation

public enum WorkoutSessionState: Sendable, Equatable {
    case inactive
    case active(macAddress: String, activityType: RollaBandWorkoutType, startTime: Date)
    case suspended(macAddress: String, activityType: RollaBandWorkoutType, startTime: Date)
}
