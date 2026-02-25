import Foundation

public final class DefaultDisconnectUseCase: DisconnectUseCase {
    private let deviceRepository: DeviceRepository
    private let centralManager: CoreBLECentralManaging
    private let strategyRegistry: BLEConnectionStrategyRegistry
    private let logger: Logging

    init(
        deviceRepository: DeviceRepository,
        centralManager: CoreBLECentralManaging,
        strategyRegistry: BLEConnectionStrategyRegistry,
        logger: Logging
    ) {
        self.deviceRepository = deviceRepository
        self.centralManager = centralManager
        self.strategyRegistry = strategyRegistry
        self.logger = logger
    }

    func disconnect(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws {
        let deviceState = try await getDeviceForDisconnection(deviceUUID: deviceUUID)
        
        switch deviceState {
        case .connected(let device):
            try await performConnectedDeviceDisconnection(device: device, timeout: timeout)
            
        case .connecting(let device):
            try await performConnectionCancellation(device: device, timeout: timeout)
            
        default:
            throw BLEConnectionError.invalidConnectionState(deviceUUID, "Unexpected device state")
        }
    }
}

extension DefaultDisconnectUseCase {
    private func getDeviceForDisconnection(deviceUUID: BLEDeviceIdentifier) async throws -> DeviceState {
        guard let deviceState = await deviceRepository.getDevice(deviceUUID) else {
            logger.error("Device not found in repository: \(deviceUUID.uuidString)", category: .connection)
            throw BLEPeripheralError.deviceNotFound(deviceUUID.uuidString)
        }
        
        let deviceName = deviceState.name ?? "Unknown Device"
        
        switch deviceState {
        case .connected:
            return deviceState
            
        case .connecting:
            logger.info("Device is connecting, will cancel connection: \(deviceName)", category: .connection)
            return deviceState
            
        case .disconnecting:
            logger.error("Device is already disconnecting: \(deviceName)", category: .connection)
            throw BLEConnectionError.disconnectionInProgress(deviceUUID)
            
        case .discovered, .disconnected:
            logger.error("Device is not connected or connecting: \(deviceName)", category: .connection)
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }
    }
}

extension DefaultDisconnectUseCase {
    private func performConnectedDeviceDisconnection(device: ConnectedDevice, timeout: TimeInterval) async throws {
        let deviceName = device.name ?? "Unknown Device"
        logger.progress("Disconnecting from \(deviceName)", category: .connection)
        
        try await deviceRepository.reportDisconnectionAttempt(device.id)
        
        do {
            let strategy = strategyRegistry.strategy(for: device)
            try await strategy.preDisconnectionCleanup(for: device, timeout: timeout)
            
            try await strategy.disconnect(deviceUUID: device.id, timeout: timeout)
            
            await deviceRepository.reportDisconnection(device.id, reason: .userInitiated)
            logger.success("Disconnected from \(deviceName)", category: .connection)
            
        } catch {
            let deviceName = device.name ?? "Unknown Device"
            logger.failure("Disconnection failed for \(deviceName): \(error.localizedDescription)", category: .connection)
            throw error
        }
    }
    
    private func performConnectionCancellation(device: DiscoveredDevice, timeout: TimeInterval) async throws {
        let deviceName = device.name ?? "Unknown Device"
        logger.progress("Cancelling connection to \(deviceName)", category: .connection)
        
        do {
            let strategy = strategyRegistry.strategy(for: device)
            try await strategy.disconnect(deviceUUID: device.id, timeout: timeout)
            try await deviceRepository.reportConnectionCancellation(device.id)
            
            logger.success("Connection cancelled for \(deviceName)", category: .connection)
            
        } catch {
            logger.failure(
                "Connection cancellation failed for \(deviceName): \(error.localizedDescription)",
                category: .connection
            )
            
            try? await deviceRepository.reportConnectionCancellation(device.id)
            throw error
        }
    }
}
