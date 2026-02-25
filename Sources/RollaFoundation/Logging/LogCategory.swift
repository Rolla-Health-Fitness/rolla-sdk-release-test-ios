import Foundation

/// Extensible log category type that allows each package to define its own categories
public struct LogCategory: RawRepresentable, Hashable, Sendable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

// MARK: - Common Categories
public extension LogCategory {
    /// General/default category
    static let general = LogCategory("General")
}
