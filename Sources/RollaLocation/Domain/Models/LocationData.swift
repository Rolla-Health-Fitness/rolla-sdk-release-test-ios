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
    private static let coordinateTolerance = 1e-9
    private static let scalarTolerance = 1e-6
    private static let timestampTolerance = 0.001

    public static func == (lhs: LocationData, rhs: LocationData) -> Bool {
        abs(lhs.coordinate.latitude - rhs.coordinate.latitude) < coordinateTolerance &&
        abs(lhs.coordinate.longitude - rhs.coordinate.longitude) < coordinateTolerance &&
        abs(lhs.altitude - rhs.altitude) < scalarTolerance &&
        abs(lhs.horizontalAccuracy - rhs.horizontalAccuracy) < scalarTolerance &&
        abs(lhs.verticalAccuracy - rhs.verticalAccuracy) < scalarTolerance &&
        abs(lhs.timestamp.timeIntervalSince(rhs.timestamp)) < timestampTolerance &&
        abs(lhs.speed - rhs.speed) < scalarTolerance &&
        abs(lhs.course - rhs.course) < scalarTolerance
    }

    private var isNullIsland: Bool {
        return coordinate.isNullIsland
    }
}
