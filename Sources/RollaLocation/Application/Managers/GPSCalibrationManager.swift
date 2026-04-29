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
    case calibrating(startTime: Date, pointsCollected: Int)
    case calibrated(baseLocation: Coordinate, accuracy: Double, calibratedAt: Date)
    case failed(reason: CalibrationFailureReason)
    
    var isCalibrated: Bool {
        if case .calibrated = self { return true }
        return false
    }
    
    var isCalibrating: Bool {
        if case .calibrating = self { return true }
        return false
    }
    
    var calibrationAge: TimeInterval? {
        if case .calibrated(_, _, let at) = self {
            return Date().timeIntervalSince(at)
        }
        return nil
    }
    
    var startTime: Date? {
        if case .calibrating(let t, _) = self { return t }
        return nil
    }
}

public actor GPSCalibrationManager {
    private var config: GPSCalibrationConfig
    private let clock: ClockProtocol
    private let logger: Logging
    
    private var state: GPSCalibrationState = .notStarted
    
    // Used only during .calibrating
    private var calibrationPoints: [LocationData] = []
    private var calibrationStartTime: CFTimeInterval = 0
    
    // Used only during .calibrated (for TTL and future use)
    private var lastCheckCoord: Coordinate?
    private var lastCheckTime: Date?
    private var calibrationUptimeAtCalibrated: CFTimeInterval = 0
    
    private var lastFailureReason: CalibrationFailureReason?
    private var lastFailureAt: Date?
    
    private let goodFixAccuracyForRetry: CLLocationAccuracy = 15.0
    private let ttlPoorAccuracyThreshold: CLLocationAccuracy = 30.0
    private let ttlFarFromBaseMeters: Double = 2000.0
    
    init(
        config: GPSCalibrationConfig = .default,
        clock: ClockProtocol = SystemClock(),
        logger: Logging
    ) {
        self.config = config
        self.clock = clock
        self.logger = logger
        
#if DEBUG
        precondition(config.maxPointsForCalibration >= config.minPointsForCalibration)
        precondition(config.stabilityThreshold > 0)
        precondition(config.calibrationDuration > 0)
        precondition(config.recentPointsForStability <= config.minPointsForCalibration)
#endif
    }
    
    func processLocation(_ locationData: LocationData) -> CalibrationResult {
        switch state {
        case .notStarted:
            return startCalibration(with: locationData)
            
        case .calibrating(let startTime, _):
            return continueCalibration(with: locationData, startTime: startTime)
            
        case .calibrated(let baseLocation, let accuracy, let calibratedAt):
            return validateAndPassThrough(
                with: locationData,
                baseLocation: baseLocation,
                accuracy: accuracy,
                calibratedAt: calibratedAt
            )
            
        case .failed:
            if let failAt = lastFailureAt {
                let timeSinceFailure = clock.currentDate().timeIntervalSince(failAt)
                
                let cooldown = locationData.horizontalAccuracy <= goodFixAccuracyForRetry
                ? config.retryAfterFailureCooldownSeconds
                : config.retryAfterFailureCooldownSeconds * 6.0
                
                if timeSinceFailure >= cooldown {
                    lastFailureAt = nil
                    lastFailureReason = nil
                    state = .notStarted
                    return startCalibration(with: locationData)
                }
            }
            return .failed(reason: lastFailureReason ?? .poorSignalQuality)
        }
    }
    
    func reset() {
        state = .notStarted
        calibrationPoints.removeAll()
        calibrationStartTime = 0
        lastCheckCoord = nil
        lastCheckTime = nil
        calibrationUptimeAtCalibrated = 0
        lastFailureReason = nil
        lastFailureAt = nil
    }
    
    func updateConfiguration(_ newConfig: GPSCalibrationConfig) {
        self.config = newConfig
    }
}

extension GPSCalibrationManager {
    private func startCalibration(with locationData: LocationData) -> CalibrationResult {
        calibrationStartTime = clock.uptime()
        state = .calibrating(startTime: clock.currentDate(), pointsCollected: 0)
        calibrationPoints.removeAll()
        return continueCalibration(with: locationData, startTime: clock.currentDate())
    }
    
