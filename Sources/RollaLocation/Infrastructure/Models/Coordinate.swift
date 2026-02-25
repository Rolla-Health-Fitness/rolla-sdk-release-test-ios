import CoreLocation

public struct Coordinate: Sendable, Equatable {
    public let latitude: Double
    public let longitude: Double

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }

    public init(from clCoordinate: CLLocationCoordinate2D) {
        self.latitude = clCoordinate.latitude
        self.longitude = clCoordinate.longitude
    }

    public var clLocationCoordinate2D: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    public var isValid: Bool {
        return latitude >= -90 && latitude <= 90 &&
        longitude >= -180 && longitude <= 180
    }

    public var isNullIsland: Bool {
        return abs(latitude) < 0.001 && abs(longitude) < 0.001
    }

    public func distance(to other: Coordinate) -> Double {
        let fromLocation = CLLocation(latitude: latitude, longitude: longitude)
        let toLocation = CLLocation(latitude: other.latitude, longitude: other.longitude)
        return fromLocation.distance(from: toLocation)
    }
}
