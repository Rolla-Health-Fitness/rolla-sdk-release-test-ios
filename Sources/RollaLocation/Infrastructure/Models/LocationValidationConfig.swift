import Foundation
import CoreLocation

public struct LocationValidationConfig: Sendable {
    let maxAccuracy: CLLocationAccuracy
    let maxAge: TimeInterval
    
    let absoluteMaxSpeed: Double
    let sustainedMaxSpeed: Double
    let typicalMaxSpeed: Double
    let speedSpikeMultiplier: Double
    
    let maxAcceleration: Double
    let maxAccelerationChangeRate: Double
    
    let minTimeInterval: Double
    let jitterTimeWindow: Double
    let minDistanceForJitter: Double
    
    let speedAccuracyMax: Double?
    let courseAccuracyMax: Double?
    let minSpeedForCourseValidation: Double
    let minMovingSpeed: Double
    let minDistanceForAccumulation: Double
    let maxAltitudeChangeRate: Double?
    let maxVerticalAccuracy: Double?
    let sigmaGateMultiplier: Double
    
    let calibrationConfig: GPSCalibrationConfig
    
    init(
        maxAccuracy: CLLocationAccuracy,
        maxAge: TimeInterval,
        absoluteMaxSpeed: Double,
        sustainedMaxSpeed: Double,
        typicalMaxSpeed: Double,
        speedSpikeMultiplier: Double,
        maxAcceleration: Double,
        maxAccelerationChangeRate: Double,
        minTimeInterval: Double,
        jitterTimeWindow: Double,
        minDistanceForJitter: Double,
        speedAccuracyMax: Double? = nil,
        courseAccuracyMax: Double? = nil,
        minSpeedForCourseValidation: Double,
        minMovingSpeed: Double,
        minDistanceForAccumulation: Double,
        maxAltitudeChangeRate: Double? = nil,
        maxVerticalAccuracy: Double?,
        sigmaGateMultiplier: Double,
        calibrationConfig: GPSCalibrationConfig
    ) {
        self.maxAccuracy = maxAccuracy
        self.maxAge = maxAge
        self.absoluteMaxSpeed = absoluteMaxSpeed
        self.sustainedMaxSpeed = sustainedMaxSpeed
        self.typicalMaxSpeed = typicalMaxSpeed
        self.speedSpikeMultiplier = speedSpikeMultiplier
        self.maxAcceleration = maxAcceleration
        self.maxAccelerationChangeRate = maxAccelerationChangeRate
        self.minTimeInterval = minTimeInterval
        self.jitterTimeWindow = jitterTimeWindow
        self.minDistanceForJitter = minDistanceForJitter
        self.speedAccuracyMax = speedAccuracyMax
        self.courseAccuracyMax = courseAccuracyMax
        self.minSpeedForCourseValidation = minSpeedForCourseValidation
        self.minMovingSpeed = minMovingSpeed
        self.minDistanceForAccumulation = minDistanceForAccumulation
        self.maxAltitudeChangeRate = maxAltitudeChangeRate
        self.maxVerticalAccuracy = maxVerticalAccuracy
        self.sigmaGateMultiplier = sigmaGateMultiplier
        self.calibrationConfig = calibrationConfig
    }
    
