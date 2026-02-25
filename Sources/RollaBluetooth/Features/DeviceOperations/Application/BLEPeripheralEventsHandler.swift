import Foundation

actor BLEPeripheralEventsHandler: BLEPeripheralEventsHandling {
    private let asyncRequestManager: AsyncRequestManager<
        PeripheralManagerRequestKey,
        PeripheralOperationResult
    >
    
    init(asyncRequestManager: AsyncRequestManager<PeripheralManagerRequestKey, PeripheralOperationResult>) {
        self.asyncRequestManager = asyncRequestManager
    }
    
    func handleDidDiscoverServices(
        services: [BLEService],
        deviceUUID: BLEDeviceIdentifier,
        error: Error?
    ) async {
        let key = PeripheralManagerRequestKey.discoverServices(deviceUUID: deviceUUID)
        
        if let error {
            await asyncRequestManager.fulfillRequestWithError(key: key, error: error)
        } else {
            await asyncRequestManager.fulfillRequest(key: key, value: .services(services))
        }
    }
    
    func handleDidDiscoverCharacteristics(
        characteristics: [BLECharacteristic],
        serviceUUID: NormalizedUUID,
        deviceUUID: BLEDeviceIdentifier,
        error: Error?
    ) async {
        let key = PeripheralManagerRequestKey.discoverCharacteristics(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID
        )
        
        if let error {
            await asyncRequestManager.fulfillRequestWithError(key: key, error: error)
        } else {
            await asyncRequestManager.fulfillRequest(key: key, value: .characteristics(characteristics))
        }
    }
    
    func handleDidWriteValueFor(
        characteristic: BLECharacteristic,
        serviceUUID: NormalizedUUID?,
        deviceUUID: BLEDeviceIdentifier,
        error: Error?
    ) async {
        guard let serviceUUID else { return }
        let key = PeripheralManagerRequestKey.writeValue(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristic.uuid
        )
        if let error {
            await asyncRequestManager.fulfillRequestWithError(key: key, error: error)
        } else {
            await asyncRequestManager.fulfillRequest(key: key, value: .void)
        }
    }
    
    func handleDidReadValueFor(
        characteristic: BLECharacteristic,
        serviceUUID: NormalizedUUID?,
        deviceUUID: BLEDeviceIdentifier,
        data: Data?,
        error: Error?
    ) async {
        guard let serviceUUID else {
            return
        }
        let key = PeripheralManagerRequestKey.readValue(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristic.uuid
        )
        
        if let error {
            await asyncRequestManager.fulfillRequestWithError(key: key, error: error)
        } else {
            await asyncRequestManager.fulfillRequest(key: key, value: .value(data))
        }
    }
    
    func handleDidUpdateNotificationStateFor(
        characteristic: BLECharacteristic,
        serviceUUID: NormalizedUUID?,
        deviceUUID: BLEDeviceIdentifier,
        enable: Bool,
        error: Error?
    ) async {
        guard let serviceUUID else { return }
        let key = enable
        ? PeripheralManagerRequestKey.enableNotifications(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristic.uuid
        )
        : PeripheralManagerRequestKey.disableNotifications(
            deviceUUID: deviceUUID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristic.uuid
        )
        if let error {
            await asyncRequestManager.fulfillRequestWithError(key: key, error: error)
        } else {
            await asyncRequestManager.fulfillRequest(key: key, value: .void)
        }
    }
}

