import Foundation

public struct RollaBandNotificationMatcher: NotificationMatcher {
    private let expectedCommand: RollaBandCommand
    
    public init(expectedCommand: RollaBandCommand) {
        self.expectedCommand = expectedCommand
    }
    
    public func matches(_ data: Data?) -> Bool {
        return RollaBandValidator.matches(data, for: expectedCommand)
    }
}
