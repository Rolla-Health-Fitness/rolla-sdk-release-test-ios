import Foundation

public enum DataType: String, CaseIterable, Sendable {
    case steps
    case heartRate
    case activeEnergyBurned
    case sleepAnalysis
    case heartRateVariability
    
    case workout
    case workoutRoute
    case distanceWalkingRunning
    case distanceCycling
    case cyclingCadence
    case cyclingPower
    case runningSpeed
    
    case weight
    case bloodPressure
}

public extension DataType {
    static var workoutRelated: [DataType] {
        [
            .workout,
            .workoutRoute,
            .heartRate,
            .activeEnergyBurned,
            .distanceWalkingRunning,
            .distanceCycling,
            .runningSpeed,
            .cyclingCadence,
            .cyclingPower
        ]
    }
    
    static var activityRelated: [DataType] {
        [
            .steps,
            .activeEnergyBurned,
            .distanceWalkingRunning,
            .distanceCycling
        ]
    }
    
    static var sleepRelated: [DataType] {
        [.sleepAnalysis]
    }
    
    static var heartRelated: [DataType] {
        [
            .heartRate,
            .heartRateVariability
        ]
    }
    
    static var bodyMeasurements: [DataType] {
        [.weight, .bloodPressure]
    }
    
    var includeUserEnteredSamples: Bool {
        switch self {
        case .weight, .bloodPressure: return true
        default: return false
        }
    }
}

