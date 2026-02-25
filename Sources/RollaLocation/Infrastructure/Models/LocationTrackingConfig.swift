import CoreLocation

public struct LocationTrackingConfig: Sendable {
    let desiredAccuracy: CLLocationAccuracy
    let distanceFilter: CLLocationDistance
    let allowsBackgroundLocationUpdates: Bool

    init(
        desiredAccuracy: CLLocationAccuracy,
        distanceFilter: CLLocationDistance,
        allowsBackgroundLocationUpdates: Bool
    ) {
        self.desiredAccuracy = desiredAccuracy
        self.distanceFilter = distanceFilter
        self.allowsBackgroundLocationUpdates = allowsBackgroundLocationUpdates
    }
    
    static func forActivity(_ activityType: LocationActivityType) -> LocationTrackingConfig {
        switch activityType {
        case .run:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyBest,
                distanceFilter: 2.0,
                allowsBackgroundLocationUpdates: true
            )

        case .cycling:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyBestForNavigation,
                distanceFilter: 1.0,
                allowsBackgroundLocationUpdates: true
            )

        case .walk:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyBest,
                distanceFilter: 2.0,
                allowsBackgroundLocationUpdates: true
            )

        case .hiking:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyBest,
                distanceFilter: 3.0,
                allowsBackgroundLocationUpdates: true
            )

        case .other:
            return LocationTrackingConfig(
                desiredAccuracy: kCLLocationAccuracyNearestTenMeters,
                distanceFilter: 10.0,
                allowsBackgroundLocationUpdates: true
            )
        }
    }
}
