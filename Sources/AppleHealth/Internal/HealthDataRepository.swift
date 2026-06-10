import HealthKit

public protocol HealthDataRepository: Sendable {
    func fetchStatistics(
        for dataType: DataType,
        from startDate: Date,
        to endDate: Date,
        interval: DateComponents
    ) async throws -> [AHHealthStatistics]
    
    func fetchSamples(
        for dataType: DataType,
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHHealthSample]
    
    func fetchSleepSamples(
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHSleepSample]
    
    func fetchBloodPressureSamples(
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHBloodPressureSample]
}

public actor HealthKitRepository: HealthDataRepository {
    private let healthStore: HKHealthStore
    
    public init(healthStore: HKHealthStore) {
        self.healthStore = healthStore
    }
    
    public func fetchStatistics(
        for dataType: DataType,
        from startDate: Date,
        to endDate: Date,
        interval: DateComponents
    ) async throws -> [AHHealthStatistics] {
        guard let quantityType = dataType.hkQuantityType else {
            throw AppleHealthError.unsupportedDataType(dataType)
        }
        
        let unit = dataType.hkUnit
        
        return try await withCheckedThrowingContinuation { continuation in
            let query = HKStatisticsCollectionQuery(
                quantityType: quantityType,
                quantitySamplePredicate: buildPredicate(from: startDate, to: endDate),
                options: dataType.statisticsOptions,
                anchorDate: startDate,
                intervalComponents: interval
            )
            
            query.initialResultsHandler = { _, results, error in
                if let error {
                    continuation.resume(throwing: AppleHealthError.queryFailed(error.localizedDescription))
                    return
                }
                
                let statistics = mapStatisticsCollection(
                    results,
                    unit: unit,
                    from: startDate,
                    to: endDate
                )
                continuation.resume(returning: statistics)
            }
            
            self.healthStore.execute(query)
        }
    }
    
    public func fetchSamples(
        for dataType: DataType,
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHHealthSample] {
        guard let quantityType = dataType.hkQuantityType else {
            throw AppleHealthError.unsupportedDataType(dataType)
        }
        
        let unit = dataType.hkUnit
        let excludeUserEntered = !dataType.includeUserEnteredSamples
        return try await withCheckedThrowingContinuation { continuation in
            let query = HKSampleQuery(
                sampleType: quantityType,
                predicate: buildPredicate(from: startDate, to: endDate, excludingUserEntered: excludeUserEntered),
                limit: HKObjectQueryNoLimit,
                sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)]
            ) { _, samples, error in
                if let error {
                    continuation.resume(throwing: AppleHealthError.queryFailed(error.localizedDescription))
                    return
                }
                
                let healthSamples = mapSamples(
                    samples,
                    unit: unit
                )
                continuation.resume(returning: healthSamples)
            }
            
            self.healthStore.execute(query)
        }
    }
    
    public func fetchSleepSamples(
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHSleepSample] {
        let sleepType = HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!
        
        return try await withCheckedThrowingContinuation { continuation in
            let query = HKSampleQuery(
                sampleType: sleepType,
                predicate: buildPredicate(from: startDate, to: endDate),
                limit: HKObjectQueryNoLimit,
                sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)]
            ) { _, samples, error in
                if let error {
                    continuation.resume(throwing: AppleHealthError.queryFailed(error.localizedDescription))
                    return
                }
                
                let sleepSamples = mapSleepSamples(samples)
                continuation.resume(returning: sleepSamples)
            }
            
            self.healthStore.execute(query)
        }
    }
    
    public func fetchBloodPressureSamples(
        from startDate: Date,
        to endDate: Date
    ) async throws -> [AHBloodPressureSample] {
        guard let correlationType = HKCorrelationType.correlationType(forIdentifier: .bloodPressure) else {
            throw AppleHealthError.unsupportedDataType(.bloodPressure)
        }
        let predicate = HKQuery.predicateForSamples(
            withStart: startDate,
            end: endDate,
            options: [.strictStartDate]
        )
        
        return try await withCheckedThrowingContinuation { continuation in
            let query = HKCorrelationQuery(
                type: correlationType,
                predicate: predicate,
                samplePredicates: nil
            ) { _, correlations, error in
                if let error {
                    continuation.resume(throwing: AppleHealthError.queryFailed(error.localizedDescription))
                    return
                }
                let samples = mapBloodPressureCorrelations(correlations)
                continuation.resume(returning: samples)
            }
            self.healthStore.execute(query)
        }
    }
}

