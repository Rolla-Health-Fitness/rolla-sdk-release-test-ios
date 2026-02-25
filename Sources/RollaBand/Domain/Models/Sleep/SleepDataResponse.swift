import Foundation

public struct SleepDataResponse {
    public let entries: [ConsolidatedSleepStage]
    public let lastSyncedEntryTimestamp: Int
    public let lastSyncedBaseTimestamp: Int

    public init(entries: [ConsolidatedSleepStage], lastSyncedEntryTimestamp: Int, lastSyncedBaseTimestamp: Int) {
        self.entries = entries
        self.lastSyncedEntryTimestamp = lastSyncedEntryTimestamp
        self.lastSyncedBaseTimestamp = lastSyncedBaseTimestamp
    }
}
