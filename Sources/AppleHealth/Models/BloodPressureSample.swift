import Foundation

public struct AHBloodPressureSample: Sendable {
    public let startTimestamp: Int64
    public let systolic: Double
    public let diastolic: Double

    public init(startTimestamp: Int64, systolic: Double, diastolic: Double) {
        self.startTimestamp = startTimestamp
        self.systolic = systolic
        self.diastolic = diastolic
    }
}
