import Foundation

public enum DisconnectionReason: Sendable, Equatable {
    case userInitiated
    case deviceInitiated
    case connectionLost
    case timeout
    case error(String)
    case unknown
}

actor DefaultDeviceRepository: DeviceRepository {
    private var devices: [BLEDeviceIdentifier: DeviceState] = [:]
    private let allDevicesStream: EventStreamSource<[DeviceState]>
    private var cleanupTask: Task<Void, Never>?
    private let cleanupInterval: TimeInterval
    private let deviceTimeout: TimeInterval

    init(cleanupInterval: TimeInterval = 30.0, deviceTimeout: TimeInterval = 20.0) {
        self.allDevicesStream = EventStreamSource<[DeviceState]>()
        self.cleanupInterval = cleanupInterval
        self.deviceTimeout = deviceTimeout
    }

    deinit {
        cleanupTask?.cancel()
    }

    private func ensureCleanupTaskStarted() {
        guard cleanupTask == nil else { return }

        cleanupTask = Task { [weak self, cleanupInterval] in
            guard let self = self else { return }

            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: UInt64(cleanupInterval * 1_000_000_000))

                guard !Task.isCancelled else { break }

                await self.cleanupStaleDiscoveredDevices()
            }
        }
    }
    
    func reportDiscovery(_ device: DiscoveredDevice) async {
        ensureCleanupTaskStarted()

        let key = device.id
        let currentState = devices[key]

        switch currentState {
        case nil:
            devices[key] = .discovered(device)

        case .discovered:
            devices[key] = .discovered(device)

        case .disconnected:
            devices[key] = .discovered(device)

        case .connecting, .connected, .disconnecting:
            return
        }

        await emitDeviceStatesUpdate()
    }
    
    func reportConnectionAttempt(_ uuid: BLEDeviceIdentifier) async throws {
        let key = uuid
        guard let currentState = devices[key] else {
            throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
        }
        
        switch currentState {
        case .discovered(let device), .disconnected(let device):
            devices[key] = .connecting(device)
            
        case .connecting:
            throw BLEConnectionError.connectionInProgress(uuid)
        case .connected:
            throw BLEConnectionError.alreadyConnected(uuid)
        case .disconnecting:
            throw BLEConnectionError.disconnectionInProgress(uuid)
        }
        
        await emitDeviceStatesUpdate()
    }
    
    func reportConnectionSuccess(connectedDevice: ConnectedDevice) async throws {
        let key = connectedDevice.id
        guard let currentState = devices[key] else {
            throw BLEPeripheralError.deviceNotFound(connectedDevice.id.uuidString)
        }
        
        switch currentState {
        case .connecting(let connectingDevice):
            guard connectingDevice.id == connectedDevice.id else {
                throw BLEConnectionError.invalidConnectionState(connectedDevice.id, "Device ID mismatch during connection")
            }
            devices[key] = .connected(connectedDevice)
            
        case .discovered:
            throw BLEConnectionError.invalidConnectionState(connectedDevice.id, "Device was not in connecting state")
        case .connected:
            throw BLEConnectionError.alreadyConnected(connectedDevice.id)
        case .disconnecting:
            throw BLEConnectionError.disconnectionInProgress(connectedDevice.id)
        case .disconnected:
            throw BLEConnectionError.alreadyDisconnected(connectedDevice.id)
        }
        
        await emitDeviceStatesUpdate()
    }
    
    func reportConnectionFailure(_ uuid: BLEDeviceIdentifier) async throws {
        let key = uuid
        guard let currentState = devices[key] else {
            throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
        }
        
        switch currentState {
        case .connecting(let device):
            devices[key] = .disconnected(device)
            await emitDeviceStatesUpdate()
        case .discovered:
            throw BLEConnectionError.invalidConnectionState(uuid, "Device was not connecting")
        case .connected:
            throw BLEConnectionError.alreadyConnected(uuid)
        case .disconnecting:
            throw BLEConnectionError.disconnectionInProgress(uuid)
        case .disconnected:
            throw BLEConnectionError.alreadyDisconnected(uuid)
        }
    }
    
    func reportDisconnectionAttempt(_ uuid: BLEDeviceIdentifier) async throws {
        let key = uuid
        guard let currentState = devices[key] else {
            throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
        }
        
        switch currentState {
        case .connected(let connectedDevice):
            devices[key] = .disconnecting(connectedDevice)
            
        case .disconnecting:
            throw BLEConnectionError.disconnectionInProgress(uuid)
            
        case .discovered, .connecting, .disconnected:
            throw BLEConnectionError.deviceNotConnected(uuid)
        }
        
        await emitDeviceStatesUpdate()
    }
    
    func reportConnectionCancellation(_ uuid: BLEDeviceIdentifier) async throws {
        let key = uuid
        guard let currentState = devices[key] else {
            throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
        }
        
        switch currentState {
        case .connecting(let device):
            devices[key] = .disconnected(device)
            await emitDeviceStatesUpdate()
            
        case .discovered, .disconnected:
            return
            
        case .connected:
            throw BLEConnectionError.alreadyConnected(uuid)
            
        case .disconnecting:
            throw BLEConnectionError.disconnectionInProgress(uuid)
        }
    }
    
    func reportDisconnection(_ uuid: BLEDeviceIdentifier, reason: DisconnectionReason) async {
        let key = uuid
        guard let currentState = devices[key] else {
            return
        }
        
        switch currentState {
        case .disconnecting(let connectedDevice):
            let discoveredDevice = DiscoveredDevice(
                id: connectedDevice.id,
                name: connectedDevice.name,
                rssi: -50,
                brand: connectedDevice.brand,
                type: connectedDevice.deviceType,
                advertisedServices: connectedDevice.advertisedServices ?? [],
                manufacturerData: nil,
                macAddress: connectedDevice.macAddress,
                timestamp: Date()
            )
            devices[key] = .disconnected(discoveredDevice)
            
        case .connected(let connectedDevice):
            let discoveredDevice = DiscoveredDevice(
                id: connectedDevice.id,
                name: connectedDevice.name,
                rssi: -50,
                brand: connectedDevice.brand,
                type: connectedDevice.deviceType,
                advertisedServices: connectedDevice.advertisedServices ?? [],
                manufacturerData: nil,
                macAddress: connectedDevice.macAddress,
                timestamp: Date()
            )
            devices[key] = .disconnected(discoveredDevice)
            
        default:
            break
        }
        
        await emitDeviceStatesUpdate()
    }
    
    func populateFromRetrievedPeripheral(_ discoveredDevice: DiscoveredDevice) async {
        let key = discoveredDevice.id
        let currentState = devices[key]
        switch currentState {
        case nil, .disconnected:
            devices[key] = .discovered(discoveredDevice)
            await emitDeviceStatesUpdate()
            
        case .discovered, .connecting, .connected, .disconnecting:
            return
        }
    }
    
    func getDevice(_ uuid: BLEDeviceIdentifier) -> DeviceState? {
        let key = uuid
        return devices[key]
    }
    
    func getConnectedDevice(with deviceUUID: BLEDeviceIdentifier) -> ConnectedDevice? {
        let key = deviceUUID
        guard let state = devices[key] else { return nil }
        if case .connected(let device) = state {
            return device
        }
        return nil
    }
    
    func getDiscoveredDevice(with deviceUUID: BLEDeviceIdentifier) -> DiscoveredDevice? {
        let key = deviceUUID
        guard let state = devices[key] else { return nil }
        if case .discovered(let device) = state {
            return device
        }
        return nil
    }
    
    func getDiscoveredDevice(byMacAddress macAddress: String) async -> DiscoveredDevice? {
        for deviceState in devices.values {
            switch deviceState {
            case .discovered(let device), .disconnected(let device):
                if device.macAddress == macAddress {
                    return device
                }
            default:
                continue
            }
        }
        return nil
    }
    
    func getDeviceState(byMacAddress macAddress: String) async -> DeviceState? {
        for deviceState in devices.values {
            switch deviceState {
            case .discovered(let device), .connecting(let device), .disconnected(let device):
                if device.macAddress == macAddress {
                    return deviceState
                }
            case .connected(let device), .disconnecting(let device):
                if device.macAddress == macAddress {
                    return deviceState
                }
            }
        }
        return nil
    }
    
    func isDeviceConnected(deviceUUID: BLEDeviceIdentifier) async -> Bool {
        if case .connected = devices[deviceUUID] {
            return true
        }
        return false
    }
    
    func getDeviceName(deviceUUID: BLEDeviceIdentifier) async -> String? {
        return devices[deviceUUID]?.name
    }
    
    func allDevicesStream() async -> AsyncStream<[DeviceState]> {
        let (stream, _) = await allDevicesStream.makeStream()
        return stream
    }
    
    func getAllDevicesWithStates() -> [DeviceState] {
        return Array(devices.values)
    }
    
    func handleBluetoothPoweredOff() async {
        var hasChanges = false

        for (key, state) in devices {
            switch state {
            case .connected(let connectedDevice):
                let discoveredDevice = DiscoveredDevice(
                    id: connectedDevice.id,
                    name: connectedDevice.name,
                    rssi: -50,
                    brand: connectedDevice.brand,
                    type: connectedDevice.deviceType,
                    advertisedServices: connectedDevice.advertisedServices ?? [],
                    manufacturerData: nil,
                    macAddress: connectedDevice.macAddress,
                    timestamp: Date()
                )
                devices[key] = .disconnected(discoveredDevice)
                hasChanges = true

            case .connecting(let device):
                devices[key] = .disconnected(device)
                hasChanges = true

            case .disconnecting(let connectedDevice):
                let discoveredDevice = DiscoveredDevice(
                    id: connectedDevice.id,
                    name: connectedDevice.name,
                    rssi: -50,
                    brand: connectedDevice.brand,
                    type: connectedDevice.deviceType,
                    advertisedServices: connectedDevice.advertisedServices ?? [],
                    manufacturerData: nil,
                    macAddress: connectedDevice.macAddress,
                    timestamp: Date()
                )
                devices[key] = .disconnected(discoveredDevice)
                hasChanges = true

            case .discovered, .disconnected:
                break
            }
        }

        if hasChanges {
            await emitDeviceStatesUpdate()
        }
    }

    func clearDiscoveredDevices() async {
        var hasChanges = false

        let keysToRemove = devices.keys.filter { key in
            if case .discovered = devices[key] {
                return true
            }
            return false
        }

        for key in keysToRemove {
            devices.removeValue(forKey: key)
            hasChanges = true
        }

        if hasChanges {
            await emitDeviceStatesUpdate()
        }
    }

    func removeDevice(_ uuid: BLEDeviceIdentifier) async {
        if devices.removeValue(forKey: uuid) != nil {
            await emitDeviceStatesUpdate()
        }
    }

    private func cleanupStaleDiscoveredDevices() async {
        let now = Date()
        var hasChanges = false

        let keysToRemove = devices.keys.filter { key in
            guard case .discovered(let device) = devices[key] else {
                return false
            }

            let timeSinceDiscovery = now.timeIntervalSince(device.timestamp)
            return timeSinceDiscovery > deviceTimeout
        }

        for key in keysToRemove {
            devices.removeValue(forKey: key)
            hasChanges = true
        }

        if hasChanges {
            await emitDeviceStatesUpdate()
        }

        let hasDiscoveredDevices = devices.values.contains { state in
            if case .discovered = state {
                return true
            }
            return false
        }

        if !hasDiscoveredDevices {
            cleanupTask?.cancel()
            cleanupTask = nil
        }
    }

    private func emitDeviceStatesUpdate() async {
        let allStates = getAllDevicesWithStates()
        await allDevicesStream.yield(allStates)
    }
}
