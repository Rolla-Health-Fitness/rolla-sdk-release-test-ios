import Foundation

public struct HRVDataResponse {
    public let entries: [HRVDataEntry]
    public let lastSyncedBaseTimestamp: Int
    public init(entries: [HRVDataEntry], lastSyncedBaseTimestamp: Int) {
        self.entries = entries
        self.lastSyncedBaseTimestamp = lastSyncedBaseTimestamp
    }
}
