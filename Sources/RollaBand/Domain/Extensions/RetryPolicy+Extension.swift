
extension RetryPolicy {
    public static let immediate = RetryPolicy(
        maxRetries: 3,
        baseDelay: 0.0,
        maxDelay: 0.0,
        backoffMultiplier: 1.0,
        shouldRetry: { error in
            if let rollaBandError = error as? RollaBandCommandError {
                return rollaBandError.isRetryable
            }

            if let asyncError = error as? AsyncRequestError {
                switch asyncError {
                case .timeout, .deviceDisconnected:
                    return true
                case .cancelled, .superseded, .notRegistered, .alreadyWaiting, .managerDeallocated, .invalidState:
                    return false
                case .matcherFailed:
                    return true
                }
            }

            return true
        }
    )
}

