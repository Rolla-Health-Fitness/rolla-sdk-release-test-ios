import Foundation

public final class Connector: Sendable {
    private let connectionLifecycleManager: ConnectionLifecycleManaging
    private let connectionStateUseCase: GetDeviceConnectionStateUseCase
    private let connectionStrategyRegistry: BLEConnectionStrategyRegistry

    init(
        connectionLifecycleManager: ConnectionLifecycleManaging,
        connectionStateUseCase: GetDeviceConnectionStateUseCase,
        connectionStrategyRegistry: BLEConnectionStrategyRegistry
    ) {
        self.connectionLifecycleManager = connectionLifecycleManager
        self.connectionStateUseCase = connectionStateUseCase
        self.connectionStrategyRegistry = connectionStrategyRegistry
    }

    public convenience init() {
        let deps = RollaBluetoothDependencies.shared
        self.init(
            connectionLifecycleManager: deps.connectionLifecycleManager,
            connectionStateUseCase: deps.getDeviceConnectionStateUseCase,
            connectionStrategyRegistry: deps.connectionStrategyRegistry
        )
    }

    public func registerStrategy(
        _ strategy: BLEConnectionStrategy,
        for brand: DeviceBrand,
        deviceType: BLEDeviceType
    ) {
        let key = StrategyKey(brand: brand, type: deviceType)
        connectionStrategyRegistry.register(strategy, for: key)
    }
    
    public func connect(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        brand: DeviceBrand? = nil,
        type: BLEDeviceType? = nil,
        macAddress: String? = nil
    ) async throws {
        try await connectionLifecycleManager.connect(
            deviceUUID: deviceUUID,
            timeout: timeout,
            brand: brand,
            type: type,
            macAddress: macAddress
        )
    }

    public func disconnect(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws {
        try await connectionLifecycleManager.disconnect(deviceUUID: deviceUUID, timeout: timeout)
    }

    public func cancelReconnection(for deviceUUID: BLEDeviceIdentifier) async {
        await connectionLifecycleManager.cancelReconnection(for: deviceUUID)
    }

    public func stopMonitoring(for deviceUUID: BLEDeviceIdentifier) async {
        await connectionLifecycleManager.stopHandlingDeviceStateChanges(for: deviceUUID)
    }

    public func getConnectionState(deviceId: BLEDeviceIdentifier) async throws -> DeviceState {
        return try await connectionStateUseCase.getDeviceState(deviceId: deviceId)
    }

    public func getAllDeviceStateChangesStream() async -> AsyncStream<[DeviceStateChange]> {
        return await connectionLifecycleManager.getAllDeviceStateChangesStream()
    }
}
