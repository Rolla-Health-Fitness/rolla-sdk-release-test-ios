import Foundation

public actor RollaBandCommandExecutor {
    private let commandExecutor: CommandExecutor
    private let observer: CharacteristicObserver

    private static let singleTryPolicy = RetryPolicy.none

    public init(commandExecutor: CommandExecutor, observer: CharacteristicObserver) {
        self.commandExecutor = commandExecutor
        self.observer = observer
    }

    @discardableResult
    public func execute<C: RollaBandRequestCommand>(_ command: C) async throws -> C.Output {
        return try await execute(command, retryPolicy: Self.singleTryPolicy)
    }

    @discardableResult
    public func execute<C: RollaBandRequestCommand>(_ command: C, retryPolicy: RetryPolicy) async throws -> C.Output {
        return try await retryPolicy.execute {
            try await command.execute(using: self.commandExecutor, observer: self.observer)
        }
    }
}

