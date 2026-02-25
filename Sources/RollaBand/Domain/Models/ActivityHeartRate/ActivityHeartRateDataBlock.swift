import Foundation

public struct ActivityHeartRateDataBlock: RollaBandDataBlock {
    public typealias Entry = ActivityHeartRateDataEntry

    public let entries: [ActivityHeartRateDataEntry]
    public let totalEntriesCount: Int
    public let oldestEntryTimestamp: Int?
    public let hasReachedEndMarker: Bool

    public init(
        entries: [ActivityHeartRateDataEntry],
        totalEntriesCount: Int,
        oldestEntryTimestamp: Int?,
        hasReachedEndMarker: Bool
    ) {
        self.entries = entries
        self.totalEntriesCount = totalEntriesCount
        self.oldestEntryTimestamp = oldestEntryTimestamp
        self.hasReachedEndMarker = hasReachedEndMarker
    }
}
