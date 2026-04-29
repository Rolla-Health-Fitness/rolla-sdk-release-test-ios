import CoreLocation

public struct LocationTrackingConfig: Sendable {
    let desiredAccuracy: CLLocationAccuracy
    let distanceFilter: CLLocationDistance
    let clActivityType: CLActivityType
    let allowsBackgroundLocationUpdates: Bool
    let maxAccuracy: CLLocationAccuracy
    let maxSpeedMps: Double
    let gapResetThresholdSeconds: TimeInterval
    let maxConsecutiveRejections: Int
    let calibrationConfig: GPSCalibrationConfig
    let resetCalibrationOnGap: Bool
    /// Floor value for minimum emit distance: max(floor, min(accuracy * 0.5, 8.0)).
    let minEmitDistanceFloor: Double
    /// Upper bound on EMA alpha: min(cap, max(0.2, 5.0 / accuracy)).
    let emaAlphaCap: Double
    /// Doppler speed threshold for consecutive-slow counting in StationaryDetector.
    let stationarySpeedEntry: Double
    /// Number of consecutive readings below entry threshold to declare stationary.
    let stationaryConsecutiveRequired: Int
    /// Doppler speed above which stationary state is exited.
    let stationarySpeedExit: Double
    /// Displacement (meters) above which stationary state is exited.
    let stationaryDisplacementExit: Double

    static func forActivity(_ activityType: LocationActivityType) -> LocationTrackingConfig {
        switch activityType {

        case .run:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyBest,
                distanceFilter: kCLDistanceFilterNone,
                clActivityType: .fitness,
                allowsBackgroundLocationUpdates: true,
                // 20 m: urban runners pass tall buildings regularly; tighter would drop valid fixes
                maxAccuracy: 20.0,
                // 12.5 m/s = 45 km/h — just above Usain Bolt's peak (12.4 m/s)
                maxSpeedMps: 12.5,
                // Runners move continuously; a 30 s GPS outage is a real signal problem
                gapResetThresholdSeconds: 30.0,
                // 6 consecutive rejections ≈ 6 s of GPS teleporting — clearly a bad fix burst
                maxConsecutiveRejections: 6,
                calibrationConfig: GPSCalibrationConfig(
                    calibrationDuration: 6.0,
                    minPointsForCalibration: 4,
                    maxCalibrationAccuracy: 25.0
                ),
                resetCalibrationOnGap: false,
                minEmitDistanceFloor: 3.0,
                emaAlphaCap: 1.0,
                stationarySpeedEntry: 0.40,
                stationaryConsecutiveRequired: 3,
                stationarySpeedExit: 0.45,
                stationaryDisplacementExit: 3.0
            )

        case .cycling:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyBest,
                distanceFilter: kCLDistanceFilterNone,
                clActivityType: .fitness,
                allowsBackgroundLocationUpdates: true,
                // 20 m: cyclists move fast so accuracy is generally good; 20 m is generous enough
                maxAccuracy: 20.0,
                // 25 m/s = 90 km/h — covers downhill racing, well above typical 30–40 km/h riding
                maxSpeedMps: 25.0,
                // Cycling red lights can be 60–90 s; tunnels can be 30–60 s.
                // Gap reset fires only during GPS HARDWARE outages (no fixes arriving at all).
                // A stationary cyclist at a red light still produces valid GPS fixes, so the
                // gap timer is refreshed by those fixes and never fires.
                // 90 s handles even very long red light cycles where GPS signal drops under a bridge.
                gapResetThresholdSeconds: 90.0,
                // Cyclists can have GPS shadow from buildings for several seconds
                maxConsecutiveRejections: 8,
                calibrationConfig: GPSCalibrationConfig(
                    calibrationDuration: 6.0,
                    minPointsForCalibration: 4,
                    maxCalibrationAccuracy: 30.0
                ),
                resetCalibrationOnGap: false,
                minEmitDistanceFloor: 3.0,
                emaAlphaCap: 1.0,
                stationarySpeedEntry: 0.40,
                stationaryConsecutiveRequired: 3,
                stationarySpeedExit: 0.45,
                stationaryDisplacementExit: 3.0
            )

