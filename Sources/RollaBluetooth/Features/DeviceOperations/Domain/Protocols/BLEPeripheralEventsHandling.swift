import Foundation

protocol BLEPeripheralEventsHandling: Sendable {
    func handleDidDiscoverServices(
        services: [BLEService],
        deviceUUID: BLEDeviceIdentifier,
        error: Error?
    ) async
    
    func handleDidDiscoverCharacteristics(
        characteristics: [BLECharacteristic],
        serviceUUID: NormalizedUUID,
        deviceUUID: BLEDeviceIdentifier,
        error: Error?
    ) async
    
    func handleDidWriteValueFor(
        characteristic: BLECharacteristic,
        serviceUUID: NormalizedUUID?,
        deviceUUID: BLEDeviceIdentifier,
        error: Error?
    ) async
    
    func handleDidReadValueFor(
        characteristic: BLECharacteristic,
        serviceUUID: NormalizedUUID?,
        deviceUUID: BLEDeviceIdentifier,
        data: Data?,
        error: Error?
    ) async
    
    func handleDidUpdateNotificationStateFor(
        characteristic: BLECharacteristic,
        serviceUUID: NormalizedUUID?,
        deviceUUID: BLEDeviceIdentifier,
        enable: Bool,
        error: Error?
    ) async


}
