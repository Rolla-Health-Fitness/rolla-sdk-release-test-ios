import Foundation

public struct AHHealthStatistics: Sendable {
    public let startDate: Date
    public let endDate: Date
    public let sum: Double?
    public let average: Double?
    public let min: Double?
    public let max: Double?

    public init(
        startDate: Date,
        endDate: Date,
        sum: Double? = nil,
        average: Double? = nil,
        min: Double? = nil,
        max: Double? = nil
    ) {
        self.startDate = startDate
        self.endDate = endDate
        self.sum = sum
        self.average = average
        self.min = min
        self.max = max
    }
}

