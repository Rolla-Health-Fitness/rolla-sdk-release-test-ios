import Foundation
import CoreLocation

public enum CalibrationResult {
    case calibrating
    case calibrated(LocationData)
    case failed(reason: CalibrationFailureReason)
}

public enum CalibrationFailureReason: Sendable {
    case timeout(pointsCollected: Int, requiredPoints: Int)
    case insufficientStability(maxDeviation: Double, requiredStability: Double)
    case poorSignalQuality
}

public enum GPSCalibrationState: Sendable {
    case notStarted
    case calibrating(startTime: Date, pointsCollected: Int, calibratedAt: Date?)
    case calibrated(baseLocation: Coordinate, accuracy: Double, calibratedAt: Date)
    case failed(reason: CalibrationFailureReason)
    
    var isCalibrated: Bool {
        switch self {
        case .calibrated:
            return true
        default:
            return false
        }
    }
    
    var isCalibrating: Bool {
        switch self {
        case .calibrating:
            return true
        default:
            return false
        }
    }
    
    var calibrationAge: TimeInterval? {
        switch self {
        case .calibrated(_, _, let calibratedAt):
            return Date().timeIntervalSince(calibratedAt)
        case .calibrating:
            return nil
        default:
            return nil
        }
    }
    
    var startTime: Date? {
        switch self {
        case .calibrating(let startTime, _, _):
            return startTime
        default:
            return nil
        }
    }
}

public actor GPSCalibrationManager {
    private var config: GPSCalibrationConfig
    private let clock: ClockProtocol
    private let logger: Logging
    private var state: GPSCalibrationState = .notStarted
    private var calibrationPoints: [LocationData] = []
    private var calibrationStartTime: CFTimeInterval = 0
    private var lastCheckCoord: Coordinate?
    private var lastCheckTime: Date?
    private var badAccuracyCount = 0
    private var lastRecalibrationTriggerAt: Date?
    
    init(
        config: GPSCalibrationConfig = .default,
        clock: ClockProtocol = SystemClock(),
        logger: Logging
    ) {
        self.config = config
        self.clock = clock
        self.logger = logger
        
#if DEBUG
        precondition(config.maxPointsForCalibration >= config.minPointsForCalibration,
                     "maxPointsForCalibration must be >= minPointsForCalibration")
        precondition(config.stabilityThreshold > 0,
                     "stabilityThreshold must be positive")
        precondition(config.calibrationDuration > 0,
                     "calibrationDuration must be positive")
        precondition(config.recentPointsForStability <= config.minPointsForCalibration,
                     "recentPointsForStability must be <= minPointsForCalibration")
#endif
    }
    func processLocation(_ locationData: LocationData) -> CalibrationResult {
        switch state {
        case .notStarted:
            return startCalibration(with: locationData)
            
        case .calibrating(let startTime, let pointsCollected, _):
            return continueCalibration(
                with: locationData,
                startTime: startTime,
                pointsCollected: pointsCollected
            )
            
        case .calibrated(let baseLocation, let accuracy, let calibratedAt):
            return validateExistingCalibration(
                with: locationData,
                baseLocation: baseLocation,
                accuracy: accuracy,
                calibratedAt: calibratedAt
            )
            
        case .failed:
            return .calibrated(locationData)
        }
    }
    
    func reset() {
        state = .notStarted
        calibrationPoints.removeAll()
        calibrationStartTime = 0
        lastCheckCoord = nil
        lastCheckTime = nil
        badAccuracyCount = 0
        lastRecalibrationTriggerAt = nil
    }
    
    func updateConfiguration(_ newConfig: GPSCalibrationConfig) {
        self.config = newConfig
    }
    
    func getState() -> GPSCalibrationState {
        return state
    }
    func getProgress() -> CalibrationProgress? {
        switch state {
        case .calibrating(_, let pointsCollected, _):
            let elapsed = clock.uptime() - calibrationStartTime
            let timeProgress = min(elapsed / config.calibrationDuration, 1.0)
            let pointsProgress = Double(pointsCollected) / Double(config.minPointsForCalibration)
            let remainingTime = max(config.calibrationDuration - elapsed, 0.0)
            
            return CalibrationProgress(
                timeProgress: timeProgress,
                pointsProgress: pointsProgress,
                pointsCollected: pointsCollected,
                pointsRequired: config.minPointsForCalibration,
                remainingTime: remainingTime,
                isStable: pointsCollected >= config.recentPointsForStability ? isStableCentroid() : false
            )
        default:
            return nil
        }
    }
}

extension GPSCalibrationManager {
    private func startCalibration(with locationData: LocationData) -> CalibrationResult {
        calibrationStartTime = clock.uptime()
        let startedAt = Date()
        state = .calibrating(
            startTime: startedAt,
            pointsCollected: 0,
            calibratedAt: nil
        )
        calibrationPoints.removeAll()
        
        return continueCalibration(with: locationData, startTime: startedAt, pointsCollected: 0)
    }
    
    private func continueCalibration(
        with locationData: LocationData,
        startTime: Date,
        pointsCollected: Int
    ) -> CalibrationResult {
        let elapsed = clock.uptime() - calibrationStartTime
        if elapsed > config.calibrationDuration {
            return finishCalibration()
        }
        
        if locationData.horizontalAccuracy > 0 && locationData.horizontalAccuracy <= config.maxCalibrationAccuracy {
            calibrationPoints.append(locationData)
            
            if calibrationPoints.count > config.maxPointsForCalibration {
                calibrationPoints.removeFirst()
            }
            
            let newPointsCollected = calibrationPoints.count
            state = .calibrating(
                startTime: startTime,
                pointsCollected: newPointsCollected,
                calibratedAt: nil
            )
            
            if newPointsCollected >= config.minPointsForCalibration && isStableCentroid() {
                return finishCalibration()
            }
        }
        
        return .calibrating
    }
    
