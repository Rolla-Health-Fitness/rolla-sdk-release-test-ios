import Foundation

actor DefaultLocationDataProcessor: LocationDataProcessing {
    private let logger: Logging
    private var validationConfig: LocationValidationConfig
    private var calibrationManager: GPSCalibrationManager
    private let courseValidator: CourseValidator
    private var lastValidLocation: LocationData?
    private var locationBuffer: [LocationData] = []
    private var lastAcceptedTimestamp: TimeInterval = 0
    private var trackingStartTime: TimeInterval?
    private let maxBufferSize: Int
    private let enableCourseValidation: Bool

    init(
        calibrationManager: GPSCalibrationManager,
        courseValidator: CourseValidator,
        logger: Logging,
        maxBufferSize: Int = 20,
        enableCourseValidation: Bool = true
    ) {
        self.calibrationManager = calibrationManager
        self.courseValidator = courseValidator
        self.logger = logger
        self.validationConfig = LocationValidationConfig.forActivity(.walk)
        self.maxBufferSize = maxBufferSize
        self.enableCourseValidation = enableCourseValidation
    }

    func updateConfiguration(for activityType: LocationActivityType) async {
        self.validationConfig = LocationValidationConfig.forActivity(activityType)
        await calibrationManager.updateConfiguration(validationConfig.calibrationConfig)
    }

    func setTrackingStartTime(_ date: Date) {
        trackingStartTime = date.timeIntervalSince1970
    }

    func processLocation(_ locationData: LocationData) async -> LocationData? {
        let timestamp = locationData.timestamp.timeIntervalSince1970

        if let start = trackingStartTime, timestamp < start {
            logLocation(.info, "Location before tracking start rejected", locationData, reason: "before_tracking_start")
            return nil
        }

        if timestamp <= lastAcceptedTimestamp {
            logLocation(.warning, "Out-of-order GPS sample rejected", locationData, reason: "timestamp_regression")
            return nil
        }

        guard isValidLocation(locationData) else {
            logLocation(.warning, "Invalid location data", locationData, reason: "validation_failed")
            return nil
        }

        let calibrationResult = await calibrationManager.processLocation(locationData)
        switch calibrationResult {
        case .calibrating:
            return nil

        case .calibrated(let calibratedData):
            if let filteredData = await applyLocationFiltering(calibratedData) {
                lastValidLocation = filteredData
                lastAcceptedTimestamp = timestamp
                addToBuffer(filteredData)
                return filteredData
            }

        case .failed(_):
            if let filteredData = await applyLocationFiltering(locationData) {
                lastValidLocation = filteredData
                lastAcceptedTimestamp = timestamp
                addToBuffer(filteredData)
                return filteredData
            }
        }

        return nil
    }
    
    func getBufferedLocations() async -> [LocationData] {
        return Array(locationBuffer)
    }

    func clearBuffer() async {
        locationBuffer.removeAll()
    }

    func resetLastValidLocation() {
        lastValidLocation = nil
    }

    func resetCalibration() async {
        await calibrationManager.reset()

        await courseValidator.reset()
        lastValidLocation = nil
        lastAcceptedTimestamp = 0
        locationBuffer.removeAll()
    }

    func getCalibrationState() async -> GPSCalibrationState {
        return await calibrationManager.getState()
    }

    func getCalibrationProgress() async -> CalibrationProgress? {
        return await calibrationManager.getProgress()
    }

    func getCurrentAltitude() async -> Double {
        return lastValidLocation?.altitude ?? 0.0
    }

    private func calculateRecentAverageSpeed(last count: Int) -> Double? {
        guard locationBuffer.count >= 2 else { return nil }

        let recentLocations = Array(locationBuffer.suffix(min(count, locationBuffer.count)))
        guard recentLocations.count >= 2 else { return nil }

        var totalDistance: Double = 0
        var totalTime: TimeInterval = 0

        for i in 1..<recentLocations.count {
            let prev = recentLocations[i - 1]
            let curr = recentLocations[i]

            let distance = prev.coordinate.distance(to: curr.coordinate)
            let time = curr.timestamp.timeIntervalSince(prev.timestamp)

            totalDistance += distance
            totalTime += time
        }

        guard totalTime > 0 else { return nil }
        return totalDistance / totalTime
    }

    private func calculatePreviousAcceleration() -> Double? {
        guard locationBuffer.count >= 3 else { return nil }

        let locations = Array(locationBuffer.suffix(3))
        let loc1 = locations[0]
        let loc2 = locations[1]
        let loc3 = locations[2]

        let speed1 = loc1.speed
        let speed2 = loc2.speed

        let timeDiff = loc3.timestamp.timeIntervalSince(loc2.timestamp)

        guard timeDiff > 0 else { return nil }

        let acceleration = (speed2 - speed1) / timeDiff
        return acceleration
    }

    func getLastValidLocation() async -> LocationData? {
        return lastValidLocation
    }

    private func isValidLocation(_ locationData: LocationData) -> Bool {
        guard locationData.horizontalAccuracy > 0 &&
              locationData.horizontalAccuracy <= validationConfig.maxAccuracy else {
            logger.warning(
                "Accuracy rejected | current: \(String(format: "%.1f", locationData.horizontalAccuracy))m, max: \(String(format: "%.1f", validationConfig.maxAccuracy))m",
                category: .location
            )
            return false
        }

        guard locationData.coordinate.isValid else {
            return false
        }

        guard !locationData.coordinate.isNullIsland else {
            logger.warning("Null Island detected (0,0) - GPS error", category: .location)
            return false
        }

        if locationData.speed < 0 {
            return false
        }

        return true
    }

    private func applyLocationFiltering(_ locationData: LocationData) async -> LocationData? {
        guard let lastLocation = lastValidLocation else {
            return locationData
        }

        let currentLocation = locationData
        let distance = lastLocation.coordinate.distance(to: currentLocation.coordinate)
        let timeDiff = currentLocation.timestamp.timeIntervalSince(lastLocation.timestamp)

        if distance == 0 {
            return nil
        }

        guard timeDiff > 0 else { return nil }
        let instantSpeed = distance / timeDiff

        // Course validation for direction changes is temporarily disabled
//        if enableCourseValidation {
//            if instantSpeed >= validationConfig.minSpeedForCourseValidation {
//                let courseValidation = await courseValidator.validate(currentLocation, previousLocation: lastLocation)
//                if !courseValidation.isValid {
//                    logger.warning("SPIKE REJECTED: Course validation failed at speed \(String(format: "%.1f", instantSpeed))m/s", category: .location)
//                    return nil
//                }
//            }
//        }

        // Time-based filtering
//        if timeDiff < validationConfig.minTimeInterval {
//            return nil
//        }

        // Jitter filtering for short time windows
//        if timeDiff < validationConfig.jitterTimeWindow {
//            if distance < validationConfig.minDistanceForJitter {
//                return nil
//            }
//        }

        // Speed validation - absolute maximum
//        if instantSpeed > validationConfig.absoluteMaxSpeed {
//            logger.warning("Speed rejected: \(String(format: "%.1f", instantSpeed))m/s > max \(String(format: "%.1f", validationConfig.absoluteMaxSpeed))m/s", category: .location)
//            return nil
//        }

        // Speed validation - sustained maximum (with recent average check)
//        if instantSpeed > validationConfig.sustainedMaxSpeed {
//            if let recentAvgSpeed = calculateRecentAverageSpeed(last: 5) {
//                if recentAvgSpeed >= 0.9 * validationConfig.sustainedMaxSpeed {
//                    logger.warning("Sustained speed rejected: \(String(format: "%.1f", instantSpeed))m/s, recent avg: \(String(format: "%.1f", recentAvgSpeed))m/s", category: .location)
//                    return nil
//                }
//            } else {
//                return nil
//            }
//        }

        // Speed spike detection
//        if let recentAvgSpeed = calculateRecentAverageSpeed(last: 10), recentAvgSpeed > 1.0 {
//            let speedMultiple = instantSpeed / recentAvgSpeed
//            if speedMultiple > validationConfig.speedSpikeMultiplier {
//                logger.warning("Speed spike rejected: \(String(format: "%.1f", speedMultiple))x recent average", category: .location)
//                return nil
//            }
//        }

        // Acceleration validation
//        let acceleration = (instantSpeed - lastLocation.speed) / timeDiff
//        if abs(acceleration) > validationConfig.maxAcceleration {
//            logger.warning("Acceleration rejected: \(String(format: "%.1f", abs(acceleration)))m/s² > max \(String(format: "%.1f", validationConfig.maxAcceleration))m/s²", category: .location)
//            return nil
//        }

        // Jerk validation (rate of acceleration change)
//        if let previousAcceleration = calculatePreviousAcceleration() {
//            let jerk = (acceleration - previousAcceleration) / timeDiff
//            if abs(jerk) > validationConfig.maxAccelerationChangeRate {
//                logger.warning("Jerk rejected: \(String(format: "%.1f", abs(jerk)))m/s³", category: .location)
//                return nil
//            }
//        }

//        if locationData.horizontalAccuracy > lastLocation.horizontalAccuracy * 2.5 {
//            logger.warning("Accuracy degraded significantly | current: \(String(format: "%.1f", locationData.horizontalAccuracy))m, last: \(String(format: "%.1f", lastLocation.horizontalAccuracy))m", category: .location)
//            return nil
//        }

        logger.info("GPS accepted | dist: \(String(format: "%.1f", distance))m, speed: \(String(format: "%.1f", instantSpeed))m/s, acc: \(String(format: "%.1f", locationData.horizontalAccuracy))m", category: .location)

        return LocationData(
            coordinate: currentLocation.coordinate,
            altitude: currentLocation.altitude,
            horizontalAccuracy: currentLocation.horizontalAccuracy,
            verticalAccuracy: currentLocation.verticalAccuracy,
            speed: instantSpeed,
            course: currentLocation.course,
            timestamp: currentLocation.timestamp
        )
    }

    private func addToBuffer(_ locationData: LocationData) {
        locationBuffer.append(locationData)

        if locationBuffer.count > maxBufferSize {
            locationBuffer.removeFirst(locationBuffer.count - maxBufferSize)
        }
    }
    
    private func logLocation(
        _ level: LogLevel,
        _ message: String,
        _ locationData: LocationData,
        reason: String
    ) {
        let timestamp = locationData.timestamp.timeIntervalSince1970
        let structuredMessage = "\(message) | lat=\(String(format: "%.6f", locationData.coordinate.latitude)) lon=\(String(format: "%.6f", locationData.coordinate.longitude)) acc=\(String(format: "%.1f", locationData.horizontalAccuracy))m ts=\(Int(timestamp)) reason=\(reason)"
        
        switch level {
        case .debug:
            logger.info(structuredMessage, category: .location)
        case .info:
            logger.info(structuredMessage, category: .location)
        case .warning:
            logger.warning(structuredMessage, category: .location)
        case .error:
            logger.error(structuredMessage, category: .location)
        case .critical:
            logger.error(structuredMessage, category: .location)
        }
    }
}


