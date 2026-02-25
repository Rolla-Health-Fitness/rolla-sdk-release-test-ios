import OSLog
import Foundation

public protocol Logging: Sendable {
    func log(_ level: LogLevel, _ message: String, category: LogCategory, file: String, function: String, line: Int)
    
    func debug(_ message: String, category: LogCategory, file: String, function: String, line: Int)
    func info(_ message: String, category: LogCategory, file: String, function: String, line: Int)
    func warning(_ message: String, category: LogCategory, file: String, function: String, line: Int)
    func error(_ message: String, category: LogCategory, file: String, function: String, line: Int)
    func critical(_ message: String, category: LogCategory, file: String, function: String, line: Int)
    
    func success(_ message: String, category: LogCategory, file: String, function: String, line: Int)
    func progress(_ message: String, category: LogCategory, file: String, function: String, line: Int)
    func failure(_ message: String, category: LogCategory, file: String, function: String, line: Int)
    func monitoring(_ message: String, category: LogCategory, file: String, function: String, line: Int)
}

public extension Logging {
    func debug(
        _ message: String,
        category: LogCategory = .general,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(.debug, "🔍 \(message)", category: category, file: file, function: function, line: line)
    }

    func info(
        _ message: String,
        category: LogCategory = .general,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(.info, "ℹ️ \(message)", category: category, file: file, function: function, line: line)
    }

    func warning(
        _ message: String,
        category: LogCategory = .general,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(.warning, "⚠️ \(message)", category: category, file: file, function: function, line: line)
    }

    func error(
        _ message: String,
        category: LogCategory = .general,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(.error, "❌ \(message)", category: category, file: file, function: function, line: line)
    }

    func critical(
        _ message: String,
        category: LogCategory = .general,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(.critical, "🚨 \(message)", category: category, file: file, function: function, line: line)
    }

    func success(
        _ message: String,
        category: LogCategory = .general,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(.info, "✅ \(message)", category: category, file: file, function: function, line: line)
    }

    func progress(
        _ message: String,
        category: LogCategory = .general,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(.info, "🔄 \(message)", category: category, file: file, function: function, line: line)
    }

    func failure(
        _ message: String,
        category: LogCategory = .general,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(.error, "❌ \(message)", category: category, file: file, function: function, line: line)
    }

    func monitoring(
        _ message: String,
        category: LogCategory,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        log(.info, "📡 \(message)", category: category, file: file, function: function, line: line)
    }
}

public final class RollaLogger: Logging {
    private let subsystem: String
    private var loggers: [LogCategory: Logger] = [:]
    private let minimumLogLevel: LogLevel
    private let isEnabled: Bool
    private let lock = NSLock()

    public init(subsystem: String = "app.rolla", minimumLevel: LogLevel = .debug, enabled: Bool = true) {
        self.subsystem = subsystem
        self.minimumLogLevel = minimumLevel
        self.isEnabled = enabled
    }

    private func getLogger(for category: LogCategory) -> Logger {
        lock.lock()
        defer { lock.unlock() }

        if let logger = loggers[category] {
            return logger
        }

        let logger = Logger(subsystem: subsystem, category: category.rawValue)
        loggers[category] = logger
        return logger
    }

    public func log(
        _ level: LogLevel,
        _ message: String,
        category: LogCategory = .general,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        guard isEnabled && level >= minimumLogLevel else { return }

        let logger = getLogger(for: category)

        let formattedMessage = if message.hasPrefix("🔍") || message.hasPrefix("ℹ️") || message.hasPrefix("⚠️") || message.hasPrefix("❌") || message.hasPrefix("🚨") || message.hasPrefix("✅") || message.hasPrefix("🔄") || message.hasPrefix("📡") {
            message
        } else {
            "\(level.icon) \(message)"
        }

        logger.log(level: level.osLogType, "\(formattedMessage)")
    }
}
