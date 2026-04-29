import CoreLocation

public struct GPSCalibrationConfig: Sendable {
    let calibrationDuration: TimeInterval
    let minPointsForCalibration: Int
    let maxPointsForCalibration: Int
    let maxCalibrationAccuracy: CLLocationAccuracy
    let stabilityThreshold: Double
    let recentPointsForStability: Int
    let medianAccuracyThreshold: CLLocationAccuracy
    let calibrationTTL: TimeInterval
    let retryAfterFailureCooldownSeconds: TimeInterval

    init(
        calibrationDuration: TimeInterval = 6.0,
        minPointsForCalibration: Int = 3,
        maxPointsForCalibration: Int = 15,
        maxCalibrationAccuracy: CLLocationAccuracy = 30.0,
        stabilityThreshold: Double = 35.0,
        recentPointsForStability: Int = 3,
        medianAccuracyThreshold: CLLocationAccuracy = 80.0,
        calibrationTTL: TimeInterval = 14400.0,
        retryAfterFailureCooldownSeconds: TimeInterval = 5.0
    ) {
        precondition(calibrationDuration > 0, "calibrationDuration must be > 0 (got \(calibrationDuration))")
        precondition(minPointsForCalibration > 0, "minPointsForCalibration must be > 0 (got \(minPointsForCalibration))")
        precondition(maxPointsForCalibration > 0, "maxPointsForCalibration must be > 0 (got \(maxPointsForCalibration))")
        precondition(recentPointsForStability > 0, "recentPointsForStability must be > 0 (got \(recentPointsForStability))")
        precondition(maxCalibrationAccuracy > 0, "maxCalibrationAccuracy must be > 0 (got \(maxCalibrationAccuracy))")
        precondition(stabilityThreshold > 0, "stabilityThreshold must be > 0 (got \(stabilityThreshold))")
        precondition(medianAccuracyThreshold > 0, "medianAccuracyThreshold must be > 0 (got \(medianAccuracyThreshold))")
        precondition(calibrationTTL > 0, "calibrationTTL must be > 0 (got \(calibrationTTL))")
        precondition(retryAfterFailureCooldownSeconds >= 0, "retryAfterFailureCooldownSeconds must be >= 0 (got \(retryAfterFailureCooldownSeconds))")

        precondition(
            minPointsForCalibration <= maxPointsForCalibration,
            "minPointsForCalibration (\(minPointsForCalibration)) must be <= maxPointsForCalibration (\(maxPointsForCalibration))"
        )
        precondition(
            recentPointsForStability <= maxPointsForCalibration,
            "recentPointsForStability (\(recentPointsForStability)) must be <= maxPointsForCalibration (\(maxPointsForCalibration))"
        )
        precondition(
            recentPointsForStability <= minPointsForCalibration,
            "recentPointsForStability (\(recentPointsForStability)) must be <= minPointsForCalibration (\(minPointsForCalibration))"
        )
        precondition(
            maxCalibrationAccuracy <= 100.0,
            "maxCalibrationAccuracy (\(maxCalibrationAccuracy)) must be <= 100m (reasonable GPS accuracy)"
        )
        precondition(
            stabilityThreshold <= 200.0,
            "stabilityThreshold (\(stabilityThreshold)) must be <= 200m (reasonable stability range)"
        )
        precondition(
            medianAccuracyThreshold <= 500.0,
            "medianAccuracyThreshold (\(medianAccuracyThreshold)) must be <= 500m (reasonable accuracy threshold)"
        )
        precondition(
            calibrationDuration <= 300.0,
            "calibrationDuration (\(calibrationDuration)) must be <= 300s (5 minutes max)"
        )
        precondition(
            calibrationTTL <= 86400.0,
            "calibrationTTL (\(calibrationTTL)) must be <= 86400s (24 hours max)"
        )
        precondition(maxPointsForCalibration <= 100,
                     "maxPointsForCalibration (\(maxPointsForCalibration)) must be <= 100 (memory limit)")

        self.calibrationDuration = calibrationDuration
        self.minPointsForCalibration = minPointsForCalibration
        self.maxPointsForCalibration = maxPointsForCalibration
        self.maxCalibrationAccuracy = maxCalibrationAccuracy
        self.stabilityThreshold = stabilityThreshold
        self.recentPointsForStability = recentPointsForStability
        self.medianAccuracyThreshold = medianAccuracyThreshold
        self.calibrationTTL = calibrationTTL
        self.retryAfterFailureCooldownSeconds = retryAfterFailureCooldownSeconds
    }
    
    static let `default` = GPSCalibrationConfig()
}


