import Foundation

public struct SleepPage: RollaBandDataPage {
    public typealias Block = SleepDataBlock
    
    public let blocks: [SleepDataBlock]
    public let hasMoreData: Bool
    
    public init(blocks: [SleepDataBlock], hasMoreData: Bool) {
        self.blocks = blocks
        self.hasMoreData = hasMoreData
    }
}
