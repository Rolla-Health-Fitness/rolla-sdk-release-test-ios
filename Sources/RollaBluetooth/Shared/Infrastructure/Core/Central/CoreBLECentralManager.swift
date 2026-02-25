import Foundation
@preconcurrency import CoreBluetooth

final class CoreBLECentralManager: @unchecked Sendable {
    private let centralManager: CBCentralManager
    private let queue: DispatchQueue
    private let delegate: CoreBLECentralManagerDelegate
    private let scanResultsStream: EventStreamSource<ScanResult>
    private let bluetoothStateStream: EventStreamSource<CBBluetoothState>
    
    init(
        queue: DispatchQueue,
        delegate: CoreBLECentralManagerDelegate,
        scanResultsStream: EventStreamSource<ScanResult>,
        bluetoothStateStream: EventStreamSource<CBBluetoothState>
    ) {
        self.queue = queue
        self.delegate = delegate
        self.scanResultsStream = scanResultsStream
        self.bluetoothStateStream = bluetoothStateStream
        self.centralManager = CBCentralManager(
            delegate: delegate,
            queue: queue,
            options: nil
        )
    }
}

extension CoreBLECentralManager: CoreBLECentralManaging {
    func getCentralManager() -> CBCentralManager {
        return centralManager
    }
    
    func scanResultsStream() async -> AsyncStream<ScanResult> {
        let (stream, _) = await scanResultsStream.makeStream()
        return stream
    }

    func bluetoothStateStream() async -> AsyncStream<CBBluetoothState> {
        let (stream, _) = await bluetoothStateStream.makeStream()
        return stream
    }
    
    func getBluetoothState() async -> CBBluetoothState {
        await withCheckedContinuation { (continuation: CheckedContinuation<CBBluetoothState, Never>) in
            queue.async {
                continuation.resume(returning: CBBluetoothState(cbState: self.centralManager.state))
            }
        }
    }
    
    func startScanning(options: ScanOptions) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            queue.async {
                do {
                    try self.validateBluetoothState()
                } catch {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard !self.centralManager.isScanning else {
                    continuation.resume(throwing: BLECentralError.alreadyScanning)
                    return
                }
                
                self.delegate.clearScannedPeripherals()
                
                let cb = options.serviceUUIDs?.map { $0.asCBUUID }
                let opts: [String: Any] = [
                    CBCentralManagerScanOptionAllowDuplicatesKey: options.allowDuplicates
                ]
                
                self.centralManager.scanForPeripherals(withServices: cb, options: opts)
                continuation.resume()
            }
        }
    }
    
    func stopScanning() {
        queue.async {
            self.centralManager.stopScan()
        }
    }
    
    func isScanning() async -> Bool {
        await withCheckedContinuation { continuation in
            queue.async {
                continuation.resume(returning: self.centralManager.isScanning)
            }
        }
    }

    func initiateConnect(to uuid: BLEDeviceIdentifier) async throws {
        guard let peripheral = await getPeripheral(for: uuid) else {
            throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
        }

        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            queue.async {
                do {
                    try self.validateBluetoothState()
                    self.centralManager.connect(peripheral, options: nil)
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func initiateDisconnect(from uuid: BLEDeviceIdentifier) async throws {
        guard let peripheral = await getPeripheral(for: uuid) else {
            throw BLEPeripheralError.deviceNotFound(uuid.uuidString)
        }

        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            queue.async {
                do {
                    try self.validateBluetoothState()
                    self.centralManager.cancelPeripheralConnection(peripheral)
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func retrieveAllKnownDevices(withUUIDs uuids: [BLEDeviceIdentifier]) async -> [DiscoveredDevice] {
        return await withCheckedContinuation { continuation in
            queue.async {
                let identifiers = uuids.compactMap { UUID(uuidString: $0.uuidString) }
                let retrievedPeripherals = self.centralManager.retrievePeripherals(withIdentifiers: identifiers)
                
                let discoveredDevices = retrievedPeripherals.map { peripheral in
                    let advertisedServices = peripheral.services?.compactMap { service in
                        NormalizedUUID(stringIdentifier: service.uuid.uuidString)
                    } ?? []
                    
                    return DiscoveredDevice(
                        id: BLEDeviceIdentifier(peripheral.identifier),
                        name: peripheral.name,
                        rssi: 0,
                        brand: .unknown,
                        type: .unknown,
                        advertisedServices: advertisedServices,
                        manufacturerData: nil,
                        timestamp: Date()
                    )
                }
                
                continuation.resume(returning: discoveredDevices)
            }
        }
    }
    
    func getPeripheral(for uuid: BLEDeviceIdentifier) async -> CBPeripheral? {
        guard let deviceUUID = UUID(uuidString: uuid.uuidString) else {
            return nil
        }
        if let cachedPeripheral = await delegate.getCachedPeripheral(for: deviceUUID) {
            return cachedPeripheral
        }

        let peripherals = await retrievePeripherals(withIdentifiers: [deviceUUID])
        if let peripheral = peripherals.first {
            await delegate.cacheRetrievedPeripheral(peripheral)
            return peripheral
        }
        return nil
    }
    
    func retrievePeripherals(withIdentifiers identifiers: [UUID]) async -> [CBPeripheral] {
        return await withCheckedContinuation { continuation in
            queue.async {
                let retrievedPeripherals = self.centralManager.retrievePeripherals(withIdentifiers: identifiers)
                continuation.resume(returning: retrievedPeripherals)
            }
        }
    }
}

extension CoreBLECentralManager {
    private func validateBluetoothState() throws {
        switch centralManager.state {
        case .poweredOn:
            return
        case .poweredOff:
            throw BLECentralError.bluetoothPoweredOff
        case .unauthorized:
            throw BLECentralError.bluetoothUnauthorized
        case .unsupported:
            throw BLECentralError.bluetoothUnsupported
        case .resetting:
            throw BLECentralError.bluetoothResetting
        case .unknown:
            throw BLECentralError.unknown
        @unknown default:
            throw BLECentralError.unknown
        }
    }
}
