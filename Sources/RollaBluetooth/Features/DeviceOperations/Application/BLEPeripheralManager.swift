import Foundation
import CoreBluetooth

enum PeripheralManagerRequestKey: Hashable, Sendable, DeviceScoped {
    case discoverServices(deviceUUID: BLEDeviceIdentifier)
    case discoverCharacteristics(deviceUUID: BLEDeviceIdentifier, serviceUUID: NormalizedUUID)
    case enableNotifications(deviceUUID: BLEDeviceIdentifier, serviceUUID: NormalizedUUID, characteristicUUID: NormalizedUUID)
    case disableNotifications(deviceUUID: BLEDeviceIdentifier, serviceUUID: NormalizedUUID, characteristicUUID: NormalizedUUID)
    case readValue(deviceUUID: BLEDeviceIdentifier, serviceUUID: NormalizedUUID, characteristicUUID: NormalizedUUID)
    case writeValue(deviceUUID: BLEDeviceIdentifier, serviceUUID: NormalizedUUID, characteristicUUID: NormalizedUUID)
    
    var deviceUUID: BLEDeviceIdentifier {
        switch self {
        case .discoverServices(let deviceUUID): return deviceUUID
        case .discoverCharacteristics(let deviceUUID, _): return deviceUUID
        case .enableNotifications(let deviceUUID, _, _): return deviceUUID
        case .disableNotifications(let deviceUUID, _, _): return deviceUUID
        case .readValue(let deviceUUID, _, _): return deviceUUID
        case .writeValue(let deviceUUID, _, _): return deviceUUID
        }
    }
}

actor BLEPeripheralManager {
    private let coreManager: CoreBLEPeripheralManaging
    private let eventsHandler: BLEPeripheralEventsHandler
    private let asyncRequestManager: AsyncRequestManager<PeripheralManagerRequestKey, PeripheralOperationResult>
    
    init(
        coreManager: CoreBLEPeripheralManaging,
        eventsHandler: BLEPeripheralEventsHandler,
        asyncRequestManager: AsyncRequestManager<PeripheralManagerRequestKey, PeripheralOperationResult>
    ) {
        self.coreManager = coreManager
        self.asyncRequestManager = asyncRequestManager
        self.eventsHandler = eventsHandler
    }
}

extension BLEPeripheralManager: BLEPeripheralManaging {
    func discoverServices(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUIDs: [NormalizedUUID]? = nil,
        timeout: TimeInterval
    ) async throws -> [BLEService] {
        let key = PeripheralManagerRequestKey.discoverServices(deviceUUID: deviceUUID)
        
        try await asyncRequestManager.registerRequest(key: key)
        
        do {
            try await coreManager.initiateDiscoveringServices(serviceUUIDs, for: deviceUUID)
        } catch {
            await asyncRequestManager.cancelRequest(key: key)
            throw error
        }
        let result = try await asyncRequestManager.waitForRequest(
            key: key,
            timeout: timeout
        )
        
        switch result {
        case .services(let services):
            return services
        default:
            throw BLEPeripheralError.unexpectedResult("Expected services, got \(result)")
        }
    }
    
    func discoverCharacteristics(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUIDs: [NormalizedUUID]? = nil,
        timeout: TimeInterval
    ) async throws -> [BLECharacteristic] {
        let key = PeripheralManagerRequestKey.discoverCharacteristics(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID
        )
        
        try await asyncRequestManager.registerRequest(key: key)
        
        do {
            try await coreManager.initiateDiscoveringCharacteristics(
                characteristicUUIDs,
                for: serviceUUID,
                on: deviceUUID
            )
        } catch {
            await asyncRequestManager.cancelRequest(key: key)
            throw error
        }
        
        let result = try await asyncRequestManager.waitForRequest(
            key: key,
            timeout: timeout
        )
        
        switch result {
        case .characteristics(let characteristics):
            return characteristics
        default:
            throw BLEPeripheralError.unexpectedResult("Expected characteristics, got \(result)")
        }
    }
    
    func readValue(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        timeout: TimeInterval
    ) async throws -> Data? {
        let key = PeripheralManagerRequestKey.readValue(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )
        
        try await asyncRequestManager.registerRequest(key: key)
        
        do {
            try await coreManager.initiateReadValue(
                for: characteristicUUID,
                in: serviceUUID,
                on: deviceUUID
            )
        } catch {
            await asyncRequestManager.cancelRequest(key: key)
            throw error
        }
        
        let result = try await asyncRequestManager.waitForRequest(
            key: key,
            timeout: timeout
        )
        
        switch result {
        case .value(let data):
            return data
        default:
            throw BLEPeripheralError.unknown("Expected value, got \(result)")
        }
    }
    
    func writeValue(
        _ data: Data,
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        preferredTypes: [BLECharacteristicWriteType] = [.withResponse, .withoutResponse],
        timeout: TimeInterval
    ) async throws {
        let supportedTypes: [BLECharacteristicWriteType]
        do {
            supportedTypes = try await coreManager.supportedWriteTypes(
                for: deviceUUID,
                serviceUUID: serviceUUID,
                characteristicUUID: characteristicUUID
            )
        } catch {
            throw error
        }
        
        guard let writeType = preferredTypes.first(where: { supportedTypes.contains($0) }) else {
            throw BLEPeripheralError.writeNotSupported(characteristicUUID.normalizedShortForm, preferredTypes.first ?? .withResponse)
        }
        
        // write without response (no async request needed)
        if writeType == .withoutResponse {
            try await coreManager.initiateWriteValue(
                data,
                for: characteristicUUID,
                in: serviceUUID,
                type: writeType,
                on: deviceUUID
            )
            return
        }
        
        let key = PeripheralManagerRequestKey.writeValue(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )
        
        try await asyncRequestManager.registerRequest(key: key)
        
        do {
            try await coreManager.initiateWriteValue(
                data,
                for: characteristicUUID,
                in: serviceUUID,
                type: writeType,
                on: deviceUUID
            )
        } catch {
            await asyncRequestManager.cancelRequest(key: key)
            throw error
        }
        
        let result = try await asyncRequestManager.waitForRequest(
            key: key,
            timeout: timeout
        )
        
        guard case .void = result else {
            throw BLEPeripheralError.unexpectedResult("Expected void result for write operation, got \(result)")
        }
    }
    
    func enableNotifications(
        enabled: Bool,
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        timeout: TimeInterval
    ) async throws {
        let currentlyEnabled = try await coreManager.isNotificationEnabled(
            for: characteristicUUID,
            in: serviceUUID,
            on: deviceUUID
        )
        
        if currentlyEnabled == enabled {
            return
        }
        
        let key = enabled
        ? PeripheralManagerRequestKey.enableNotifications(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )
        : PeripheralManagerRequestKey.disableNotifications(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )
        
        try await asyncRequestManager.registerRequest(key: key)
        
        do {
            try await coreManager.initiateEnablingNotifications(
                enabled: enabled,
                for: characteristicUUID,
                in: serviceUUID,
                on: deviceUUID
            )
        } catch {
            await asyncRequestManager.cancelRequest(key: key)
            throw error
        }
        
        let result = try await asyncRequestManager.waitForRequest(
            key: key,
            timeout: timeout
        )
        
        guard case .void = result else {
            throw BLEPeripheralError.unknown("Expected void result for notification operation, got \(result)")
        }
    }
}
