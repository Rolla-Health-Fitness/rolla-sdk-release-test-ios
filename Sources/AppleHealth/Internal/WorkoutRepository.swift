import HealthKit

public protocol WorkoutRepository: Sendable {
    func fetchWorkouts(from startDate: Date, to endDate: Date) async throws -> [AHWorkoutRecord]
}

public actor HealthKitWorkoutRepository: WorkoutRepository {
    private enum Units {
        static let heartRate = HKUnit.count().unitDivided(by: .minute())
        static let speed = HKUnit.meter().unitDivided(by: .second())
        static let cadence = HKUnit.count().unitDivided(by: .minute())
    }
    
    private let healthStore: HKHealthStore
    
    public init(healthStore: HKHealthStore) {
        self.healthStore = healthStore
    }
    
    public func fetchWorkouts(from startDate: Date, to endDate: Date) async throws -> [AHWorkoutRecord] {
        let hkWorkouts = try await queryWorkouts(from: startDate, to: endDate)
        
        var records: [AHWorkoutRecord] = []
        for workout in hkWorkouts {
            let record = try await buildWorkoutRecord(from: workout)
            records.append(record)
        }
        return records
    }
}

private extension HealthKitWorkoutRepository {
    func queryWorkouts(from startDate: Date, to endDate: Date) async throws -> [HKWorkout] {
        let predicate = HKQuery.predicateForSamples(
            withStart: startDate,
            end: endDate,
            options: .strictStartDate
        )
        
        return try await executeSampleQuery(
            sampleType: HKObjectType.workoutType(),
            predicate: predicate,
            sortDescriptors: [NSSortDescriptor(
                key: HKSampleSortIdentifierStartDate,
                ascending: true
            )]
        )
    }
}

private extension HealthKitWorkoutRepository {
    func buildWorkoutRecord(from workout: HKWorkout) async throws -> AHWorkoutRecord {
        let activities = try await buildActivities(for: workout)
        
        return AHWorkoutRecord(
            id: workout.uuid.uuidString,
            sourceName: workout.sourceRevision.source.name,
            sourceBundleId: workout.sourceRevision.source.bundleIdentifier,
            startTime: workout.startDate.millisecondsSince1970,
            endTime: workout.endDate.millisecondsSince1970,
            duration: workout.duration,
            totalDistance: workout.totalDistance?.doubleValue(for: .meter()),
            totalCalories: workout.totalEnergyBurned?.doubleValue(for: .kilocalorie()),
            activities: activities
        )
    }
    
    func buildActivities(for workout: HKWorkout) async throws -> [AHWorkoutActivity] {
        if #available(iOS 16.0, *), workout.workoutActivities.count > 1 {
            return try await buildMultipleActivities(for: workout)
        }
        
        return [try await buildSingleActivity(for: workout)]
    }
}

private extension HealthKitWorkoutRepository {
    func buildSingleActivity(for workout: HKWorkout) async throws -> AHWorkoutActivity {
        let timeRange = TimeRange(start: workout.startDate, end: workout.endDate)
        let activityType = workout.workoutActivityType
        
        let timeSeries = try await fetchAllTimeSeries(
            for: workout,
            activityType: activityType,
            timeRange: timeRange
        )
        
        return AHWorkoutActivity(
            activityType: AHWorkoutActivityType(from: activityType),
            startTime: timeRange.start.millisecondsSince1970,
            endTime: timeRange.end.millisecondsSince1970,
            duration: workout.duration,
            locationType: getLocationType(from: workout),
            distance: workout.totalDistance?.doubleValue(for: .meter()),
            calories: workout.totalEnergyBurned?.doubleValue(for: .kilocalorie()),
            heartRateSummary: getHeartRateSummary(from: workout),
            heartRateSamples: timeSeries.heartRate,
            caloriesSamples: timeSeries.calories,
            distanceSamples: timeSeries.distance,
            routePoints: timeSeries.route,
            speedSamples: timeSeries.speed,
            cadenceSamples: timeSeries.cadence,
            powerSamples: timeSeries.power
        )
    }
}

private extension HealthKitWorkoutRepository {
    @available(iOS 16.0, *)
    func buildMultipleActivities(for workout: HKWorkout) async throws -> [AHWorkoutActivity] {
        var activities: [AHWorkoutActivity] = []
        
        for hkActivity in workout.workoutActivities {
            let activity = try await buildActivity(from: hkActivity, workout: workout)
            activities.append(activity)
        }
        
        return activities
    }
    
