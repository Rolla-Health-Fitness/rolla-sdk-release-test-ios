import Foundation

public enum AHAuthorizationStatus: Sendable, Equatable {
    case success // Authorization was granted (or user was prompted)
    case notAvailable
    case error(String)
}

