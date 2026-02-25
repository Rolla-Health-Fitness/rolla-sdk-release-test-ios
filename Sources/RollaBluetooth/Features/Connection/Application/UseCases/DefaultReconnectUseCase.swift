import Foundation

final class DefaultReconnectUseCase {
    private actor ReconnectionState {
        private var activeReconnections: [BLEDeviceIdentifier: ReconnectionStrategy] = [:]
        
        func setActiveReconnection(_ strategy: ReconnectionStrategy, for deviceId: BLEDeviceIdentifier) {
            activeReconnections[deviceId] = strategy
        }
        
        func getActiveReconnection(for deviceId: BLEDeviceIdentifier) -> ReconnectionStrategy? {
            return activeReconnections[deviceId]
        }
        
        func removeActiveReconnection(for deviceId: BLEDeviceIdentifier) {
            activeReconnections.removeValue(forKey: deviceId)
        }
        
        func hasActiveReconnection(for deviceId: BLEDeviceIdentifier) -> Bool {
            return activeReconnections[deviceId] != nil
        }
        
        func clearAll() {
            activeReconnections.removeAll()
        }
    }
    
    private let config: ReconnectionConfig
    private let logger: Logging
    private let reconnectionState: ReconnectionState
    
    init(
        config: ReconnectionConfig,
        logger: Logging
    ) {
        self.config = config
        self.logger = logger
        self.reconnectionState = ReconnectionState()
    }
    
    deinit {
        Task { [reconnectionState] in
            await reconnectionState.clearAll()
        }
    }
}

extension DefaultReconnectUseCase: ReconnectionUseCase {
    var isAutoReconnectEnabled: Bool {
        return config.autoReconnectEnabled
    }

    func getReconnectionStrategy(
        deviceId: BLEDeviceIdentifier,
        disconnectionReason: DisconnectionReason = .connectionLost
    ) async -> ReconnectionStrategy {

        guard config.autoReconnectEnabled else {
            logger.info("Auto-reconnect disabled for device: \(deviceId)")
            return ReconnectionStrategy(deviceId: deviceId, shouldReconnect: false)
        }
        
        if await reconnectionState.hasActiveReconnection(for: deviceId) {
            logger.info("Reconnection already active for: \(deviceId)")
            return ReconnectionStrategy(deviceId: deviceId, shouldReconnect: false)
        }
        
        guard disconnectionReason == .connectionLost else {
            logger.info("Planned disconnection, no reconnection needed for: \(deviceId)")
            return ReconnectionStrategy(deviceId: deviceId, shouldReconnect: false)
        }
        
        let strategy = ReconnectionStrategy(
            deviceId: deviceId,
            shouldReconnect: true,
            delay: config.initialDelay,
            timeout: calculateTimeoutForAttempt(1),
            attemptNumber: 1,
            maxAttempts: config.maxAttempts
        )
        
        await reconnectionState.setActiveReconnection(strategy, for: deviceId)
        logger.info("Reconnection strategy created for: \(deviceId)")
        
        return strategy
    }
    
    func getNextReconnectionStrategy(
        for deviceId: BLEDeviceIdentifier,
        previousAttempt: Int,
        error: Error
    ) async -> ReconnectionStrategy? {
        
        guard (await reconnectionState.getActiveReconnection(for: deviceId)) != nil else {
            logger.warning("No active reconnection strategy found for: \(deviceId)")
            return nil
        }
        
        let nextAttempt = previousAttempt + 1
        
        guard nextAttempt <= config.maxAttempts else {
            await reconnectionState.removeActiveReconnection(for: deviceId)
            logger.info("Max reconnection attempts reached for: \(deviceId)")
            return nil
        }
        
        let baseDelay = config.initialDelay * pow(config.multiplier, Double(nextAttempt - 1))
        let cappedDelay = min(baseDelay, config.maxDelay)
        let jitteredDelay = cappedDelay * Double.random(in: 0.8...1.2)
        
        let nextStrategy = ReconnectionStrategy(
            deviceId: deviceId,
            shouldReconnect: true,
            delay: jitteredDelay,
            timeout: calculateTimeoutForAttempt(nextAttempt),
            attemptNumber: nextAttempt,
            maxAttempts: config.maxAttempts
        )
        
        await reconnectionState.setActiveReconnection(nextStrategy, for: deviceId)
        logger.info("Next reconnection strategy created for: \(deviceId.uuidString), attempt: \(nextAttempt)")
        
        return nextStrategy
    }
    
    func markReconnectionSuccessful(for deviceId: BLEDeviceIdentifier) async {
        if await reconnectionState.hasActiveReconnection(for: deviceId) {
            logger.success("Reconnection successful for: \(deviceId)")
        }
        await reconnectionState.removeActiveReconnection(for: deviceId)
    }
    
    func cancelReconnection(for deviceId: BLEDeviceIdentifier) async {
        await reconnectionState.removeActiveReconnection(for: deviceId)
    }
    
    private func calculateTimeoutForAttempt(_ attempt: Int) -> TimeInterval {
        return 7200.0  
    }
}
