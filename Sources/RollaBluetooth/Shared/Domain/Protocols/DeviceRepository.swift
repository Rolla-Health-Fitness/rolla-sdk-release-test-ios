import Foundation

protocol DeviceRepository: Sendable {
    func reportDiscovery(_ device: DiscoveredDevice) async
    
    func reportConnectionAttempt(_ uuid: BLEDeviceIdentifier) async throws
    func reportConnectionSuccess(connectedDevice: ConnectedDevice) async throws
    func reportConnectionFailure(_ uuid: BLEDeviceIdentifier) async throws
    func reportConnectionCancellation(_ uuid: BLEDeviceIdentifier) async throws
    
    func reportDisconnectionAttempt(_ uuid: BLEDeviceIdentifier) async throws
    func reportDisconnection(_ uuid: BLEDeviceIdentifier, reason: DisconnectionReason) async
    
    func populateFromRetrievedPeripheral(_ discoveredDevice: DiscoveredDevice) async
    func handleBluetoothPoweredOff() async
    func clearDiscoveredDevices() async
    func removeDevice(_ uuid: BLEDeviceIdentifier) async

    // MARK: - Device Queries
    
    func getDevice(_ uuid: BLEDeviceIdentifier) async -> DeviceState?
    func getConnectedDevice(with deviceUUID: BLEDeviceIdentifier) async -> ConnectedDevice?
    func getDiscoveredDevice(with deviceUUID: BLEDeviceIdentifier) async -> DiscoveredDevice?
    func getDiscoveredDevice(byMacAddress macAddress: String) async -> DiscoveredDevice?
    func getDeviceState(byMacAddress macAddress: String) async -> DeviceState?
    func isDeviceConnected(deviceUUID: BLEDeviceIdentifier) async -> Bool
    func getDeviceName(deviceUUID: BLEDeviceIdentifier) async -> String?
    func getAllDevicesWithStates() async -> [DeviceState]
    func allDevicesStream() async -> AsyncStream<[DeviceState]>
}

