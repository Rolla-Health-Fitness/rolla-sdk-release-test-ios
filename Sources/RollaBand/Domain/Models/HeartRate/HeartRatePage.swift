import Foundation

public struct HeartRatePage: RollaBandDataPage {
    public typealias Block = HeartRateDataBlock
    
    public let blocks: [HeartRateDataBlock]
    public let hasMoreData: Bool
    
    public init(blocks: [HeartRateDataBlock], hasMoreData: Bool) {
        self.blocks = blocks
        self.hasMoreData = hasMoreData
    }
}
