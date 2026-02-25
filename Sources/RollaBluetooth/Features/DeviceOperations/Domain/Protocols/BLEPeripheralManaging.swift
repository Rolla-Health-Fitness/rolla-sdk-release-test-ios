import Foundation

protocol BLEPeripheralManaging: Sendable {
    func discoverServices(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUIDs: [NormalizedUUID]?,
        timeout: TimeInterval
    ) async throws -> [BLEService]

    func discoverCharacteristics(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUIDs: [NormalizedUUID]?,
        timeout: TimeInterval
    ) async throws -> [BLECharacteristic]

    func readValue(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        timeout: TimeInterval
    ) async throws -> Data?

    func writeValue(
        _ data: Data,
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        preferredTypes: [BLECharacteristicWriteType],
        timeout: TimeInterval
    ) async throws

    func enableNotifications(
        enabled: Bool,
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        timeout: TimeInterval
    ) async throws

}