    private func continueCalibration(with locationData: LocationData, startTime: Date) -> CalibrationResult {
        let elapsed = clock.uptime() - calibrationStartTime
        
        if elapsed > config.calibrationDuration {
            return finishCalibration()
        }
        
        if locationData.horizontalAccuracy > 0,
           locationData.horizontalAccuracy <= config.maxCalibrationAccuracy {
            calibrationPoints.append(locationData)
            
            if calibrationPoints.count > config.maxPointsForCalibration {
                calibrationPoints = Array(calibrationPoints.suffix(config.maxPointsForCalibration))
            }
            
            state = .calibrating(startTime: clock.currentDate(), pointsCollected: calibrationPoints.count)
            
            let (stable, _) = isStableCentroid()
            if calibrationPoints.count >= config.minPointsForCalibration && stable {
                return finishCalibration()
            }
        }
        
        return .calibrating
    }
}

extension GPSCalibrationManager {
    private func validateAndPassThrough(
        with locationData: LocationData,
        baseLocation: Coordinate,
        accuracy: Double,
        calibratedAt: Date
    ) -> CalibrationResult {
        let age = clock.uptime() - calibrationUptimeAtCalibrated
        
        if age <= config.calibrationTTL {
            lastCheckCoord = locationData.coordinate
            lastCheckTime = locationData.timestamp
            return .calibrated(locationData)
        }
        
        let distanceFromBase = locationData.coordinate.distance(to: baseLocation)
        let poorAccuracy = locationData.horizontalAccuracy > ttlPoorAccuracyThreshold
        let farFromBase = distanceFromBase > ttlFarFromBaseMeters
        
        if poorAccuracy || farFromBase {
            logger.info("Calibration TTL expired (\(Int(age))s) — updating baseline passively (accuracy=\(String(format: "%.0f", locationData.horizontalAccuracy))m, distance=\(String(format: "%.0f", distanceFromBase))m)", category: .location)
            
            calibrationUptimeAtCalibrated = clock.uptime()
            let newCalibratedAt = clock.currentDate()
            state = .calibrated(baseLocation: locationData.coordinate, accuracy: locationData.horizontalAccuracy, calibratedAt: newCalibratedAt)
            
            lastCheckCoord = locationData.coordinate
            lastCheckTime = locationData.timestamp
            return .calibrated(locationData)
        }
        
        lastCheckCoord = locationData.coordinate
        lastCheckTime = locationData.timestamp
        return .calibrated(locationData)
    }
}

extension GPSCalibrationManager {
    private func finishCalibration() -> CalibrationResult {
        guard !calibrationPoints.isEmpty else {
            return failWith(.poorSignalQuality, message: "Calibration failed — no points collected")
        }
        
        if calibrationPoints.count < config.minPointsForCalibration {
            return failWith(.timeout(
                pointsCollected: calibrationPoints.count,
                requiredPoints: config.minPointsForCalibration
            ), message: "Calibration failed — timeout with \(calibrationPoints.count) points (need \(config.minPointsForCalibration))")
        }
        
        let (stable, maxDeviation) = isStableCentroid()
        if !stable {
            return failWith(.insufficientStability(
                maxDeviation: maxDeviation,
                requiredStability: config.stabilityThreshold
            ), message: "Calibration failed — points too scattered (max \(String(format: "%.1f", maxDeviation)) m)")
        }
        
        let sortedByAccuracy = calibrationPoints.sorted { $0.horizontalAccuracy < $1.horizontalAccuracy }
        let medianIndex = sortedByAccuracy.count / 2
        let medianPoint = sortedByAccuracy[medianIndex]
        let medianAccuracy: Double = sortedByAccuracy.count.isMultiple(of: 2)
        ? (sortedByAccuracy[medianIndex - 1].horizontalAccuracy + medianPoint.horizontalAccuracy) / 2
        : medianPoint.horizontalAccuracy
        
        if medianAccuracy > config.medianAccuracyThreshold {
            return failWith(.poorSignalQuality, message: "Calibration failed — median accuracy \(String(format: "%.1f", medianAccuracy)) m too poor")
        }
        
        guard let (centroid, fusedAccuracy) = calculateSimpleCentroid() else {
            return failWith(.poorSignalQuality)
        }
        
        calibrationUptimeAtCalibrated = clock.uptime()
        let calibratedAt = clock.currentDate()
        state = .calibrated(baseLocation: centroid, accuracy: fusedAccuracy, calibratedAt: calibratedAt)
        
        let calibratedLocation = LocationData(
            coordinate: centroid,
            altitude: medianPoint.altitude,
            horizontalAccuracy: fusedAccuracy,
            verticalAccuracy: medianPoint.verticalAccuracy,
            speed: medianPoint.speed,
            course: medianPoint.course,
            timestamp: medianPoint.timestamp
        )
        
        lastCheckCoord = centroid
        lastCheckTime = calibratedAt
        logger.info("Calibration OK at (\(String(format: "%.6f", centroid.latitude)), \(String(format: "%.6f", centroid.longitude)))", category: .location)
        return .calibrated(calibratedLocation)
    }
    
