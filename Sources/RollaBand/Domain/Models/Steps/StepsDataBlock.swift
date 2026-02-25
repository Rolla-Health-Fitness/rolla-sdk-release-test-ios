import Foundation

public struct StepsDataBlock: RollaBandDataBlock {
    public typealias Entry = StepsDataEntry

    public let entries: [StepsDataEntry]
    public let totalEntriesCount: Int
    public let oldestEntryTimestamp: Int?
    public let hasReachedEndMarker: Bool

    public init(
        entries: [StepsDataEntry],
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
