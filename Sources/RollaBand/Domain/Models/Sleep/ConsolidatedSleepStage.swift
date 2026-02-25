import Foundation

public struct ConsolidatedSleepStage: Equatable, Sendable {
    public let startTimestamp: Int
    public let endTimestamp: Int
    public let value: SleepStageValue
    public init(startTimestamp: Int, endTimestamp: Int, value: SleepStageValue) {
        self.startTimestamp = startTimestamp
        self.endTimestamp = endTimestamp
        self.value = value
    }
}
