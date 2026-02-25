import Foundation

protocol CoreBLEPeripheralManaging: Sendable {
    func initiateDiscoveringServices(
        _ serviceUUIDs: [NormalizedUUID]?,
        for deviceUUID: BLEDeviceIdentifier
    ) async throws
    
    func initiateDiscoveringCharacteristics(
        _ characteristicUUIDs: [NormalizedUUID]?,
        for serviceUUID: NormalizedUUID,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws
    
    func supportedWriteTypes(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID
    ) async throws -> [BLECharacteristicWriteType]
    
    func initiateWriteValue(
        _ data: Data,
        for characteristicUUID: NormalizedUUID,
        in serviceUUID: NormalizedUUID,
        type: BLECharacteristicWriteType,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws
    
    func initiateReadValue(
        for characteristicUUID: NormalizedUUID,
        in serviceUUID: NormalizedUUID,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws
    
    func isNotificationEnabled(
        for characteristicUUID: NormalizedUUID,
        in serviceUUID: NormalizedUUID,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws -> Bool

    func initiateEnablingNotifications(
        enabled: Bool,
        for characteristicUUID: NormalizedUUID,
        in serviceUUID: NormalizedUUID,
        on deviceUUID: BLEDeviceIdentifier
    ) async throws
}
