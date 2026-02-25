import Foundation

public struct HeartRateDataResponse {
    public let entries: [HeartRate]
    public let activityLastSyncedBaseTimestamp: Int
    public let activityLastSyncedEntryTimestamp: Int
    public let passiveLastSyncedBaseTimestamp: Int
    public init(
        entries: [HeartRate],
        activityLastSyncedBaseTimestamp: Int,
        activityLastSyncedEntryTimestamp: Int,
        passiveLastSyncedBaseTimestamp: Int
    ) {
        self.entries = entries
        self.activityLastSyncedBaseTimestamp = activityLastSyncedBaseTimestamp
        self.activityLastSyncedEntryTimestamp = activityLastSyncedEntryTimestamp
        self.passiveLastSyncedBaseTimestamp = passiveLastSyncedBaseTimestamp
    }
}
