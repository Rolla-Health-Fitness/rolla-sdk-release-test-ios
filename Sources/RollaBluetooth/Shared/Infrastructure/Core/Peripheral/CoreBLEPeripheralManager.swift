import Foundation
@preconcurrency import CoreBluetooth

final class CoreBLEPeripheralManager: CoreBLEPeripheralManaging {
    private let centralManager: CoreBLECentralManaging
    private let bluetoothQueue: DispatchQueue
    
    init(
        centralManager: CoreBLECentralManaging,
        bluetoothQueue: DispatchQueue
    ) {
        self.centralManager = centralManager
        self.bluetoothQueue = bluetoothQueue
    }

    private func findService(
        with serviceUUID: NormalizedUUID,
        for peripheral: CBPeripheral
    ) -> CBService? {
        guard let services = peripheral.services else { return nil }
        let wantedServiceUUID = serviceUUID.asCBUUID
        return services.first { $0.uuid.isEqual(wantedServiceUUID) }
    }
    
    private func findCharacteristic(
        with characteristicUUID: NormalizedUUID,
        for service: CBService
    ) -> CBCharacteristic? {
        guard let characteristics = service.characteristics else { return nil }
        let wantedCharacteristicUUID = characteristicUUID.asCBUUID
        return characteristics.first { $0.uuid.isEqual(wantedCharacteristicUUID) }
    }
}

