import HealthKit

extension DataType {
    var hkObjectTypesForAuthorization: [HKObjectType] {
        switch self {
        case .bloodPressure:
            let systolic = HKQuantityType.quantityType(forIdentifier: .bloodPressureSystolic)
            let diastolic = HKQuantityType.quantityType(forIdentifier: .bloodPressureDiastolic)
            return [systolic, diastolic].compactMap { $0 }
        default:
            guard let type = hkObjectType else { return [] }
            return [type]
        }
    }

    var hkObjectType: HKObjectType? {
        switch self {
        case .steps:
            return HKQuantityType.quantityType(forIdentifier: .stepCount)
        case .heartRate:
            return HKQuantityType.quantityType(forIdentifier: .heartRate)
        case .activeEnergyBurned:
            return HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)
        case .sleepAnalysis:
            return HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)
        case .heartRateVariability:
            return HKQuantityType.quantityType(forIdentifier: .heartRateVariabilitySDNN)
        case .workout:
            return HKObjectType.workoutType()
        case .workoutRoute:
            return HKSeriesType.workoutRoute()
        case .distanceWalkingRunning:
            return HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)
        case .distanceCycling:
            return HKQuantityType.quantityType(forIdentifier: .distanceCycling)
        case .cyclingCadence:
            if #available(iOS 17.0, *) {
                return HKQuantityType.quantityType(forIdentifier: .cyclingCadence)
            }
            return nil
        case .cyclingPower:
            if #available(iOS 17.0, *) {
                return HKQuantityType.quantityType(forIdentifier: .cyclingPower)
            }
            return nil
        case .runningSpeed:
            if #available(iOS 16.0, *) {
                return HKQuantityType.quantityType(forIdentifier: .runningSpeed)
            }
            return nil
        case .weight:
            return HKQuantityType.quantityType(forIdentifier: .bodyMass)
        case .bloodPressure:
            return HKCorrelationType.correlationType(forIdentifier: .bloodPressure)
        }
    }
    
    var hkQuantityType: HKQuantityType? {
        switch self {
        case .steps:
            return HKQuantityType.quantityType(forIdentifier: .stepCount)
        case .heartRate:
            return HKQuantityType.quantityType(forIdentifier: .heartRate)
        case .activeEnergyBurned:
            return HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)
        case .heartRateVariability:
            return HKQuantityType.quantityType(forIdentifier: .heartRateVariabilitySDNN)
        case .distanceWalkingRunning:
            return HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)
        case .distanceCycling:
            return HKQuantityType.quantityType(forIdentifier: .distanceCycling)
        case .cyclingCadence:
            if #available(iOS 17.0, *) {
                return HKQuantityType.quantityType(forIdentifier: .cyclingCadence)
            }
            return nil
        case .cyclingPower:
            if #available(iOS 17.0, *) {
                return HKQuantityType.quantityType(forIdentifier: .cyclingPower)
            }
            return nil
        case .runningSpeed:
            if #available(iOS 16.0, *) {
                return HKQuantityType.quantityType(forIdentifier: .runningSpeed)
            }
            return nil
        case .weight:
            return HKQuantityType.quantityType(forIdentifier: .bodyMass)
        case .sleepAnalysis, .workout, .workoutRoute, .bloodPressure:
            return nil
        }
    }
    
    var hkUnit: HKUnit {
        switch self {
        case .steps:
            return .count()
        case .heartRate:
            return .count().unitDivided(by: .minute())
        case .activeEnergyBurned:
            return .kilocalorie()
        case .heartRateVariability:
            return .secondUnit(with: .milli)
        case .distanceWalkingRunning, .distanceCycling:
            return .meter()
        case .cyclingCadence:
            return .count().unitDivided(by: .minute())
        case .cyclingPower:
            if #available(iOS 16.0, *) {
                return .watt()
            }
            return .count()
        case .runningSpeed:
            return .meter().unitDivided(by: .second())
        case .weight:
            return .gramUnit(with: .kilo)
        case .sleepAnalysis, .workout, .workoutRoute, .bloodPressure:
            return .count()
        }
    }
    
    var isCumulative: Bool {
        switch self {
        case .steps, .activeEnergyBurned, .distanceWalkingRunning, .distanceCycling:
            return true
        case .heartRate, .heartRateVariability, .sleepAnalysis, .workout, .workoutRoute, .cyclingCadence, .cyclingPower, .runningSpeed, .weight, .bloodPressure:
            return false
        }
    }
    
    var statisticsOptions: HKStatisticsOptions {
        isCumulative ? .cumulativeSum : [.discreteAverage, .discreteMin, .discreteMax]
    }
}

