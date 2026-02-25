import Foundation

public struct MotionDataEntry: RollaBandDataEntry {
    public let dataNumber: Int
    public let baseTimestamp: Int
    public let motionPoints: [MotionPoint]
    
    public init(
        dataNumber: Int,
        baseTimestamp: Int,
        motionPoints: [MotionPoint]
    ) {
        self.dataNumber = dataNumber
        self.baseTimestamp = baseTimestamp
        self.motionPoints = motionPoints
    }
}

