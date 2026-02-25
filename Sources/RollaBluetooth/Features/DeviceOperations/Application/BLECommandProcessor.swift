import Foundation

// Serial queue for now
actor InternalCommandExecutor: BLECommandExecuting {
    private let peripheralManager: BLEPeripheralManaging
    private let connectionManager: BLEConnectionManaging
    private let notificationManager: BLENotificationStreamManaging
    
    private static let singleTryPolicy = RetryPolicy.none
    
    init(
        peripheralManager: BLEPeripheralManaging,
        connectionManager: BLEConnectionManaging,
        notificationManager: BLENotificationStreamManaging
    ) {
        self.peripheralManager = peripheralManager
        self.connectionManager = connectionManager
        self.notificationManager = notificationManager
    }
    
    func execute<C: BLEConnectionCommand>(_ command: C) async throws -> C.Output {
        return try await execute(command, retryPolicy: Self.singleTryPolicy)
    }

    func execute<C: BLEPeripheralCommand>(_ command: C) async throws -> C.Output {
        return try await execute(command, retryPolicy: Self.singleTryPolicy)
    }

    func execute<C: BLEConnectionCommand>(_ command: C, retryPolicy: RetryPolicy) async throws -> C.Output {
        return try await retryPolicy.execute {
            try await command.execute(using: connectionManager)
        }
    }

    func execute<C: BLEPeripheralCommand>(_ command: C, retryPolicy: RetryPolicy) async throws -> C.Output {
        return try await retryPolicy.execute {
            try await command.execute(using: peripheralManager)
        }
    }
}
