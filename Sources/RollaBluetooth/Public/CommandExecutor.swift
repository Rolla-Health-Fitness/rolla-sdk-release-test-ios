import Foundation

public final class CommandExecutor: Sendable {
    private let executor: BLECommandExecuting

    init(executor: BLECommandExecuting) {
        self.executor = executor
    }

    public convenience init() {
        let deps = RollaBluetoothDependencies.shared
        self.init(executor: deps.internalCommandProcessor)
    }

    // MARK: - Public typed API

    public func execute(
        _ command: WriteCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: ConnectCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: DisconnectCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: ReadSerialNumberCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws -> String? {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: ReadFirmwareRevisionCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws -> String? {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: ReadBatteryLevelCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws -> Int {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: EnableNotificationCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: DisableNotificationCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: ReadCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws -> Data? {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: DiscoverServicesCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws -> [BLEService] {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }

    public func execute(
        _ command: DiscoverCharacteristicsCommand,
        retryPolicy: RetryPolicy = .none
    ) async throws -> [BLECharacteristic] {
        try await executor.execute(command, retryPolicy: retryPolicy)
    }
}
