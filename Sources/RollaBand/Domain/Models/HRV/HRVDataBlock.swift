import Foundation

public struct HRVDataBlock: RollaBandDataBlock {
    public typealias Entry = HRVDataEntry

    public let entries: [HRVDataEntry]
    public let totalEntriesCount: Int
    public let oldestEntryTimestamp: Int?
    public let hasReachedEndMarker: Bool

    public init(
        entries: [HRVDataEntry],
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
