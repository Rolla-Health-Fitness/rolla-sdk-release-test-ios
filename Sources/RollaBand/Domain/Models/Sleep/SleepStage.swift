import Foundation

public struct SleepStage: Equatable {
    public let timestamp: Int
    public let value: SleepStageValue
    public init(timestamp: Int, value: SleepStageValue) {
        self.timestamp = timestamp
        self.value = value
    }
}
