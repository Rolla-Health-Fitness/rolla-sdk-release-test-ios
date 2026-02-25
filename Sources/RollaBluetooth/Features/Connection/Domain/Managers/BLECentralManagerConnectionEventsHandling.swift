import Foundation

protocol BLECentralManagerConnectionEventsHandling: Sendable {
    func didConnect(deviceUUID: BLEDeviceIdentifier) async
    func didFailToConnect(deviceUUID: BLEDeviceIdentifier, error: Error?) async
    func didDisconnect(deviceUUID: BLEDeviceIdentifier, error: Error?) async
    func didFailToDisconnectDevice(deviceUUID: BLEDeviceIdentifier, error: Error?) async
    func handleBluetoothPoweredOff() async
}
