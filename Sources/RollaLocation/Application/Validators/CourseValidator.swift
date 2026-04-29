import Foundation
import CoreLocation

enum CourseValidationResult: Sendable {
    case valid
    case invalid(reason: CourseValidationFailure)
    
    var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .invalid:
            return false
        }
    }
}

enum CourseValidationFailure: Sendable {
    case unrealisticCourseChange(change: Double, rate: Double, timeDiff: TimeInterval)
    case courseBearingMismatch(reported: Double, calculated: Double, difference: Double)
}

public actor CourseValidator {
    private let logger: Logging
    private let maxCourseChangePerSecond: Double
    private let minSpeedForCourseValidation: Double
    private var lastValidCourse: Double?
    private var lastValidTimestamp: Date?
    private var totalValidations: Int = 0
    private var rejectedCount: Int = 0
    private let minTimeStep: TimeInterval = 0.25
    private let deadbandDegrees: Double = 3.0
    private let maxIdleSinceLast: TimeInterval = 15.0
    
    init(
        maxCourseChangePerSecond: Double = 180.0,
        minSpeedForCourseValidation: Double = 1.5,
        logger: Logging
    ) {
        self.maxCourseChangePerSecond = maxCourseChangePerSecond
        self.minSpeedForCourseValidation = minSpeedForCourseValidation
        self.logger = logger
    }
    
    func validate(_ location: LocationData) -> CourseValidationResult {
        totalValidations += 1
        
        guard location.speed >= minSpeedForCourseValidation else {
            if let lastT = lastValidTimestamp,
               location.timestamp.timeIntervalSince(lastT) > maxIdleSinceLast {
                lastValidCourse = nil
                lastValidTimestamp = nil
            }
            return .valid
        }
        
        guard location.course >= 0, location.course.isFinite else {
            return .valid
        }
        
        if lastValidCourse == nil || lastValidTimestamp == nil {
            lastValidCourse = location.course
            lastValidTimestamp = location.timestamp
            return .valid
        }
        
        if let lastTime = lastValidTimestamp,
           location.timestamp.timeIntervalSince(lastTime) > maxIdleSinceLast {
            lastValidCourse = location.course
            lastValidTimestamp = location.timestamp
            return .valid
        }
        
        guard let prevCourse = lastValidCourse,
              let prevTime = lastValidTimestamp else {
            lastValidCourse = location.course
            lastValidTimestamp = location.timestamp
            return .valid
        }
        
        let dt = location.timestamp.timeIntervalSince(prevTime)
        
        if dt <= 0 {
            lastValidCourse = location.course
            lastValidTimestamp = location.timestamp
            return .valid
        }
        
        if dt > maxIdleSinceLast {
            lastValidCourse = location.course
            lastValidTimestamp = location.timestamp
            return .valid
        }
        
        guard dt >= minTimeStep else {
            return .valid
        }
        
        guard prevCourse.isFinite else {
            lastValidCourse = location.course
            lastValidTimestamp = location.timestamp
            return .valid
        }
        
        let dθ = shortestAngularDistance(from: prevCourse, to: location.course)
        if abs(dθ) < deadbandDegrees {
            lastValidCourse = location.course
            lastValidTimestamp = location.timestamp
            return .valid
        }
        
        let rate = abs(dθ) / dt
        
        if rate > maxCourseChangePerSecond {
            rejectedCount += 1
            logger.warning("Course spike rejected: \(String(format:"%.0f", rate))°/s", category: .location)
            return .invalid(reason: .unrealisticCourseChange(change: dθ, rate: rate, timeDiff: dt))
        }
        
        lastValidCourse = location.course
        lastValidTimestamp = location.timestamp
        return .valid
    }
    
    func reset() {
        lastValidCourse = nil
        lastValidTimestamp = nil
        totalValidations = 0
        rejectedCount = 0
    }
    
    func getValidationStats() -> (total: Int, rejected: Int, rejectionRate: Double) {
        let rejectionRate = totalValidations > 0 ? Double(rejectedCount) / Double(totalValidations) * 100.0 : 0.0
        return (
            total: totalValidations,
            rejected: rejectedCount,
            rejectionRate: rejectionRate
        )
    }
    
    private func shortestAngularDistance(from: Double, to: Double) -> Double {
        var diff = to - from
        while diff > 180 {
            diff -= 360
        }
        while diff < -180 {
            diff += 360
        }
        return diff
    }
}

