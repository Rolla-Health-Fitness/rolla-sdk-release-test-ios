import Foundation
import QuartzCore

public protocol ClockProtocol: Sendable {
    func now() -> CFTimeInterval
    func uptime() -> CFTimeInterval
}

public struct SystemClock: ClockProtocol {
    public init() {}

    public func now() -> CFTimeInterval {
        return CFAbsoluteTimeGetCurrent()
    }

    public func uptime() -> CFTimeInterval {
        return CACurrentMediaTime()
    }
}
