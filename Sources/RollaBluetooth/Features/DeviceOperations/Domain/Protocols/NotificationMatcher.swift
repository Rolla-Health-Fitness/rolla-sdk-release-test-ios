import Foundation

public protocol NotificationMatcher: Sendable {
    func matches(_ data: Data?) -> Bool
}
