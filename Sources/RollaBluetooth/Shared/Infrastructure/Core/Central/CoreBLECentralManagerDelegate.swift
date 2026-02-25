import Foundation
@preconcurrency import CoreBluetooth

protocol CoreBLECentralManagerDelegate: CBCentralManagerDelegate {
    func clearScannedPeripherals()
    func getCachedPeripheral(for uuid: UUID) async -> CBPeripheral?
    func cacheRetrievedPeripheral(_ peripheral: CBPeripheral) async
}

final class CoreBLECentralManagerDelegateImpl: NSObject, @unchecked Sendable {
    let connectionHandler: BLECentralManagerConnectionEventsHandling
    let peripheralDelegate: BLEPeripheralManagerDelegate

    private let queue: DispatchQueue
    private let scanResultsStream: EventStreamSource<ScanResult>
    private let bluetoothStateStream: EventStreamSource<CBBluetoothState>
    private var scannedPeripherals: [UUID: CBPeripheral] = [:]

    init(
        connectionHandler: BLECentralManagerConnectionEventsHandling,
        peripheralDelegate: BLEPeripheralManagerDelegate,
        queue: DispatchQueue,
        scanResultsStream: EventStreamSource<ScanResult>,
        bluetoothStateStream: EventStreamSource<CBBluetoothState>
    ) {
        self.connectionHandler = connectionHandler
        self.peripheralDelegate = peripheralDelegate
        self.queue = queue
        self.scanResultsStream = scanResultsStream
        self.bluetoothStateStream = bluetoothStateStream
        super.init()
    }

    func clearScannedPeripherals() {
        scannedPeripherals = scannedPeripherals.filter { (uuid, peripheral) in
            let state = peripheral.state
            return state == .connecting || state == .connected
        }
    }
    
    func getCachedPeripheral(for uuid: UUID) async -> CBPeripheral? {
        return await withCheckedContinuation { continuation in
            queue.async {
                continuation.resume(returning: self.scannedPeripherals[uuid])
            }
        }
    }

    func cacheRetrievedPeripheral(_ peripheral: CBPeripheral) async {
        await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>) in
            queue.async {
                self.scannedPeripherals[peripheral.identifier] = peripheral
                continuation.resume()
            }
        }
    }
}

extension CoreBLECentralManagerDelegateImpl: CoreBLECentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        let state = CBBluetoothState(cbState: central.state)
        if state != .poweredOn {
            scannedPeripherals.removeAll()
        }
        Task { [bluetoothStateStream, connectionHandler] in
            await bluetoothStateStream.yield(state)
            if state != .poweredOn {
                await connectionHandler.handleBluetoothPoweredOff()
            }
        }
    }
    
    func centralManager(
        _ central: CBCentralManager,
        didDiscover peripheral: CBPeripheral,
        advertisementData: [String: Any],
        rssi RSSI: NSNumber
    ) {
        let deviceUUID = peripheral.identifier
        let name = peripheral.name
        let rssi = RSSI.intValue
        let manufacturerData = advertisementData[CBAdvertisementDataManufacturerDataKey] as? Data
        let advertisedServiceUUIDs = (advertisementData[CBAdvertisementDataServiceUUIDsKey] as? [CBUUID])?
            .map { NormalizedUUID(stringIdentifier: $0.uuidString) } ?? []
        
        scannedPeripherals[deviceUUID] = peripheral
        
        let scanResult = ScanResult(
            deviceUUID: deviceUUID,
            name: name,
            rssi: rssi,
            advertisedServices: advertisedServiceUUIDs,
            manufacturerData: manufacturerData
        )

        Task { [scanResultsStream] in
            await scanResultsStream.yield(scanResult)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        let deviceUUID = BLEDeviceIdentifier(peripheral.identifier)
        peripheral.delegate = peripheralDelegate
        
        Task { [connectionHandler] in
            await connectionHandler.didConnect(deviceUUID: deviceUUID)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        let deviceUUID = BLEDeviceIdentifier(peripheral.identifier)
        peripheral.delegate = nil
        
        Task { [connectionHandler] in
            await connectionHandler.didFailToConnect(deviceUUID: deviceUUID, error: error)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        let deviceUUID = BLEDeviceIdentifier(peripheral.identifier)
        peripheral.delegate = nil
        
        Task { [connectionHandler] in
            await connectionHandler.didDisconnect(deviceUUID: deviceUUID, error: error)
        }
    }
}
