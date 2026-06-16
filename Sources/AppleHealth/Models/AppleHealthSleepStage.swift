import Foundation

public enum AHSleepStageType: String, Sendable, CaseIterable {
    case awake
    case light
    case deep
    case rem
}

public struct AHSleepSample: Sendable {
    public let startTimestamp: Int // milliseconds since epoch
    public let endTimestamp: Int
    public let stage: AHSleepStageType

    public init(startTimestamp: Int, endTimestamp: Int, stage: AHSleepStageType) {
        self.startTimestamp = startTimestamp
        self.endTimestamp = endTimestamp
        self.stage = stage
    }
}

