import Foundation

public struct MotionDataPage: Sendable, Equatable, RollaBandDataPage {
    public typealias Block = MotionDataBlock

    public let blocks: [MotionDataBlock]
    public let hasMoreData: Bool

    public init(blocks: [MotionDataBlock], hasMoreData: Bool) {
        self.blocks = blocks
        self.hasMoreData = hasMoreData
    }
}

