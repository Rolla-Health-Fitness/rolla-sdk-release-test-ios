import Flutter
import HealthKit
import UIKit

public class AppleHealthPlugin: NSObject, FlutterPlugin {
    private let manager: AppleHealthManager
    
    public override init() {
        self.manager = AppleHealthManager.create()
        super.init()
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = AppleHealthPlugin()
        AppleHealthHostApiSetup.setUp(
            binaryMessenger: registrar.messenger(),
            api: instance
        )
    }
}

extension AppleHealthPlugin: AppleHealthHostApi {
    func isAvailable() throws -> Bool {
        AppleHealthManager.isHealthDataAvailable
    }
    
    func requestReadAuthorization(
        dataTypes: [AppleHealthDataType],
        completion: @escaping (Result<AppleHealthAuthorizationResponse, Error>) -> Void
    ) {
        Task {
            let status = await manager.requestAuthorization(
                for: dataTypes.map { $0.toNative() }
            )
            completion(.success(status.toPigeon()))
        }
    }
    
    func openHealthSettings(completion: @escaping (Result<Void, Error>) -> Void) {
        Task { @MainActor in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
            completion(.success(()))
        }
    }
    
    func queryStatistics(
        request: HealthQueryRequest,
        completion: @escaping (Result<HealthStatisticsResponse, Error>) -> Void
    ) {
        Task {
            do {
                let statistics = try await manager.queryStatistics(
                    for: request.dataType.toNative(),
                    from: request.startDate,
                    to: request.endDate,
                    interval: DateComponents(minute: Int(request.intervalMinutes ?? 60))
                )
                completion(.success(HealthStatisticsResponse(
                    statistics: statistics.map { $0.toPigeon() }
                )))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func querySamples(
        request: HealthQueryRequest,
        completion: @escaping (Result<HealthSamplesResponse, Error>) -> Void
    ) {
        Task {
            do {
                let samples = try await manager.querySamples(
                    for: request.dataType.toNative(),
                    from: request.startDate,
                    to: request.endDate
                )
                completion(.success(HealthSamplesResponse(
                    samples: samples.map { $0.toPigeon() }
                )))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func querySleepSamples(
        request: SleepQueryRequest,
        completion: @escaping (Result<SleepSamplesResponse, Error>) -> Void
    ) {
        Task {
            do {
                let samples = try await manager.querySleepSamples(
                    from: request.startDate,
                    to: request.endDate
                )
                completion(.success(SleepSamplesResponse(
                    samples: samples.map { $0.toPigeon() }
                )))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func queryBloodPressureSamples(
        request: SleepQueryRequest,
        completion: @escaping (Result<BloodPressureSamplesResponse, Error>) -> Void
    ) {
        Task {
            do {
                let samples = try await manager.queryBloodPressureSamples(
                    from: request.startDate,
                    to: request.endDate
                )
                completion(.success(BloodPressureSamplesResponse(
                    samples: samples.map { $0.toPigeon() }
                )))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func queryWorkouts(
        request: WorkoutQueryRequest,
        completion: @escaping (Result<WorkoutQueryResponse, Error>) -> Void
    ) {
        Task {
            do {
                let workouts = try await manager.queryWorkouts(
                    from: request.startDate,
                    to: request.endDate
                )
                let lastSyncTimestamp = workouts.last.map { $0.endTime }
                completion(.success(WorkoutQueryResponse(
                    workouts: workouts.map { $0.toPigeon() },
                    lastSyncTimestamp: lastSyncTimestamp
                )))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

private extension AppleHealthDataType {
    func toNative() -> DataType {
        switch self {
        case .steps: return .steps
        case .heartRate: return .heartRate
        case .activeEnergyBurned: return .activeEnergyBurned
        case .sleepAnalysis: return .sleepAnalysis
        case .heartRateVariability: return .heartRateVariability
        case .workout: return .workout
        case .workoutRoute: return .workoutRoute
        case .distanceWalkingRunning: return .distanceWalkingRunning
        case .distanceCycling: return .distanceCycling
        case .runningSpeed: return .runningSpeed
        case .cyclingCadence: return .cyclingCadence
        case .cyclingPower: return .cyclingPower
        case .weight: return .weight
        case .bloodPressure: return .bloodPressure
        }
    }
}

private extension HealthQueryRequest {
    var startDate: Date { Date(timeIntervalSince1970: TimeInterval(startTimestamp) / 1000) }
    var endDate: Date { Date(timeIntervalSince1970: TimeInterval(endTimestamp) / 1000) }
}

private extension SleepQueryRequest {
    var startDate: Date { Date(timeIntervalSince1970: TimeInterval(startTimestamp) / 1000) }
    var endDate: Date { Date(timeIntervalSince1970: TimeInterval(endTimestamp) / 1000) }
}

private extension WorkoutQueryRequest {
    var startDate: Date {
        Date(timeIntervalSince1970: TimeInterval(startTimestamp) / 1000)
    }
    var endDate: Date {
        Date(timeIntervalSince1970: TimeInterval(endTimestamp ?? Int64(Date().timeIntervalSince1970 * 1000)) / 1000)
    }
}

private extension AHAuthorizationStatus {
    func toPigeon() -> AppleHealthAuthorizationResponse {
        switch self {
        case .success:
            return AppleHealthAuthorizationResponse(result: .success, errorMessage: nil)
        case .notAvailable:
            return AppleHealthAuthorizationResponse(result: .notAvailable, errorMessage: nil)
        case .error(let message):
            return AppleHealthAuthorizationResponse(result: .error, errorMessage: message)
        }
    }
}

private extension AHHealthStatistics {
    func toPigeon() -> HealthStatistics {
        HealthStatistics(
            startTimestamp: Int64(startDate.timeIntervalSince1970 * 1000),
            endTimestamp: Int64(endDate.timeIntervalSince1970 * 1000),
            sum: sum,
            average: average,
            min: min,
            max: max
        )
    }
}

private extension AHBloodPressureSample {
    func toPigeon() -> BloodPressureSample {
        BloodPressureSample(
            startTimestamp: startTimestamp,
            systolic: systolic,
            diastolic: diastolic
        )
    }
}

private extension AHHealthSample {
    func toPigeon() -> HealthSample {
        HealthSample(
            startTimestamp: Int64(startDate.timeIntervalSince1970 * 1000),
            endTimestamp: Int64(endDate.timeIntervalSince1970 * 1000),
            value: value,
            unit: unit
        )
    }
}

private extension AHSleepSample {
    func toPigeon() -> SleepSample {
        SleepSample(
            startTimestamp: Int64(startTimestamp),
            endTimestamp: Int64(endTimestamp),
            stage: stage.toPigeon()
        )
    }
}

private extension AHSleepStageType {
    func toPigeon() -> AppleHealthSleepStageType {
        switch self {
        case .awake: return .awake
        case .light: return .light
        case .deep: return .deep
        case .rem: return .rem
        }
    }
}

private extension AHWorkoutRecord {
    func toPigeon() -> WorkoutRecord {
        WorkoutRecord(
            id: id,
            sourceName: sourceName,
            sourceBundleId: sourceBundleId,
            startTime: startTime,
            endTime: endTime,
            duration: duration,
            totalDistance: totalDistance,
            totalCalories: totalCalories,
            activities: activities.map { $0.toPigeon() }
        )
    }
}

private extension AHWorkoutActivity {
    func toPigeon() -> WorkoutActivity {
        WorkoutActivity(
            activityType: activityType.toPigeon(),
            startTime: startTime,
            endTime: endTime,
            duration: duration,
            locationType: locationType.toPigeon(),
            distance: distance,
            calories: calories,
            heartRateSummary: heartRateSummary?.toPigeon(),
            heartRateSamples: heartRateSamples?.map { $0.toPigeon() },
            caloriesSamples: caloriesSamples?.map { $0.toPigeon() },
            distanceSamples: distanceSamples?.map { $0.toPigeon() },
            routePoints: routePoints?.map { $0.toPigeon() },
            speedSamples: speedSamples?.map { $0.toPigeon() },
            cadenceSamples: cadenceSamples?.map { $0.toPigeon() },
            powerSamples: powerSamples?.map { $0.toPigeon() }
        )
    }
}

private extension AHWorkoutActivityType {
    func toPigeon() -> WorkoutActivityType {
        switch self {
        case .running: return .running
        case .walking: return .walking
        case .cycling: return .cycling
        case .hiking: return .hiking
        case .swimming: return .swimming
        case .yoga: return .yoga
        case .strength: return .strength
        case .hiit: return .hiit
        case .dance: return .dance
        case .badminton: return .badminton
        case .basketball: return .basketball
        case .football: return .football
        case .tennis: return .tennis
        case .cricket: return .cricket
        case .volleyball: return .volleyball
        case .tableTennis: return .tableTennis
        case .jumpRope: return .jumpRope
        case .meditation: return .meditation
        case .pilates: return .pilates
        case .elliptical: return .elliptical
        case .rowing: return .rowing
        case .stairClimber: return .stairClimber
        case .boxing: return .boxing
        case .kickboxing: return .kickboxing
        case .martialArts: return .martialArts
        case .handball: return .handball
        case .hockey: return .hockey
        case .baseball: return .baseball
        case .rugby: return .rugby
        case .surfing: return .surfing
        case .paddleSports: return .paddleSports
        case .downhillSkiing: return .downhillSkiing
        case .snowboarding: return .snowboarding
        case .crossCountrySkiing: return .crossCountrySkiing
        case .skatingSports: return .skatingSports
        case .golf: return .golf
        case .crossTraining: return .crossTraining
        case .coreTraining: return .coreTraining
        case .waterPolo: return .waterPolo
        case .stretching: return .stretching
        case .waterFitness: return .waterFitness
        case .other: return .other
        }
    }
}

private extension AHLocationType {
    func toPigeon() -> LocationType {
        switch self {
        case .indoor: return .indoor
        case .outdoor: return .outdoor
        case .unknown: return .unknown
        }
    }
}

private extension AHHeartRateSummary {
    func toPigeon() -> HeartRateSummary {
        HeartRateSummary(average: average, min: min, max: max)
    }
}

private extension AHTimestampedValue {
    func toPigeon() -> TimestampedValue {
        TimestampedValue(timestamp: timestamp, value: value)
    }
}

private extension AHRoutePoint {
    func toPigeon() -> RoutePoint {
        RoutePoint(
            timestamp: timestamp,
            latitude: latitude,
            longitude: longitude,
            altitude: altitude,
            speed: speed,
            horizontalAccuracy: horizontalAccuracy
        )
    }
}
