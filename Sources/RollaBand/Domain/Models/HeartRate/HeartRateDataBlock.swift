import Foundation

public struct HeartRateDataBlock: RollaBandDataBlock {
    public typealias Entry = HeartRateDataEntry

    public let entries: [HeartRateDataEntry]
    public let totalEntriesCount: Int
    public let oldestEntryTimestamp: Int?
    public let hasReachedEndMarker: Bool

    public init(entries: [HeartRateDataEntry], totalEntriesCount: Int, oldestEntryTimestamp: Int?, hasReachedEndMarker: Bool) {
        self.entries = entries
        self.totalEntriesCount = totalEntriesCount
        self.oldestEntryTimestamp = oldestEntryTimestamp
        self.hasReachedEndMarker = hasReachedEndMarker
    }
}