    @available(iOS 16.0, *)
    func buildActivity(from hkActivity: HKWorkoutActivity, workout: HKWorkout) async throws -> AHWorkoutActivity {
        let activityType = hkActivity.workoutConfiguration.activityType
        let endDate = hkActivity.endDate ?? workout.endDate
        let timeRange = TimeRange(start: hkActivity.startDate, end: endDate)
        let duration = hkActivity.duration > 0 ? hkActivity.duration : endDate.timeIntervalSince(hkActivity.startDate)
        
        let stats = ActivityStatistics(from: hkActivity)
        
        let timeSeries = try await fetchAllTimeSeries(
            for: workout,
            activityType: activityType,
            timeRange: timeRange
        )
        
        return AHWorkoutActivity(
            activityType: AHWorkoutActivityType(from: activityType),
            startTime: timeRange.start.millisecondsSince1970,
            endTime: timeRange.end.millisecondsSince1970,
            duration: duration,
            locationType: getLocationType(from: workout, activity: hkActivity),
            distance: stats.distance,
            calories: stats.calories,
            heartRateSummary: stats.heartRateSummary,
            heartRateSamples: timeSeries.heartRate,
            caloriesSamples: timeSeries.calories,
            distanceSamples: timeSeries.distance,
            routePoints: timeSeries.route,
            speedSamples: timeSeries.speed,
            cadenceSamples: timeSeries.cadence,
            powerSamples: timeSeries.power
        )
    }
}

private extension HealthKitWorkoutRepository {
    struct TimeSeriesData {
        let heartRate: [AHTimestampedValue]?
        let calories: [AHTimestampedValue]?
        let distance: [AHTimestampedValue]?
        let route: [AHRoutePoint]?
        let speed: [AHTimestampedValue]?
        let cadence: [AHTimestampedValue]?
        let power: [AHTimestampedValue]?
    }
    
    func fetchAllTimeSeries(
        for workout: HKWorkout,
        activityType: HKWorkoutActivityType,
        timeRange: TimeRange
    ) async throws -> TimeSeriesData {
        async let heartRate = fetchHeartRateSamples(for: workout, in: timeRange)
        async let calories = fetchCaloriesSamples(for: workout, in: timeRange)
        async let distance = fetchDistanceSamples(for: workout, activityType: activityType, in: timeRange)
        async let route = fetchRoutePoints(for: workout, in: timeRange)
        async let speed = fetchSpeedSamples(for: workout, activityType: activityType, in: timeRange)
        async let cadence = fetchCadenceSamples(for: workout, activityType: activityType, in: timeRange)
        async let power = fetchPowerSamples(for: workout, activityType: activityType, in: timeRange)
        
        return TimeSeriesData(
            heartRate: try? await heartRate,
            calories: try? await calories,
            distance: try? await distance,
            route: try? await route,
            speed: try? await speed,
            cadence: try? await cadence,
            power: try? await power
        )
    }
    
    func fetchHeartRateSamples(for workout: HKWorkout, in timeRange: TimeRange) async throws -> [AHTimestampedValue]? {
        let samples = try await fetchQuantitySamples(
            for: workout,
            type: .heartRate,
            unit: Units.heartRate,
            in: timeRange
        )
        return samples.isEmpty ? nil : samples
    }
    
    func fetchCaloriesSamples(for workout: HKWorkout, in timeRange: TimeRange) async throws -> [AHTimestampedValue]? {
        let samples = try await fetchQuantitySamples(
            for: workout,
            type: .activeEnergyBurned,
            unit: .kilocalorie(),
            in: timeRange
        )
        return samples.isEmpty ? nil : samples
    }
    
    func fetchDistanceSamples(
        for workout: HKWorkout,
        activityType: HKWorkoutActivityType,
        in timeRange: TimeRange
    ) async throws -> [AHTimestampedValue]? {
        let distanceType = getDistanceType(for: activityType)
        let samples = try await fetchQuantitySamples(
            for: workout,
            type: distanceType,
            unit: .meter(),
            in: timeRange
        )
        return samples.isEmpty ? nil : samples
    }
    
