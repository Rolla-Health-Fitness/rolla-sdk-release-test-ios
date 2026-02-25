import Foundation

public struct StepsDataResponse {
    public let steps: [Step]
    public let lastSyncedBaseTimestamp: Int
    public let lastSyncedEntryTimestamp: Int
    public init(steps: [Step], lastSyncedBaseTimestamp: Int, lastSyncedEntryTimestamp: Int) {
        self.steps = steps
        self.lastSyncedBaseTimestamp = lastSyncedBaseTimestamp
        self.lastSyncedEntryTimestamp = lastSyncedEntryTimestamp
    }
}
