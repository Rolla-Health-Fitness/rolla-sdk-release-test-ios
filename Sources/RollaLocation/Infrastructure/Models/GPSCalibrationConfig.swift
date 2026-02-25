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
    let recalibrationAccuracySpike: Double
    let recalibrationDistanceJump: Double
    
    init(
        calibrationDuration: TimeInterval = 12.0,
        minPointsForCalibration: Int = 3,
        maxPointsForCalibration: Int = 15,
        maxCalibrationAccuracy: CLLocationAccuracy = 30.0,
        stabilityThreshold: Double = 35.0,
        recentPointsForStability: Int = 3,
        medianAccuracyThreshold: CLLocationAccuracy = 80.0,
        calibrationTTL: TimeInterval = 14400.0,
        recalibrationAccuracySpike: Double = 8.0,
        recalibrationDistanceJump: Double = 200.0
    ) {
        precondition(calibrationDuration > 0, "calibrationDuration must be > 0 (got \(calibrationDuration))")
        precondition(minPointsForCalibration > 0, "minPointsForCalibration must be > 0 (got \(minPointsForCalibration))")
        precondition(maxPointsForCalibration > 0, "maxPointsForCalibration must be > 0 (got \(maxPointsForCalibration))")
        precondition(recentPointsForStability > 0, "recentPointsForStability must be > 0 (got \(recentPointsForStability))")
        precondition(maxCalibrationAccuracy > 0, "maxCalibrationAccuracy must be > 0 (got \(maxCalibrationAccuracy))")
        precondition(stabilityThreshold > 0, "stabilityThreshold must be > 0 (got \(stabilityThreshold))")
        precondition(medianAccuracyThreshold > 0, "medianAccuracyThreshold must be > 0 (got \(medianAccuracyThreshold))")
        precondition(calibrationTTL > 0, "calibrationTTL must be > 0 (got \(calibrationTTL))")
        precondition(recalibrationAccuracySpike > 0, "recalibrationAccuracySpike must be > 0 (got \(recalibrationAccuracySpike))")
        precondition(recalibrationDistanceJump > 0, "recalibrationDistanceJump must be > 0 (got \(recalibrationDistanceJump))")
        
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
            recalibrationAccuracySpike >= 1.0,
            "recalibrationAccuracySpike (\(recalibrationAccuracySpike)) must be >= 1.0 (multiplier)"
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
        precondition(recalibrationDistanceJump >= 10.0,
                     "recalibrationDistanceJump (\(recalibrationDistanceJump)) must be >= 10m (minimum meaningful jump)")
        
        self.calibrationDuration = calibrationDuration
        self.minPointsForCalibration = minPointsForCalibration
        self.maxPointsForCalibration = maxPointsForCalibration
        self.maxCalibrationAccuracy = maxCalibrationAccuracy
        self.stabilityThreshold = stabilityThreshold
        self.recentPointsForStability = recentPointsForStability
        self.medianAccuracyThreshold = medianAccuracyThreshold
        self.calibrationTTL = calibrationTTL
        self.recalibrationAccuracySpike = recalibrationAccuracySpike
        self.recalibrationDistanceJump = recalibrationDistanceJump
    }
    
    static let `default` = GPSCalibrationConfig()
    
    static func validated(_ config: GPSCalibrationConfig) -> GPSCalibrationConfig {
        return config
    }
}

public extension GPSCalibrationConfig {
    func assertInvariants() {
        precondition(calibrationDuration > 0, "calibrationDuration must be positive")
        precondition(minPointsForCalibration > 0, "minPointsForCalibration must be positive")
        precondition(maxPointsForCalibration > 0, "maxPointsForCalibration must be positive")
        precondition(recentPointsForStability > 0, "recentPointsForStability must be positive")
        precondition(maxCalibrationAccuracy > 0, "maxCalibrationAccuracy must be positive")
        precondition(stabilityThreshold > 0, "stabilityThreshold must be positive")
        precondition(medianAccuracyThreshold > 0, "medianAccuracyThreshold must be positive")
        precondition(calibrationTTL > 0, "calibrationTTL must be positive")
        precondition(recalibrationAccuracySpike > 0, "recalibrationAccuracySpike must be positive")
        precondition(recalibrationDistanceJump > 0, "recalibrationDistanceJump must be positive")
        
        precondition(minPointsForCalibration <= maxPointsForCalibration,
                     "minPointsForCalibration must be <= maxPointsForCalibration")
        precondition(recentPointsForStability <= maxPointsForCalibration,
                     "recentPointsForStability must be <= maxPointsForCalibration")
        precondition(recentPointsForStability <= minPointsForCalibration,
                     "recentPointsForStability must be <= minPointsForCalibration")
        precondition(recalibrationAccuracySpike >= 1.0,
                     "recalibrationAccuracySpike must be >= 1.0")
        precondition(maxCalibrationAccuracy <= 100.0,
                     "maxCalibrationAccuracy must be <= 100m")
        precondition(stabilityThreshold <= 200.0,
                     "stabilityThreshold must be <= 200m")
        precondition(medianAccuracyThreshold <= 500.0,
                     "medianAccuracyThreshold must be <= 500m")
        precondition(calibrationDuration <= 300.0,
                     "calibrationDuration must be <= 300s")
        precondition(calibrationTTL <= 86400.0,
                     "calibrationTTL must be <= 86400s")
        precondition(maxPointsForCalibration <= 100,
                     "maxPointsForCalibration must be <= 100")
        precondition(recalibrationDistanceJump >= 10.0,
                     "recalibrationDistanceJump must be >= 10m")
    }
}