    private func validateExistingCalibration(
        with locationData: LocationData,
        baseLocation: Coordinate,
        accuracy: Double,
        calibratedAt: Date
    ) -> CalibrationResult {
        let age = Date().timeIntervalSince(calibratedAt)
        
        if age > config.calibrationTTL {
            return startCalibration(with: locationData)
        }
        
        if locationData.horizontalAccuracy > accuracy * config.recalibrationAccuracySpike {
            badAccuracyCount += 1
            if badAccuracyCount >= 3 {
                startBackgroundRecalibrationIfCool()
                badAccuracyCount = 0
                updateValidationTracking(locationData)
                return .calibrated(locationData)
            }
        } else {
            badAccuracyCount = 0
        }
        
        if let lastCoord = lastCheckCoord, let lastTime = lastCheckTime {
            let dd = lastCoord.distance(to: locationData.coordinate)
            let dt = locationData.timestamp.timeIntervalSince(lastTime)
            let impliedSpeed = dt > 0 ? dd / dt : 0
            
            if dd > config.recalibrationDistanceJump || impliedSpeed > 30.0 {
                
                startBackgroundRecalibrationIfCool()
                updateValidationTracking(locationData)
                return .calibrated(locationData)
            }
        }
        
        updateValidationTracking(locationData)
        return .calibrated(locationData)
    }
    
    private func updateValidationTracking(_ locationData: LocationData) {
        lastCheckCoord = locationData.coordinate
        lastCheckTime = locationData.timestamp
    }
    
    private func calculateSimpleCentroid() -> (Coordinate, Double) {
        guard !calibrationPoints.isEmpty else {
            let firstPoint = calibrationPoints.first!
            return (firstPoint.coordinate, firstPoint.horizontalAccuracy)
        }
        
        var sumLat = 0.0, sumLon = 0.0
        var accuracies: [Double] = []
        
        for point in calibrationPoints {
            sumLat += point.coordinate.latitude
            sumLon += point.coordinate.longitude
            accuracies.append(point.horizontalAccuracy)
        }
        
        let centroid = Coordinate(
            latitude: sumLat / Double(calibrationPoints.count),
            longitude: sumLon / Double(calibrationPoints.count)
        )
        
        accuracies.sort()
        let medianAccuracy = accuracies[accuracies.count / 2]
        
        return (centroid, medianAccuracy)
    }
    
    private func finishCalibration() -> CalibrationResult {
        guard !calibrationPoints.isEmpty else {
            state = .failed(reason: .poorSignalQuality)
            return .failed(reason: .poorSignalQuality)
        }
        
        let sortedByAccuracy = calibrationPoints.sorted { $0.horizontalAccuracy < $1.horizontalAccuracy }
        
        let medianIndex = sortedByAccuracy.count / 2
        let medianAccuracy: Double
        let medianPoint: LocationData
        
        if sortedByAccuracy.count % 2 == 0 {
            let mid1 = sortedByAccuracy[medianIndex - 1]
            let mid2 = sortedByAccuracy[medianIndex]
            medianAccuracy = (mid1.horizontalAccuracy + mid2.horizontalAccuracy) / 2.0
            medianPoint = mid1.horizontalAccuracy < mid2.horizontalAccuracy ? mid1 : mid2
        } else {
            medianAccuracy = sortedByAccuracy[medianIndex].horizontalAccuracy
            medianPoint = sortedByAccuracy[medianIndex]
        }
        
        if medianAccuracy > config.medianAccuracyThreshold {
            state = .failed(reason: .poorSignalQuality)
            return .failed(reason: .poorSignalQuality)
        }
        
        let (centroid, fusedAccuracy) = calculateSimpleCentroid()
        let calibratedAt = Date()
        
        state = .calibrated(
            baseLocation: centroid,
            accuracy: fusedAccuracy,
            calibratedAt: calibratedAt
        )
        
        let calibratedLocation = LocationData(
            coordinate: centroid,
            altitude: medianPoint.altitude,
            horizontalAccuracy: fusedAccuracy,
            verticalAccuracy: medianPoint.verticalAccuracy,
            speed: medianPoint.speed,
            course: medianPoint.course,
            timestamp: medianPoint.timestamp
        )
        
        return .calibrated(calibratedLocation)
    }
    
    private func isStableCentroid() -> Bool {
        let n = config.recentPointsForStability
        guard calibrationPoints.count >= n else {
            return false
        }
        
        let recentPoints = Array(calibrationPoints.suffix(n))
        guard recentPoints.count >= 2 else { return false }
        
        var sumLat = 0.0, sumLon = 0.0
        for point in recentPoints {
            sumLat += point.coordinate.latitude
            sumLon += point.coordinate.longitude
        }
        let centroid = Coordinate(
            latitude: sumLat / Double(recentPoints.count),
            longitude: sumLon / Double(recentPoints.count)
        )
        
        for point in recentPoints {
            let distance = centroid.distance(to: point.coordinate)
            if distance > config.stabilityThreshold {
                return false
            }
        }
        
        return true
    }
    
    private func startBackgroundRecalibrationIfCool() {
        let now = Date()
        if let last = lastRecalibrationTriggerAt, now.timeIntervalSince(last) < 60 {
            return
        }
        lastRecalibrationTriggerAt = now
        state = .notStarted
    }
}


