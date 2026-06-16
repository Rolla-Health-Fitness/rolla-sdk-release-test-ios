import Foundation

public struct AHHealthSample: Sendable {
    public let startDate: Date
    public let endDate: Date
    public let value: Double
    public let unit: String

    public init(startDate: Date, endDate: Date, value: Double, unit: String) {
        self.startDate = startDate
        self.endDate = endDate
        self.value = value
        self.unit = unit
    }
}

