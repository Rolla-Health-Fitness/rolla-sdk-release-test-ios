import Foundation

final class DefaultConnectUseCase: ConnectUseCase {
    private let centralManager: CoreBLECentralManaging
    private let deviceRepository: DeviceRepository
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

    func connect(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        brand: DeviceBrand? = nil,
        type: BLEDeviceType? = nil,
        macAddress: String? = nil
    ) async throws {
        // First check if device is already in repository
        if let deviceState = await deviceRepository.getDevice(deviceUUID) {
            switch deviceState {
            case .discovered(let device), .disconnected(let device):
                try await performConnection(to: device, timeout: timeout)
                return
            case .connected:
                logger.error("Device already connected: \(deviceUUID.uuidString)", category: .connection)
                throw BLEConnectionError.alreadyConnected(deviceUUID)
            case .connecting:
                logger.error("Connection already in progress: \(deviceUUID.uuidString)", category: .connection)
                throw BLEConnectionError.connectionInProgress(deviceUUID)
            case .disconnecting:
                logger.error("Device is disconnecting: \(deviceUUID.uuidString)", category: .connection)
                throw BLEConnectionError.disconnectionInProgress(deviceUUID)
            }
        }

        // Device not in repository - try to retrieve it from CoreBluetooth
        // This handles the case of connecting to a paired device without scanning first
        logger.debug("Device not in repository, attempting to retrieve from CoreBluetooth: \(deviceUUID.uuidString)", category: .connection)

        let retrievedDevices = await centralManager.retrieveAllKnownDevices(withUUIDs: [deviceUUID])

        guard let retrievedDevice = retrievedDevices.first else {
            logger.error("Device not found in CoreBluetooth: \(deviceUUID.uuidString)", category: .connection)
            throw BLEPeripheralError.deviceNotFound(deviceUUID.uuidString)
        }

        // Enrich device with provided metadata (if any)
        let enrichedDevice = DiscoveredDevice(
            id: retrievedDevice.id,
            name: retrievedDevice.name,
            rssi: retrievedDevice.rssi,
            brand: brand ?? retrievedDevice.brand,
            type: type ?? retrievedDevice.type,
            advertisedServices: retrievedDevice.advertisedServices,
            manufacturerData: retrievedDevice.manufacturerData,
            macAddress: macAddress ?? retrievedDevice.macAddress,
            timestamp: retrievedDevice.timestamp
        )

        // Populate repository with enriched device
        await deviceRepository.populateFromRetrievedPeripheral(enrichedDevice)

        // Now connect
        try await performConnection(to: enrichedDevice, timeout: timeout)
    }
}

extension DefaultConnectUseCase {
    private func performConnection(to device: DiscoveredDevice, timeout: TimeInterval) async throws {
        let deviceName = device.name ?? "Unknown Device"
        logger.progress("Connecting to \(deviceName)", category: .connection)
        
        do {
            try await deviceRepository.reportConnectionAttempt(device.id)
            
            let strategy = strategyRegistry.strategy(for: device)
            try await strategy.connect(to: device, timeout: timeout)
            
            let connectedDevice = try await strategy.postConnectionSetup(
                for: device,
                timeout: timeout
            )
            
            try await deviceRepository.reportConnectionSuccess(connectedDevice: connectedDevice)
            logger.success("Connected to \(deviceName)", category: .connection)
            
        } catch {
            logger.failure("Connection failed for \(deviceName): \(error.localizedDescription)", category: .connection)
            
            do {
                try await deviceRepository.reportConnectionFailure(device.id)
            } catch {
                logger.error("Failed to report connection failure for \(deviceName)", category: .connection)
            }
            
            throw error
        }
    }
}
