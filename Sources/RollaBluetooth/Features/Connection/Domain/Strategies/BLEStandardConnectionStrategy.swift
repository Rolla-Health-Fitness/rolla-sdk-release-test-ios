import Foundation

protocol BLEStandardConnectionStrategy: BLEConnectionStrategy {
    init(
        commandExecutor: BLECommandExecuting,
        logger: Logging
    )
}