extension CoreBLEPeripheralManager {
    func initiateDiscoveringServices(
        _ serviceUUIDs: [NormalizedUUID]?,
        for deviceUUID: BLEDeviceIdentifier
    ) async throws {
        guard let peripheral = await centralManager.getPeripheral(for: deviceUUID) else {
            throw BLEPeripheralError.deviceNotFound(deviceUUID.uuidString)
        }

        return try await withCheckedThrowingContinuation { continuation in
            bluetoothQueue.async {
                do {
                    guard peripheral.state == .connected else {
                        throw BLEPeripheralError.notConnected(deviceUUID.uuidString)
                    }
                    let cbuuids = serviceUUIDs?.map { $0.asCBUUID }
                    peripheral.discoverServices(cbuuids)
                    continuation.resume(returning: ())
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func initiateDiscoveringCharacteristics(
        _ characteristicUUIDs: [NormalizedUUID]?,
        for serviceUUID: NormalizedUUID,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws {
        guard let peripheral = await centralManager.getPeripheral(for: deviceUUID) else {
            throw BLEPeripheralError.deviceNotFound(deviceUUID.uuidString)
        }

        return try await withCheckedThrowingContinuation { continuation in
            bluetoothQueue.async {
                do {
                    guard peripheral.state == .connected else {
                        throw BLEPeripheralError.notConnected(deviceUUID.uuidString)
                    }
                    guard let service = self.findService(with: serviceUUID, for: peripheral) else {
                        throw BLEPeripheralError.serviceNotFound(serviceUUID.normalizedShortForm)
                    }

                    let cbuuids = characteristicUUIDs?.map { $0.asCBUUID }
                    peripheral.discoverCharacteristics(cbuuids, for: service)
                    continuation.resume(returning: ())
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func supportedWriteTypes(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID
    ) async throws -> [BLECharacteristicWriteType] {
        guard let peripheral = await centralManager.getPeripheral(for: deviceUUID) else {
            throw BLEPeripheralError.deviceNotFound(deviceUUID.uuidString)
        }

        return try await withCheckedThrowingContinuation { continuation in
            bluetoothQueue.async {
                do {
                    guard peripheral.state == .connected else {
                        throw BLEPeripheralError.notConnected(deviceUUID.uuidString)
                    }
                    guard let service = self.findService(with: serviceUUID, for: peripheral) else {
                        throw BLEPeripheralError.serviceNotFound(serviceUUID.normalizedShortForm)
                    }
                    guard let characteristic = self.findCharacteristic(with: characteristicUUID, for: service) else {
                        throw BLEPeripheralError.characteristicNotFound(characteristicUUID.normalizedShortForm)
                    }

                    var types: [BLECharacteristicWriteType] = []
                    if characteristic.properties.contains(.write) { types.append(.withResponse) }
                    if characteristic.properties.contains(.writeWithoutResponse) { types.append(.withoutResponse) }

                    continuation.resume(returning: types)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func initiateWriteValue(
        _ data: Data,
        for characteristicUUID: NormalizedUUID,
        in serviceUUID: NormalizedUUID,
        type: BLECharacteristicWriteType = .withResponse,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws {
        guard let peripheral = await centralManager.getPeripheral(for: deviceUUID) else {
            throw BLEPeripheralError.deviceNotFound(deviceUUID.uuidString)
        }

        return try await withCheckedThrowingContinuation { continuation in
            bluetoothQueue.async {
                do {
                    guard peripheral.state == .connected else {
                        throw BLEPeripheralError.notConnected(deviceUUID.uuidString)
                    }
                    guard let service = self.findService(with: serviceUUID, for: peripheral) else {
                        throw BLEPeripheralError.serviceNotFound(serviceUUID.normalizedShortForm)
                    }
                    guard let characteristic = self.findCharacteristic(with: characteristicUUID, for: service) else {
                        throw BLEPeripheralError.characteristicNotFound(characteristicUUID.normalizedShortForm)
                    }

                    let cbType: CBCharacteristicWriteType = (type == .withResponse) ? .withResponse : .withoutResponse
                    guard characteristic.properties.contains(cbType == .withResponse ? .write : .writeWithoutResponse) else {
                        throw BLEPeripheralError.writeNotSupported(characteristicUUID.normalizedShortForm, type)
                    }

                    peripheral.writeValue(data, for: characteristic, type: cbType)
                    continuation.resume(returning: ())
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func initiateReadValue(
        for characteristicUUID: NormalizedUUID,
        in serviceUUID: NormalizedUUID,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws {
        guard let peripheral = await centralManager.getPeripheral(for: deviceUUID) else {
            throw BLEPeripheralError.deviceNotFound(deviceUUID.uuidString)
        }

        return try await withCheckedThrowingContinuation { continuation in
            bluetoothQueue.async {
                do {
                    guard peripheral.state == .connected else {
                        throw BLEPeripheralError.notConnected(deviceUUID.uuidString)
                    }
                    guard let service = self.findService(with: serviceUUID, for: peripheral) else {
                        throw BLEPeripheralError.serviceNotFound(serviceUUID.normalizedShortForm)
                    }
                    guard let characteristic = self.findCharacteristic(with: characteristicUUID, for: service) else {
                        throw BLEPeripheralError.characteristicNotFound(characteristicUUID.normalizedShortForm)
                    }
                    guard characteristic.properties.contains(.read) else {
                        throw BLEPeripheralError.readNotSupported(deviceUUID.uuidString)
                    }
                    peripheral.readValue(for: characteristic)
                    continuation.resume(returning: ())
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func isNotificationEnabled(
        for characteristicUUID: NormalizedUUID,
        in serviceUUID: NormalizedUUID,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws -> Bool {
        guard let peripheral = await centralManager.getPeripheral(for: deviceUUID) else {
            throw BLEPeripheralError.deviceNotFound(deviceUUID.uuidString)
        }

        return try await withCheckedThrowingContinuation { continuation in
            bluetoothQueue.async {
                do {
                    guard peripheral.state == .connected else {
                        throw BLEPeripheralError.notConnected(deviceUUID.uuidString)
                    }
                    guard let service = self.findService(with: serviceUUID, for: peripheral) else {
                        throw BLEPeripheralError.serviceNotFound(serviceUUID.normalizedShortForm)
                    }
                    guard let characteristic = self.findCharacteristic(with: characteristicUUID, for: service) else {
                        throw BLEPeripheralError.characteristicNotFound(characteristicUUID.normalizedShortForm)
                    }

                    continuation.resume(returning: characteristic.isNotifying)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func initiateEnablingNotifications(
        enabled: Bool,
        for characteristicUUID: NormalizedUUID,
        in serviceUUID: NormalizedUUID,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws {
        guard let peripheral = await centralManager.getPeripheral(for: deviceUUID) else {
            throw BLEPeripheralError.deviceNotFound(deviceUUID.uuidString)
        }

        return try await withCheckedThrowingContinuation { continuation in
            bluetoothQueue.async {
                do {
                    guard peripheral.state == .connected else {
                        throw BLEPeripheralError.notConnected(deviceUUID.uuidString)
                    }
                    guard let service = self.findService(with: serviceUUID, for: peripheral) else {
                        throw BLEPeripheralError.serviceNotFound(serviceUUID.normalizedShortForm)
                    }
                    guard let characteristic = self.findCharacteristic(with: characteristicUUID, for: service) else {
                        throw BLEPeripheralError.characteristicNotFound(characteristicUUID.normalizedShortForm)
                    }
                    guard characteristic.properties.contains(.notify) || characteristic.properties.contains(.indicate) else {
                        throw BLEPeripheralError.notificationsNotSupported(characteristicUUID.normalizedShortForm)
                    }

                    peripheral.setNotifyValue(enabled, for: characteristic)
                    continuation.resume(returning: ())
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
