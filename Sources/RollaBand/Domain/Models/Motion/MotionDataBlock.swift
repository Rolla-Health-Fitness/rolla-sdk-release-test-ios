import Foundation

public struct MotionDataBlock: RollaBandDataBlock {
    public typealias Entry = MotionDataEntry

    public let entries: [MotionDataEntry]
    public let totalEntriesCount: Int
    public let oldestEntryTimestamp: Int?
    public let hasReachedEndMarker: Bool

    public init(
        entries: [MotionDataEntry],
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