    static func forActivity(_ activityType: LocationActivityType) -> LocationValidationConfig {
        switch activityType {
        case .run:
            return .validated(.init(
                // GPS quality
                maxAccuracy: 20.0,
                maxAge: 6.0,
                
                // Speeds (m/s)
                absoluteMaxSpeed: 13.0,
                sustainedMaxSpeed: 10.0,
                typicalMaxSpeed: 6.5,
                speedSpikeMultiplier: 2.0,
                
                // Dynamics
                maxAcceleration: 4.5,
                maxAccelerationChangeRate: 12.0,
                
                // Timing / jitter
                minTimeInterval: 1.0,
                jitterTimeWindow: 3.0,
                minDistanceForJitter: 10.0,
                
                // Enhanced gates
                speedAccuracyMax: 1.5,
                courseAccuracyMax: 25.0,
                minSpeedForCourseValidation: 1.5,
                minMovingSpeed: 0.8,
                minDistanceForAccumulation: 1.0,
                maxAltitudeChangeRate: nil,
                maxVerticalAccuracy: 40.0,
                sigmaGateMultiplier: 0.4,
                
                // Calibration (fast start, early exit if stable)..
                calibrationConfig: .validated(.init(
                    calibrationDuration: 12.0,
                    minPointsForCalibration: 4,
                    maxCalibrationAccuracy: 25.0
                ))
            ))
            
        case .cycling:
            return .validated(.init(
                // GPS quality
                maxAccuracy: 15.0,
                maxAge: 5.0,
                
                // Speeds (m/s)
                absoluteMaxSpeed: 33.3,
                sustainedMaxSpeed: 27.0,
                typicalMaxSpeed: 12.0,
                speedSpikeMultiplier: 2.0,
                
                // Dynamics
                maxAcceleration: 5.5,
                maxAccelerationChangeRate: 15.0,
                
                // Timing / jitter
                minTimeInterval: 0.8,
                jitterTimeWindow: 2.0,
                minDistanceForJitter: 15.0,
                
                // Enhanced gates
                speedAccuracyMax: 1.0,
                courseAccuracyMax: 20.0,
                minSpeedForCourseValidation: 2.8,
                minMovingSpeed: 1.2,
                minDistanceForAccumulation: 2.0,
                maxAltitudeChangeRate: nil,
                maxVerticalAccuracy: 40.0,
                sigmaGateMultiplier: 0.3,
                
                // Calibration
                calibrationConfig: .validated(.init(
                    calibrationDuration: 12.0,
                    minPointsForCalibration: 4,
                    maxCalibrationAccuracy: 30.0
                ))
            ))
            
        case .walk:
            return .validated(.init(
                maxAccuracy: 25.0, maxAge: 10.0,
                absoluteMaxSpeed: 3.6,
                sustainedMaxSpeed: 2.2,
                typicalMaxSpeed: 1.8,
                speedSpikeMultiplier: 2.0,
                maxAcceleration: 2.0, maxAccelerationChangeRate: 6.0,
                minTimeInterval: 1.5, jitterTimeWindow: 4.0, minDistanceForJitter: 7.0,
                speedAccuracyMax: 2.0, courseAccuracyMax: 45.0,
                minSpeedForCourseValidation: 1.3, minMovingSpeed: 0.7,
                minDistanceForAccumulation: 0.8, maxAltitudeChangeRate: nil,
                maxVerticalAccuracy: 60.0,
                sigmaGateMultiplier: 0.6,
                calibrationConfig: .validated(.init(
                    calibrationDuration: 12.0, minPointsForCalibration: 3, maxCalibrationAccuracy: 30.0
                ))
            ))
            
        case .hiking:
            return .validated(.init(
                maxAccuracy: 25.0,
                maxAge: 12.0,
                absoluteMaxSpeed: 5.0,
                sustainedMaxSpeed: 3.0,
                typicalMaxSpeed: 2.0,
                speedSpikeMultiplier: 2.3,
                maxAcceleration: 2.5,
                maxAccelerationChangeRate: 8.0,
                minTimeInterval: 2.0,
                jitterTimeWindow: 4.0,
                minDistanceForJitter: 7.0,
                speedAccuracyMax: 2.5,
                courseAccuracyMax: 45.0,
                minSpeedForCourseValidation: 1.0,
                minMovingSpeed: 0.6,
                minDistanceForAccumulation: 1.2,
                maxAltitudeChangeRate: nil,
                maxVerticalAccuracy: 20.0,
                sigmaGateMultiplier: 0.7,
                calibrationConfig: .validated(.init(
                    calibrationDuration: 15.0,
                    minPointsForCalibration: 5,
                    maxCalibrationAccuracy: 50.0
                ))
            ))
            
        case .other:
            // Generic configuration for other activities
            return .validated(.init(
                maxAccuracy: 40.0,
                maxAge: 15.0,
                absoluteMaxSpeed: 10.0,
                sustainedMaxSpeed: 6.0,
                typicalMaxSpeed: 4.0,
                speedSpikeMultiplier: 2.5,
                maxAcceleration: 4.0,
                maxAccelerationChangeRate: 10.0,
                minTimeInterval: 2.0,
                jitterTimeWindow: 4.0,
                minDistanceForJitter: 8.0,
                speedAccuracyMax: 2.5,
                courseAccuracyMax: 45.0,
                minSpeedForCourseValidation: 1.5,
                minMovingSpeed: 0.8,
                minDistanceForAccumulation: 1.0,
                maxAltitudeChangeRate: nil,
                maxVerticalAccuracy: 50.0,
                sigmaGateMultiplier: 0.5,
                calibrationConfig: .validated(.init(
                    calibrationDuration: 15.0,
                    minPointsForCalibration: 4,
                    maxCalibrationAccuracy: 40.0
                ))
            ))
        }
    }
    
}

public extension LocationValidationConfig {
    var maxSpikeSpeed: Double {
        typicalMaxSpeed * speedSpikeMultiplier
    }
    
    static func validated(_ config: LocationValidationConfig) -> LocationValidationConfig {
        config.assertInvariants()
        return config
    }
    
    func assertInvariants() {
        precondition(
            typicalMaxSpeed * speedSpikeMultiplier <= absoluteMaxSpeed + 1e-9,
            "Spike speed (\(maxSpikeSpeed)) must not exceed absolute max (\(absoluteMaxSpeed))"
        )
        precondition(
            typicalMaxSpeed <= sustainedMaxSpeed + 1e-9,
            "Typical speed (\(typicalMaxSpeed)) must not exceed sustained max (\(sustainedMaxSpeed))"
        )
        precondition(
            sustainedMaxSpeed <= absoluteMaxSpeed + 1e-9,
            "Sustained speed (\(sustainedMaxSpeed)) must not exceed absolute max (\(absoluteMaxSpeed))"
        )
        precondition(minTimeInterval > 0, "minTimeInterval must be positive")
        precondition(maxAge >= 0, "maxAge must be non-negative")
        
        if let speedAccuracy = speedAccuracyMax {
            precondition(
                speedAccuracy >= 0 && speedAccuracy <= 5,
                "speedAccuracyMax (\(speedAccuracy)) should be in range [0, 5]"
            )
        }
        if let courseAccuracy = courseAccuracyMax {
            precondition(
                courseAccuracy >= 0 && courseAccuracy <= 90,
                "courseAccuracyMax (\(courseAccuracy)) should be in range [0, 90]"
            )
        }
        if let verticalAccuracy = maxVerticalAccuracy {
            precondition(
                verticalAccuracy >= 0 && verticalAccuracy <= 100,
                "maxVerticalAccuracy (\(verticalAccuracy)) should be in range [0, 100]"
            )
        }
        if let altitudeChangeRate = maxAltitudeChangeRate {
            precondition(
                altitudeChangeRate >= 0 && altitudeChangeRate <= 10,
                "maxAltitudeChangeRate (\(altitudeChangeRate)) should be in range [0, 10]"
            )
        }
        precondition(
            sigmaGateMultiplier > 0 && sigmaGateMultiplier <= 1.0,
            "sigmaGateMultiplier (\(sigmaGateMultiplier)) should be in range (0, 1]"
        )
    }
}
