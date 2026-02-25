import Foundation

public struct RetryPolicy: Sendable {
    public let maxRetries: Int
    public let baseDelay: TimeInterval
    public let maxDelay: TimeInterval
    public let backoffMultiplier: Double
    public let shouldRetry: @Sendable (Error) -> Bool
    
    public init(
        maxRetries: Int = 1,
        baseDelay: TimeInterval = 0.1,
        maxDelay: TimeInterval = 5.0,
        backoffMultiplier: Double = 2.0,
        shouldRetry: @escaping @Sendable (Error) -> Bool = { _ in true }
    ) {
        self.maxRetries = maxRetries
        self.baseDelay = baseDelay
        self.maxDelay = maxDelay
        self.backoffMultiplier = backoffMultiplier
        self.shouldRetry = shouldRetry
    }
    
    public static let `default` = RetryPolicy(maxRetries: 3)
    
    public static let none = RetryPolicy(maxRetries: 0)
    
    public func delayForAttempt(_ attempt: Int) -> TimeInterval {
        guard attempt > 0 else { return 0 }
        
        let delay = baseDelay * pow(backoffMultiplier, Double(attempt - 1))
        return min(delay, maxDelay)
    }
}

extension RetryPolicy {
    public func execute<T>(
        operation: @Sendable () async throws -> T
    ) async throws -> T {
        var lastError: Error?
        
        for attempt in 0...maxRetries {
            do {
                return try await operation()
            } catch {
                lastError = error
                
                if attempt == maxRetries || !shouldRetry(error) {
                    throw error
                }
                
                let delay = delayForAttempt(attempt + 1)
                if delay > 0 {
                    try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                }
            }
        }
        
        throw lastError ?? BLEPeripheralError.unknown("Unknown retry error")
    }
}
