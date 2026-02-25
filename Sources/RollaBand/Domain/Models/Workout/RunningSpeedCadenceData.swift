import Foundation

public struct RunningSpeedCadenceData: Sendable, Equatable {
    public let deviceUUID: BLEDeviceIdentifier
    public let instantaneousSpeed: Double // km/h
    public let instantaneousCadence: Int // steps/min
//    public let instantaneousStrideLength: Int? // cm
//    public let totalDistance: UInt32? // m
//    public let isRunning: Bool
    public let timestamp: Date

    public init(
        deviceUUID: BLEDeviceIdentifier,
        instantaneousSpeed: Double,
        instantaneousCadence: Int,
//        instantaneousStrideLength: Int? = nil,
//        totalDistance: UInt32? = nil,
//        isRunning: Bool,
        timestamp: Date = Date()
    ) {
        self.deviceUUID = deviceUUID
        self.instantaneousSpeed = instantaneousSpeed
        self.instantaneousCadence = instantaneousCadence
//        self.instantaneousStrideLength = instantaneousStrideLength
//        self.totalDistance = totalDistance
//        self.isRunning = isRunning
        self.timestamp = timestamp
    }
}

