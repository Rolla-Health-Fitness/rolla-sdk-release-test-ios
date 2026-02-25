import Foundation

public struct HRVPage: RollaBandDataPage {
    public typealias Block = HRVDataBlock
    
    public let blocks: [HRVDataBlock]
    public let hasMoreData: Bool
    
    public init(blocks: [HRVDataBlock], hasMoreData: Bool) {
        self.blocks = blocks
        self.hasMoreData = hasMoreData
    }
}
