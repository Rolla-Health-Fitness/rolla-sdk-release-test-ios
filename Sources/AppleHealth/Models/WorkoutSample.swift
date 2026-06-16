import Foundation

public struct AHTimestampedValue: Sendable {
    public let timestamp: Int64 // milliseconds UTC
    public let value: Double
    
    public init(timestamp: Int64, value: Double) {
        self.timestamp = timestamp
        self.value = value
    }
}

public struct AHRoutePoint: Sendable {
    public let timestamp: Int64 // milliseconds UTC
    public let latitude: Double
    public let longitude: Double
    public let altitude: Double? // meters
    public let speed: Double? // m/s (from CLLocation)
    public let horizontalAccuracy: Double? // meters (for GPS quality filtering)
    
    public init(
        timestamp: Int64,
        latitude: Double,
        longitude: Double,
        altitude: Double?,
        speed: Double?,
        horizontalAccuracy: Double?
    ) {
        self.timestamp = timestamp
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.speed = speed
        self.horizontalAccuracy = horizontalAccuracy
    }
}

public struct AHHeartRateSummary: Sendable {
    public let average: Double? // bpm
    public let min: Double? // bpm
    public let max: Double? // bpm
    
    public init(average: Double?, min: Double?, max: Double?) {
        self.average = average
        self.min = min
        self.max = max
    }
}

public enum AHLocationType: String, Sendable {
    case indoor
    case outdoor
    case unknown
}

public struct AHWorkoutActivity: Sendable {
    public let activityType: AHWorkoutActivityType
    public let startTime: Int64 // milliseconds UTC
    public let endTime: Int64 // milliseconds UTC
    public let duration: Double // seconds (actual workout time, excludes pauses)
    public let locationType: AHLocationType
    
    public let distance: Double? // meters
    public let calories: Double? // kcal
    
    public let heartRateSummary: AHHeartRateSummary?
    
    public let heartRateSamples: [AHTimestampedValue]?
    public let caloriesSamples: [AHTimestampedValue]?
    public let distanceSamples: [AHTimestampedValue]?
    public let routePoints: [AHRoutePoint]?
    
    public let speedSamples: [AHTimestampedValue]?
    public let cadenceSamples: [AHTimestampedValue]?
    public let powerSamples: [AHTimestampedValue]?
    
    public init(
        activityType: AHWorkoutActivityType,
        startTime: Int64,
        endTime: Int64,
        duration: Double,
        locationType: AHLocationType,
        distance: Double?,
        calories: Double?,
        heartRateSummary: AHHeartRateSummary?,
        heartRateSamples: [AHTimestampedValue]?,
        caloriesSamples: [AHTimestampedValue]?,
        distanceSamples: [AHTimestampedValue]?,
        routePoints: [AHRoutePoint]?,
        speedSamples: [AHTimestampedValue]?,
        cadenceSamples: [AHTimestampedValue]?,
        powerSamples: [AHTimestampedValue]?
    ) {
        self.activityType = activityType
        self.startTime = startTime
        self.endTime = endTime
        self.duration = duration
        self.locationType = locationType
        self.distance = distance
        self.calories = calories
        self.heartRateSummary = heartRateSummary
        self.heartRateSamples = heartRateSamples
        self.caloriesSamples = caloriesSamples
        self.distanceSamples = distanceSamples
        self.routePoints = routePoints
        self.speedSamples = speedSamples
        self.cadenceSamples = cadenceSamples
        self.powerSamples = powerSamples
    }
}

public struct AHWorkoutRecord: Sendable {
    public let id: String
    public let sourceName: String
    public let sourceBundleId: String?
    public let startTime: Int64 // milliseconds UTC
    public let endTime: Int64 // milliseconds UTC
    public let duration: Double // seconds (excludes pauses)
    public let totalDistance: Double? // meters
    public let totalCalories: Double? // kcal
    public let activities: [AHWorkoutActivity]
    
    public init(
        id: String,
        sourceName: String,
        sourceBundleId: String?,
        startTime: Int64,
        endTime: Int64,
        duration: Double,
        totalDistance: Double?,
        totalCalories: Double?,
        activities: [AHWorkoutActivity]
    ) {
        self.id = id
        self.sourceName = sourceName
        self.sourceBundleId = sourceBundleId
        self.startTime = startTime
        self.endTime = endTime
        self.duration = duration
        self.totalDistance = totalDistance
        self.totalCalories = totalCalories
        self.activities = activities
    }
}