    func fetchSpeedSamples(
        for workout: HKWorkout,
        activityType: HKWorkoutActivityType,
        in timeRange: TimeRange
    ) async throws -> [AHTimestampedValue]? {
        if activityType == .running || activityType == .walking {
            guard #available(iOS 16.0, *) else { return nil }
            let samples = try await fetchQuantitySamples(
                for: workout,
                type: .runningSpeed,
                unit: Units.speed,
                in: timeRange
            )
            return samples.isEmpty ? nil : samples
        }
        
        if activityType == .cycling {
            guard #available(iOS 17.0, *) else { return nil }
            let samples = try await fetchQuantitySamples(
                for: workout,
                type: .cyclingSpeed,
                unit: Units.speed,
                in: timeRange
            )
            return samples.isEmpty ? nil : samples
        }
        
        return nil
    }
    
    func fetchCadenceSamples(
        for workout: HKWorkout,
        activityType: HKWorkoutActivityType,
        in timeRange: TimeRange
    ) async throws -> [AHTimestampedValue]? {
        guard activityType == .cycling else { return nil }
        guard #available(iOS 17.0, *) else { return nil }
        
        let samples = try await fetchQuantitySamples(
            for: workout,
            type: .cyclingCadence,
            unit: Units.cadence,
            in: timeRange
        )
        return samples.isEmpty ? nil : samples
    }
    
    func fetchPowerSamples(
        for workout: HKWorkout,
        activityType: HKWorkoutActivityType,
        in timeRange: TimeRange
    ) async throws -> [AHTimestampedValue]? {
        guard activityType == .cycling else { return nil }
        guard #available(iOS 17.0, *) else { return nil }
        
        let samples = try await fetchQuantitySamples(
            for: workout,
            type: .cyclingPower,
            unit: .watt(),
            in: timeRange
        )
        return samples.isEmpty ? nil : samples
    }
}

private extension HealthKitWorkoutRepository {
    
    func fetchRoutePoints(for workout: HKWorkout, in timeRange: TimeRange) async throws -> [AHRoutePoint]? {
        let routes: [HKWorkoutRoute] = try await executeSampleQuery(
            sampleType: HKSeriesType.workoutRoute(),
            predicate: HKQuery.predicateForObjects(from: workout),
            sortDescriptors: nil
        )
        
        guard !routes.isEmpty else { return nil }
        
        var allPoints: [AHRoutePoint] = []
        for route in routes {
            let points = try await fetchLocations(from: route)
            
            let filteredPoints = points.filter { point in
                let pointTime = Date(timeIntervalSince1970: Double(point.timestamp) / 1000)
                return pointTime >= timeRange.start && pointTime <= timeRange.end
            }
            allPoints.append(contentsOf: filteredPoints)
        }
        
        return allPoints.isEmpty ? nil : allPoints
    }
    
    func fetchLocations(from route: HKWorkoutRoute) async throws -> [AHRoutePoint] {
        try await withCheckedThrowingContinuation { continuation in
            var points: [AHRoutePoint] = []
            
            let query = HKWorkoutRouteQuery(route: route) { _, locations, done, error in
                if let error {
                    continuation.resume(throwing: AppleHealthError.queryFailed(error.localizedDescription))
                    return
                }
                
                if let locations {
                    let newPoints = locations.map { location in
                        AHRoutePoint(
                            timestamp: location.timestamp.millisecondsSince1970,
                            latitude: location.coordinate.latitude,
                            longitude: location.coordinate.longitude,
                            altitude: location.altitude,
                            speed: location.speed >= 0 ? location.speed : nil,
                            horizontalAccuracy: location.horizontalAccuracy >= 0 ? location.horizontalAccuracy : nil
                        )
                    }
                    points.append(contentsOf: newPoints)
                }
                
                if done {
                    continuation.resume(returning: points)
                }
            }
            healthStore.execute(query)
        }
    }
}

private extension HealthKitWorkoutRepository {
    func executeSampleQuery<T: HKSample>(
        sampleType: HKSampleType,
        predicate: NSPredicate,
        sortDescriptors: [NSSortDescriptor]?
    ) async throws -> [T] {
        try await withCheckedThrowingContinuation { continuation in
            let query = HKSampleQuery(
                sampleType: sampleType,
                predicate: predicate,
                limit: HKObjectQueryNoLimit,
                sortDescriptors: sortDescriptors
            ) { _, samples, error in
                if let error {
                    continuation.resume(throwing: AppleHealthError.queryFailed(error.localizedDescription))
                    return
                }
                continuation.resume(returning: (samples as? [T]) ?? [])
            }
            healthStore.execute(query)
        }
    }
    
