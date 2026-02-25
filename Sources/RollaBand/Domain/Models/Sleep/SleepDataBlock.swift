import Foundation

public struct SleepDataBlock: RollaBandDataBlock {
    public typealias Entry = SleepDataEntry

    public let entries: [SleepDataEntry]
    public let totalEntriesCount: Int
    public let oldestEntryTimestamp: Int?
    public let hasReachedEndMarker: Bool

    public init(
        entries: [SleepDataEntry],
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
