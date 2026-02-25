import Foundation

public struct ActivityHeartRatePage: RollaBandDataPage {
    public typealias Block = ActivityHeartRateDataBlock
    
    public let blocks: [ActivityHeartRateDataBlock]
    public let hasMoreData: Bool
    
    public init(blocks: [ActivityHeartRateDataBlock], hasMoreData: Bool) {
        self.blocks = blocks
        self.hasMoreData = hasMoreData
    }
}
