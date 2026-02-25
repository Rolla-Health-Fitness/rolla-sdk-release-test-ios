import Foundation

public struct HeartRate: Equatable {
    public let timestamp: Int
    public let value: Int
    public init(timestamp: Int, value: Int) {
        self.timestamp = timestamp
        self.value = value
    }
}
