import Foundation

public struct StepsDataPage: Sendable, Equatable, RollaBandDataPage {
    public typealias Block = StepsDataBlock

    public let blocks: [StepsDataBlock]
    public let hasMoreData: Bool

    public init(blocks: [StepsDataBlock], hasMoreData: Bool) {
        self.blocks = blocks
        self.hasMoreData = hasMoreData
    }
}