    private func failWith(_ reason: CalibrationFailureReason, message: String? = nil) -> CalibrationResult {
        state = .failed(reason: reason)
        lastFailureReason = reason
        lastFailureAt = clock.currentDate()
        if let message {
            logger.warning(message, category: .location)
        }
        return .failed(reason: reason)
    }
}

extension GPSCalibrationManager {
    private func calculateSimpleCentroid() -> (Coordinate, Double)? {
        guard !calibrationPoints.isEmpty else { return nil }
        
        var sumX = 0.0, sumY = 0.0, sumZ = 0.0
        var accuracies: [Double] = []
        for p in calibrationPoints {
            let latRad = p.coordinate.latitude * .pi / 180.0
            let lonRad = p.coordinate.longitude * .pi / 180.0
            sumX += cos(latRad) * cos(lonRad)
            sumY += cos(latRad) * sin(lonRad)
            sumZ += sin(latRad)
            accuracies.append(p.horizontalAccuracy)
        }
        
        let countDouble = Double(calibrationPoints.count)
        let avgX = sumX / countDouble
        let avgY = sumY / countDouble
        let avgZ = sumZ / countDouble
        
        let centralLon = atan2(avgY, avgX)
        let centralSquareRoot = sqrt(avgX * avgX + avgY * avgY)
        let centralLat = atan2(avgZ, centralSquareRoot)
        
        accuracies.sort()
        let centroid = Coordinate(
            latitude: centralLat * 180.0 / .pi,
            longitude: centralLon * 180.0 / .pi
        )
        let medianAccuracy = accuracies[accuracies.count / 2]
        return (centroid, medianAccuracy)
    }
    
    private func isStableCentroid() -> (Bool, Double) {
        let n = config.recentPointsForStability
        guard calibrationPoints.count >= n else { return (false, .infinity) }
        
        let recent = Array(calibrationPoints.suffix(n))
        guard recent.count >= 2 else { return (false, .infinity) }
        
        var sumX = 0.0, sumY = 0.0, sumZ = 0.0
        for p in recent {
            let latRad = p.coordinate.latitude * .pi / 180.0
            let lonRad = p.coordinate.longitude * .pi / 180.0
            sumX += cos(latRad) * cos(lonRad)
            sumY += cos(latRad) * sin(lonRad)
            sumZ += sin(latRad)
        }
        
        let countDouble = Double(recent.count)
        let avgX = sumX / countDouble
        let avgY = sumY / countDouble
        let avgZ = sumZ / countDouble
        
        let centralLon = atan2(avgY, avgX)
        let centralSquareRoot = sqrt(avgX * avgX + avgY * avgY)
        let centralLat = atan2(avgZ, centralSquareRoot)
        
        let centroid = Coordinate(
            latitude: centralLat * 180.0 / .pi,
            longitude: centralLon * 180.0 / .pi
        )
        
        var maxDeviation = 0.0
        for p in recent {
            let d = centroid.distance(to: p.coordinate)
            maxDeviation = max(maxDeviation, d)
            if d > config.stabilityThreshold {
                return (false, maxDeviation)
            }
        }
        return (true, maxDeviation)
    }
}