        case .walk:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyBest,
                distanceFilter: kCLDistanceFilterNone,
                clActivityType: .fitness,
                allowsBackgroundLocationUpdates: true,
                // 25 m: walkers are slower so fix rate matters more than peak accuracy
                maxAccuracy: 25.0,
                // 3.5 m/s = 12.6 km/h — competitive race walkers reach ~4 m/s; 3.5 catches
                // GPS jumps while allowing fast walkers without false rejections
                maxSpeedMps: 3.5,
                // Pedestrians stop at crossings (30–90 s). Gap reset is for GPS hardware outages
                // only; pedestrians at lights still produce valid stationary GPS fixes.
                gapResetThresholdSeconds: 90.0,
                // Walkers cross building facades regularly; be tolerant of short rejection runs
                maxConsecutiveRejections: 10,
                calibrationConfig: GPSCalibrationConfig(
                    calibrationDuration: 6.0,
                    minPointsForCalibration: 3,
                    maxCalibrationAccuracy: 30.0
                ),
                resetCalibrationOnGap: false,
                // Wider floor eliminates zig-zag at walking pace
                minEmitDistanceFloor: 5.0,
                // Cap smoothing so GPS scatter doesn't pass through at good accuracy
                emaAlphaCap: 0.6,
                // Lower entry threshold avoids false stationary during slow walking
                stationarySpeedEntry: 0.30,
                // Extra reading required to confirm stationary — reduces micro-stop false triggers
                stationaryConsecutiveRequired: 4,
                // Tighter exit for faster recovery from genuine stops at walking pace
                stationarySpeedExit: 0.40,
                // 5.0m: indoor GPS scatter on iPhone 11 easily exceeds 2.5m in
                // the 8s position buffer, causing false displacement-exit flicker.
                // 5.0m absorbs typical indoor scatter while still allowing
                // genuine walk-away to trip the exit within a few steps.
                stationaryDisplacementExit: 5.0
            )

        case .hiking:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyBest,
                distanceFilter: kCLDistanceFilterNone,
                clActivityType: .fitness,
                allowsBackgroundLocationUpdates: true,
                // 40 m: dense forest canopy regularly degrades GPS accuracy to 25–45 m.
                // At 30 m half the forest fixes get rejected, causing route gaps.
                // 40 m accepts most forest-quality fixes while still rejecting pure WiFi/cell positions.
                maxAccuracy: 40.0,
                // 3.0 m/s = 10.8 km/h — covers fast trail running segments on hikes;
                // normal hiking is 0.5–1.5 m/s, fast is 2.5 m/s on open terrain
                maxSpeedMps: 3.0,
                // Hikers rest under tree cover; GPS can drop for 60–120 s in dense forest.
                // Long threshold preserves route continuity during forest navigation.
                gapResetThresholdSeconds: 120.0,
                // Dense forest can cause many consecutive multipath rejections
                maxConsecutiveRejections: 12,
                calibrationConfig: GPSCalibrationConfig(
                    calibrationDuration: 6.0,
                    minPointsForCalibration: 5,
                    maxCalibrationAccuracy: 50.0
                ),
                resetCalibrationOnGap: false,
                // Wider floor like walk — hiking pace is similar
                minEmitDistanceFloor: 5.0,
                // Cap smoothing for forest GPS scatter
                emaAlphaCap: 0.6,
                // Slightly higher than walk — hikers pause more deliberately
                stationarySpeedEntry: 0.35,
                // Extra reading required like walk
                stationaryConsecutiveRequired: 4,
                // Tighter exit like walk — hiking pace is similar
                stationarySpeedExit: 0.42,
                // Match walk: 5.0m to prevent indoor/forest scatter flicker
                stationaryDisplacementExit: 5.0
            )

        case .other:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyBest,
                distanceFilter: kCLDistanceFilterNone,
                clActivityType: .fitness,
                allowsBackgroundLocationUpdates: true,
                // 30 m: conservative — unknown activity may be indoors or mixed environment
                maxAccuracy: 30.0,
                // 10 m/s = 36 km/h — reasonable cap for unknown activity type
                maxSpeedMps: 10.0,
                // 60 s: moderate tolerance for unknown environment
                gapResetThresholdSeconds: 60.0,
                maxConsecutiveRejections: 8,
                calibrationConfig: GPSCalibrationConfig(
                    calibrationDuration: 6.0,
                    minPointsForCalibration: 4,
                    maxCalibrationAccuracy: 40.0
                ),
                resetCalibrationOnGap: false,
                minEmitDistanceFloor: 3.0,
                // Slight EMA cap for unknown activities
                emaAlphaCap: 0.8,
                stationarySpeedEntry: 0.40,
                stationaryConsecutiveRequired: 3,
                stationarySpeedExit: 0.45,
                stationaryDisplacementExit: 3.0
            )
        }
    }
    
    private init(
        desiredAccuracy: CLLocationAccuracy,
        distanceFilter: CLLocationDistance,
        clActivityType: CLActivityType,
        allowsBackgroundLocationUpdates: Bool,
        maxAccuracy: CLLocationAccuracy,
        maxSpeedMps: Double,
        gapResetThresholdSeconds: TimeInterval,
        maxConsecutiveRejections: Int,
        calibrationConfig: GPSCalibrationConfig,
        resetCalibrationOnGap: Bool = false,
        minEmitDistanceFloor: Double = 3.0,
        emaAlphaCap: Double = 1.0,
        stationarySpeedEntry: Double = 0.40,
        stationaryConsecutiveRequired: Int = 3,
        stationarySpeedExit: Double = 0.45,
        stationaryDisplacementExit: Double = 3.0
    ) {
        self.desiredAccuracy = desiredAccuracy
        self.distanceFilter = distanceFilter
        self.clActivityType = clActivityType
        self.allowsBackgroundLocationUpdates = allowsBackgroundLocationUpdates
        self.maxAccuracy = maxAccuracy
        self.maxSpeedMps = maxSpeedMps
        self.gapResetThresholdSeconds = gapResetThresholdSeconds
        self.maxConsecutiveRejections = maxConsecutiveRejections
        self.calibrationConfig = calibrationConfig
        self.resetCalibrationOnGap = resetCalibrationOnGap
        self.minEmitDistanceFloor = minEmitDistanceFloor
        self.emaAlphaCap = emaAlphaCap
        self.stationarySpeedEntry = stationarySpeedEntry
        self.stationaryConsecutiveRequired = stationaryConsecutiveRequired
        self.stationarySpeedExit = stationarySpeedExit
        self.stationaryDisplacementExit = stationaryDisplacementExit
    }
}


