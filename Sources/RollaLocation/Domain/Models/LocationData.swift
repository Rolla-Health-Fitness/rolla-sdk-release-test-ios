import Foundation

public struct LocationData: Sendable {
    public let coordinate: Coordinate
    public let altitude: Double
    public let horizontalAccuracy: Double
    public let verticalAccuracy: Double
    public let speed: Double
    public let course: Double
    public let timestamp: Date

    public init(
        coordinate: Coordinate,
        altitude: Double,
        horizontalAccuracy: Double,
        verticalAccuracy: Double,
        speed: Double,
        course: Double,
        timestamp: Date
    ) {
        self.coordinate = coordinate
        self.altitude = altitude
        self.horizontalAccuracy = horizontalAccuracy
        self.verticalAccuracy = verticalAccuracy
        self.speed = speed
        self.course = course
        self.timestamp = timestamp
    }
}

extension LocationData: Equatable {
    public static func == (lhs: LocationData, rhs: LocationData) -> Bool {
        return lhs.coordinate.latitude == rhs.coordinate.latitude &&
        lhs.coordinate.longitude == rhs.coordinate.longitude &&
        lhs.altitude == rhs.altitude &&
        lhs.horizontalAccuracy == rhs.horizontalAccuracy &&
        lhs.verticalAccuracy == rhs.verticalAccuracy &&
        lhs.timestamp == rhs.timestamp &&
        lhs.speed == rhs.speed &&
        lhs.course == rhs.course
    }

    private var isNullIsland: Bool {
        return coordinate.isNullIsland
    }
}
