import Foundation

public protocol RollaDelegate: AnyObject {
    func rollaDidClose(_ rolla: Rolla, reason: RollaCloseReason)
    func rolla(_ rolla: Rolla, didFailWithError error: RollaError)
}

public extension RollaDelegate {
    func rollaDidClose(_ rolla: Rolla, reason: RollaCloseReason) {}
    func rolla(_ rolla: Rolla, didFailWithError error: RollaError) {}
}
