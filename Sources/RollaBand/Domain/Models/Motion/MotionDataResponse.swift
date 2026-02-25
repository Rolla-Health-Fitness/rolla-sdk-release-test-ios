import Foundation

public struct MotionDataResponse {
    public let motionPoints: [MotionPoint]

    public init(motionPoints: [MotionPoint]) {
        self.motionPoints = motionPoints
    }
}

