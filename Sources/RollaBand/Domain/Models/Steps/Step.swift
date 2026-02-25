import Foundation

public struct Step: Sendable, Equatable {
    public let timestamp: Int
    public let steps: Int
    public let calories: Double
    public init(timestamp: Int, steps: Int, calories: Double) {
        self.timestamp = timestamp
        self.steps = steps
        self.calories = calories
    }
}