    func fetchQuantitySamples(
        for workout: HKWorkout,
        type: HKQuantityTypeIdentifier,
        unit: HKUnit,
        in timeRange: TimeRange
    ) async throws -> [AHTimestampedValue] {
        guard let quantityType = HKQuantityType.quantityType(forIdentifier: type) else {
            return []
        }
        
        let workoutPredicate = HKQuery.predicateForObjects(
            from: workout
        )
        let timePredicate = HKQuery.predicateForSamples(
            withStart: timeRange.start,
            end: timeRange.end,
            options: [.strictStartDate, .strictEndDate]
        )
        let compoundPredicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [workoutPredicate, timePredicate]
        )
        
        let samples: [HKQuantitySample] = try await executeSampleQuery(
            sampleType: quantityType,
            predicate: compoundPredicate,
            sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)]
        )
        
        return samples.map { sample in
            AHTimestampedValue(
                timestamp: sample.startDate.millisecondsSince1970,
                value: sample.quantity.doubleValue(for: unit)
            )
        }
    }
}

private extension HealthKitWorkoutRepository {
    
    func getLocationType(from workout: HKWorkout) -> AHLocationType {
        if let isIndoor = workout.metadata?[HKMetadataKeyIndoorWorkout] as? Bool {
            return isIndoor ? .indoor : .outdoor
        }
        return .unknown
    }
    
    @available(iOS 16.0, *)
    func getLocationType(from workout: HKWorkout, activity: HKWorkoutActivity) -> AHLocationType {
        if let isIndoor = activity.metadata?[HKMetadataKeyIndoorWorkout] as? Bool {
            return isIndoor ? .indoor : .outdoor
        }
        return getLocationType(from: workout)
    }
    
    func getHeartRateSummary(from workout: HKWorkout) -> AHHeartRateSummary? {
        guard #available(iOS 16.0, *) else { return nil }
        guard let stats = workout.statistics(for: HKQuantityType(.heartRate)) else { return nil }
        
        return AHHeartRateSummary(
            average: stats.averageQuantity()?.doubleValue(for: Units.heartRate),
            min: stats.minimumQuantity()?.doubleValue(for: Units.heartRate),
            max: stats.maximumQuantity()?.doubleValue(for: Units.heartRate)
        )
    }
    
    func getDistanceType(for activityType: HKWorkoutActivityType) -> HKQuantityTypeIdentifier {
        switch activityType {
        case .cycling: return .distanceCycling
        case .swimming: return .distanceSwimming
        default: return .distanceWalkingRunning
        }
    }
}

private extension HealthKitWorkoutRepository {
    struct TimeRange {
        let start: Date
        let end: Date
    }
    
    @available(iOS 16.0, *)
    struct ActivityStatistics {
        let distance: Double?
        let calories: Double?
        let heartRateSummary: AHHeartRateSummary?
        
        init(from activity: HKWorkoutActivity) {
            let distanceStats: HKStatistics?
            switch activity.workoutConfiguration.activityType {
            case .cycling:
                distanceStats = activity.statistics(for: HKQuantityType(.distanceCycling))
            case .swimming:
                distanceStats = activity.statistics(for: HKQuantityType(.distanceSwimming))
            default:
                distanceStats = activity.statistics(for: HKQuantityType(.distanceWalkingRunning))
            }
            self.distance = distanceStats?.sumQuantity()?.doubleValue(for: .meter())
            
            let calorieStats = activity.statistics(for: HKQuantityType(.activeEnergyBurned))
            self.calories = calorieStats?.sumQuantity()?.doubleValue(for: .kilocalorie())
            
            if let hrStats = activity.statistics(for: HKQuantityType(.heartRate)) {
                self.heartRateSummary = AHHeartRateSummary(
                    average: hrStats.averageQuantity()?.doubleValue(for: Units.heartRate),
                    min: hrStats.minimumQuantity()?.doubleValue(for: Units.heartRate),
                    max: hrStats.maximumQuantity()?.doubleValue(for: Units.heartRate)
                )
            } else {
                self.heartRateSummary = nil
            }
        }
    }
}

private extension Date {
    var millisecondsSince1970: Int64 {
        Int64(timeIntervalSince1970 * 1000)
    }
}
