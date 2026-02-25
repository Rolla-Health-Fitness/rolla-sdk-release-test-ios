import Foundation
import CoreBluetooth

protocol CoreBLECentralManaging: AnyObject, Sendable {
    func startScanning(options: ScanOptions) async throws
    func stopScanning()
    func isScanning() async -> Bool
    func initiateConnect(to uuid: BLEDeviceIdentifier) async throws
    func initiateDisconnect(from uuid: BLEDeviceIdentifier) async throws
    func scanResultsStream() async -> AsyncStream<ScanResult>
    func bluetoothStateStream() async -> AsyncStream<CBBluetoothState>
    func getBluetoothState() async -> CBBluetoothState
    func retrieveAllKnownDevices(withUUIDs uuids: [BLEDeviceIdentifier]) async -> [DiscoveredDevice]
    func getPeripheral(for uuid: BLEDeviceIdentifier) async -> CBPeripheral?
    func getCentralManager() -> CBCentralManager
    func retrievePeripherals(withIdentifiers identifiers: [UUID]) async -> [CBPeripheral]
}
