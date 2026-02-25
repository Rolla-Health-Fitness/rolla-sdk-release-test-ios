import Foundation

public struct SleepDataEntry: RollaBandDataEntry {
    public let dataNumber: Int
    public let baseTimestamp: Int
    public let sleepLength: Int
    public let sleepStages: [SleepStage]

    public init(
        dataNumber: Int,
        baseTimestamp: Int,
        sleepLength: Int,
        sleepStages: [SleepStage]
    ) {
        self.dataNumber = dataNumber
        self.baseTimestamp = baseTimestamp
        self.sleepLength = sleepLength
        self.sleepStages = sleepStages
    }
}
