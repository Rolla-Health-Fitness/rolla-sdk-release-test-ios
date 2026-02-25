import Foundation

public struct StepsDataEntry: RollaBandDataEntry {
    public let dataNumber: Int
    public let baseTimestamp: Int
    public let totalSteps: UInt16
    public let totalCalories: Double // for 10 min entry
    public let totalDistance: Double
    public let steps: [Step]
    public init(
        dataNumber: Int,
        baseTimestamp: Int,
        totalSteps: UInt16,
        totalCalories: Double,
        totalDistance: Double,
        steps: [Step]
    ) {
        self.dataNumber = dataNumber
        self.baseTimestamp = baseTimestamp
        self.totalSteps = totalSteps
        self.totalCalories = totalCalories
        self.totalDistance = totalDistance
        self.steps = steps
    }
}