private func mapBloodPressureCorrelations(_ correlations: [HKCorrelation]?) -> [AHBloodPressureSample] {
    guard let correlations = correlations,
          let systolicType = HKQuantityType.quantityType(forIdentifier: .bloodPressureSystolic),
          let diastolicType = HKQuantityType.quantityType(forIdentifier: .bloodPressureDiastolic) else {
        return []
    }
    let mmHg = HKUnit.millimeterOfMercury()
    
    return correlations.compactMap { correlation in
        let systolicSample = correlation.objects(for: systolicType).first as? HKQuantitySample
        let diastolicSample = correlation.objects(for: diastolicType).first as? HKQuantitySample
        guard
            let systolic = systolicSample?.quantity.doubleValue(for: mmHg),
            let diastolic = diastolicSample?.quantity.doubleValue(for: mmHg)
        else {
            return nil
        }
        let startMs = Int64(correlation.startDate.timeIntervalSince1970 * 1000)
        return AHBloodPressureSample(
            startTimestamp: startMs,
            systolic: systolic,
            diastolic: diastolic
        )
    }
}

private func buildPredicate(from startDate: Date, to endDate: Date, excludingUserEntered: Bool = true) -> NSPredicate {
    let datePredicate = HKQuery.predicateForSamples(
        withStart: startDate,
        end: endDate,
        options: [.strictStartDate]
    )
    guard excludingUserEntered else {
        return datePredicate
    }
    let notManuallyEntered = HKQuery.predicateForObjects(
        withMetadataKey: HKMetadataKeyWasUserEntered,
        operatorType: .notEqualTo,
        value: true
    )
    return NSCompoundPredicate(andPredicateWithSubpredicates: [
        datePredicate,
        notManuallyEntered
    ])
}

private func mapStatisticsCollection(
    _ collection: HKStatisticsCollection?,
    unit: HKUnit,
    from startDate: Date,
    to endDate: Date
) -> [AHHealthStatistics] {
    var results: [AHHealthStatistics] = []
    
    collection?.enumerateStatistics(from: startDate, to: endDate) { statistics, _ in
        guard statistics.startDate > startDate else { return }
        
        results.append(AHHealthStatistics(
            startDate: statistics.startDate,
            endDate: statistics.endDate,
            sum: statistics.sumQuantity()?.doubleValue(for: unit),
            average: statistics.averageQuantity()?.doubleValue(for: unit),
            min: statistics.minimumQuantity()?.doubleValue(for: unit),
            max: statistics.maximumQuantity()?.doubleValue(for: unit)
        ))
    }
    
    return results
}

private func mapSamples(_ samples: [HKSample]?, unit: HKUnit) -> [AHHealthSample] {
    guard let quantitySamples = samples as? [HKQuantitySample] else {
        return []
    }
    
    return quantitySamples.map { sample in
        AHHealthSample(
            startDate: sample.startDate,
            endDate: sample.endDate,
            value: sample.quantity.doubleValue(for: unit),
            unit: unit.unitString
        )
    }
}

private func mapSleepSamples(_ samples: [HKSample]?) -> [AHSleepSample] {
    guard let categorySamples = samples as? [HKCategorySample] else {
        return []
    }
    
    return categorySamples.compactMap { sample in
        guard let stage = mapSleepStage(sample.value) else { return nil }
        
        return AHSleepSample(
            startTimestamp: Int(sample.startDate.timeIntervalSince1970 * 1000),
            endTimestamp: Int(sample.endDate.timeIntervalSince1970 * 1000),
            stage: stage
        )
    }
}

private func mapSleepStage(_ value: Int) -> AHSleepStageType? {
    if #available(iOS 16.0, *) {
        switch value {
        case HKCategoryValueSleepAnalysis.awake.rawValue:
            return .awake
        case HKCategoryValueSleepAnalysis.asleepUnspecified.rawValue:
            return .light
        case HKCategoryValueSleepAnalysis.asleepCore.rawValue:
            return .light
        case HKCategoryValueSleepAnalysis.asleepDeep.rawValue:
            return .deep
        case HKCategoryValueSleepAnalysis.asleepREM.rawValue:
            return .rem
        default:
            return nil
        }
    } else {
        switch value {
        case HKCategoryValueSleepAnalysis.awake.rawValue:
            return .awake
        case HKCategoryValueSleepAnalysis.asleep.rawValue:
            return .light
        default:
            return nil
        }
    }
}
