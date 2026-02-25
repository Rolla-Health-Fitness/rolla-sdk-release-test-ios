import Foundation

public struct LocationDependencies {
    public let locationTrackingUseCase: LocationTrackingUseCase
    public let locationPermissionUseCase: LocationPermissionUseCase
    public let coreLocationManager: CoreLocationManager
    public let locationDataProcessor: LocationDataProcessing

    private let clock: ClockProtocol
    private let calibrationManager: GPSCalibrationManager
    private let courseValidator: CourseValidator

    public init(
        logger: Logging,
        clock: ClockProtocol = SystemClock()
    ) {
        self.calibrationManager = GPSCalibrationManager(
            config: .default,
            clock: clock,
            logger: logger
        )
        
        self.courseValidator = CourseValidator(logger: logger)
        self.locationDataProcessor = DefaultLocationDataProcessor(
            calibrationManager: calibrationManager,
            courseValidator: courseValidator,
            logger: logger
        )
        self.coreLocationManager = CoreLocationManager(logger: logger)
        
        self.locationTrackingUseCase = DefaultLocationTrackingUseCase(
            coreLocationManager: coreLocationManager,
            dataProcessor: locationDataProcessor,
            logger: logger
        )
        
        self.locationPermissionUseCase = DefaultLocationPermissionUseCase(
            locationManager: coreLocationManager,
            logger: logger
        )
        
        self.clock = clock
    }
}
