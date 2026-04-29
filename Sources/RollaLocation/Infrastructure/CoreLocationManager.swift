import Foundation
import CoreLocation

public final class CoreLocationManager: LocationManaging, @unchecked Sendable {
    private let locationManager: CLLocationManager
    private let delegate: CoreLocationManagerDelegateImpl
    private let locationEventStream: EventStreamSource<LocationData>
    private let logger: Logging
    private var isTracking = false
    private var currentConfig: LocationTrackingConfig?
    private var currentActivityType: LocationActivityType?

    init(
        locationEventStream: EventStreamSource<LocationData> = .init(maxContinuations: 5, bufferingPolicy: .bufferingNewest(20)),
        logger: Logging
    ) {
        self.locationEventStream = locationEventStream
        self.logger = logger
        self.locationManager = CLLocationManager()

        self.delegate = CoreLocationManagerDelegateImpl(
            locationEventStream: locationEventStream,
            logger: logger
        )
        self.locationManager.delegate = self.delegate
        self.delegate.setLocationManager(self)
    }

    @MainActor
    public func requestAlwaysLocationPermission() async throws {
        let currentStatus = locationManager.authorizationStatus

        if currentStatus == .authorizedAlways {
            logger.success("Location permission already granted (Always)", category: .location)
            return
        }
        
        // Treat "When In Use" as success to avoid hanging when iOS does not surface the upgrade prompt.
        // We can still encourage the user to enable "Always" later via settings/notification nudges.
        if currentStatus == .authorizedWhenInUse {
            logger.success("Location permission already granted (WhenInUse); proceeding without upgrade", category: .location)
            return
        }

        if currentStatus == .denied || currentStatus == .restricted {
            logger.error("Location permission denied or restricted", category: .location)
            throw LocationManagerError.notAuthorized
        }

        logger.info("Requesting always location permission", category: .location)

        return try await withCheckedThrowingContinuation { continuation in
            delegate.setAuthorizationContinuation(continuation)
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    @MainActor
    public func startLocationTracking(config: LocationTrackingConfig) async throws {
        guard !isTracking else {
            throw LocationManagerError.trackingAlreadyStarted
        }
        
        locationManager.desiredAccuracy = config.desiredAccuracy
        locationManager.distanceFilter = config.distanceFilter
        locationManager.activityType = config.clActivityType
        locationManager.pausesLocationUpdatesAutomatically = false

        if config.allowsBackgroundLocationUpdates {
            locationManager.allowsBackgroundLocationUpdates = true
            locationManager.showsBackgroundLocationIndicator = true
        }
        
        locationManager.startUpdatingLocation()
        currentConfig = config
        isTracking = true
    }
    
    @MainActor
    public func stopLocationTracking() async {
        locationManager.stopUpdatingLocation()
        locationManager.allowsBackgroundLocationUpdates = false
        
        isTracking = false
        currentConfig = nil
        currentActivityType = nil
    }
    
    public func locationStream() async -> AsyncStream<LocationData> {
        let (stream, _) = await locationEventStream.makeStream()
        return stream
    }
    
    public func isLocationTracking() async -> Bool {
        return isTracking
    }
    
    public func getCurrentActivityType() async -> LocationActivityType? {
        return currentActivityType
    }

    public func setCurrentActivityType(_ activityType: LocationActivityType?) async {
        currentActivityType = activityType
    }
}

public final class CoreLocationManagerDelegateImpl: NSObject, @preconcurrency CLLocationManagerDelegate, @unchecked Sendable {
    private let logger: Logging
    private let locationEventStream: EventStreamSource<LocationData>
    private var authorizationContinuation: CheckedContinuation<Void, Error>?
    private weak var locationManager: CoreLocationManager?

    init(
        locationEventStream: EventStreamSource<LocationData>,
        logger: Logging
    ) {
        self.logger = logger
        self.locationEventStream = locationEventStream
        super.init()
    }

    func setLocationManager(_ manager: CoreLocationManager) {
        self.locationManager = manager
    }

    func setAuthorizationContinuation(_ continuation: CheckedContinuation<Void, Error>) {
        self.authorizationContinuation = continuation
    }
    
    @MainActor
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            Task { [weak self] in
                guard let self = self else { return }
                await self.locationEventStream.yield(LocationData(from: location))
            }
        }
    }
    
    @MainActor
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        logger.error("Location error: \(error)", category: .location)

        if let clError = error as? CLError {
            switch clError.code {
            case .denied:
                logger.error("Location access denied", category: .location)
            case .locationUnknown:
                logger.warning("Location unknown, continuing", category: .location)
            case .network:
                logger.warning("Network error, will retry", category: .location)
            default:
                logger.error("Other location error: \(clError.localizedDescription)", category: .location)
            }
        }
    }

    @MainActor
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        logger.info("Location authorization changed to: \(status.rawValue)", category: .location)

        guard let continuation = authorizationContinuation else {
            return
        }

        authorizationContinuation = nil

        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            logger.success("Location permission granted", category: .location)
            continuation.resume()
        case .denied, .restricted:
            logger.error("Location permission denied or restricted", category: .location)
            continuation.resume(throwing: LocationManagerError.notAuthorized)
        case .notDetermined:
            authorizationContinuation = continuation
        @unknown default:
            logger.error("Unknown authorization status", category: .location)
            continuation.resume(throwing: LocationManagerError.notAuthorized)
        }
    }
}

private extension LocationData {
    init(from location: CLLocation) {
        self.coordinate = Coordinate(from: location.coordinate)
        self.altitude = location.altitude
        self.horizontalAccuracy = location.horizontalAccuracy
        self.verticalAccuracy = location.verticalAccuracy
        self.speed = location.speed
        self.course = location.course
        self.timestamp = location.timestamp
    }
}
