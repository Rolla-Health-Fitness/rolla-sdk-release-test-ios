import HealthKit

public actor AppleHealthManager {
    private let healthStore: HKHealthStore
    private let repository: HealthDataRepository
    private let workoutRepository: WorkoutRepository
    
    public static var isHealthDataAvailable: Bool {
        HKHealthStore.isHealthDataAvailable()
    }
    
    public static func create() -> AppleHealthManager {
        let healthStore = HKHealthStore()
        return AppleHealthManager(
            healthStore: healthStore,
            repository: HealthKitRepository(healthStore: healthStore),
            workoutRepository: HealthKitWorkoutRepository(healthStore: healthStore)
        )
    }
    
    public init(
        healthStore: HKHealthStore,
        repository: HealthDataRepository,
        workoutRepository: WorkoutRepository
    ) {
        self.healthStore = healthStore
        self.repository = repository
        self.workoutRepository = workoutRepository
    }
    
    public func requestAuthorization(for dataTypes: [DataType]) async -> AHAuthorizationStatus {
        guard Self.isHealthDataAvailable else {
            return .notAvailable
        }
        
        let readTypes = Set(dataTypes.flatMap { $0.hkObjectTypesForAuthorization })
        guard !readTypes.isEmpty else {
            return .error("No valid data types provided")
        }
        
        do {
            try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
                healthStore.requestAuthorization(toShare: [], read: readTypes) { _, error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else {
                        continuation.resume()
                    }
                }
            }
            return .success
        } catch {
            return .error(error.localizedDescription)
        }
    }
    
    public func queryStatistics(
        for dataType: DataType,
        from startDate: Date,
        to endDate: Date,
        interval: DateComponents = DateComponents(minute: 10)
    ) async throws -> [AHHealthStatistics] {
        guard Self.isHealthDataAvailable else {
            throw AppleHealthError.notAvailable
        }
        guard startDate <= endDate else {
            throw AppleHealthError.invalidDateRange
        }
        
        return try await repository.fetchStatistics(
            for: dataType,
            from: startDate,
            to: endDate,
            interval: interval
        )
    }
    
    public func querySamples(
        for dataType: DataType,
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHHealthSample] {
        guard Self.isHealthDataAvailable else {
            throw AppleHealthError.notAvailable
        }
        guard startDate <= endDate else {
            throw AppleHealthError.invalidDateRange
        }
        
        return try await repository.fetchSamples(
            for: dataType,
            from: startDate,
            to: endDate
        )
    }
    
    public func querySleepSamples(
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHSleepSample] {
        guard Self.isHealthDataAvailable else {
            throw AppleHealthError.notAvailable
        }
        guard startDate <= endDate else {
            throw AppleHealthError.invalidDateRange
        }
        
        return try await repository.fetchSleepSamples(
            from: startDate,
            to: endDate
        )
    }
    
    public func queryBloodPressureSamples(
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHBloodPressureSample] {
        guard Self.isHealthDataAvailable else {
            throw AppleHealthError.notAvailable
        }
        guard startDate <= endDate else {
            throw AppleHealthError.invalidDateRange
        }
        
        return try await repository.fetchBloodPressureSamples(
            from: startDate,
            to: endDate
        )
    }
    
    public func queryWorkouts(
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHWorkoutRecord] {
        guard Self.isHealthDataAvailable else {
            throw AppleHealthError.notAvailable
        }
        guard startDate <= endDate else {
            throw AppleHealthError.invalidDateRange
        }
        
        return try await workoutRepository.fetchWorkouts(
            from: startDate,
            to: endDate
        )
    }
}
