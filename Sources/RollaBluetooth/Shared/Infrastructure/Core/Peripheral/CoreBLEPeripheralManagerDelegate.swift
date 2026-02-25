import CoreBluetooth

protocol BLEPeripheralManagerDelegate: CBPeripheralDelegate {

}

final class BLEPeripheralManagerDelegateImpl: NSObject, BLEPeripheralManagerDelegate {
    let peripheralHandler: BLEPeripheralEventsHandling
    let notificationStreamManager: BLENotificationStreamManaging

    init(
        peripheralHandler: BLEPeripheralEventsHandling,
        notificationStreamManager: BLENotificationStreamManaging
    ) {
        self.peripheralHandler = peripheralHandler
        self.notificationStreamManager = notificationStreamManager
        super.init()
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        let deviceUUID = BLEDeviceIdentifier(peripheral.identifier)
        let bleServices = (peripheral.services ?? []).map { $0.toDomain() }
        
        Task { [peripheralHandler] in
            await peripheralHandler.handleDidDiscoverServices(
                services: bleServices,
                deviceUUID: deviceUUID,
                error: error
            )
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        let deviceUUID = BLEDeviceIdentifier(peripheral.identifier)
        let serviceUUID = NormalizedUUID(stringIdentifier: service.uuid.uuidString)
        let bleCharacteristics = (service.characteristics ?? []).map { $0.toDomain() }
        
        Task { [peripheralHandler] in
            await peripheralHandler.handleDidDiscoverCharacteristics(
                characteristics: bleCharacteristics,
                serviceUUID: serviceUUID,
                deviceUUID: deviceUUID,
                error: error
            )
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        let deviceUUID = BLEDeviceIdentifier(peripheral.identifier)
        let bleCharacteristic = characteristic.toDomain()
        let serviceUUID = characteristic.service.map { NormalizedUUID(stringIdentifier: $0.uuid.uuidString) }
        let data = characteristic.value
        
        Task { [peripheralHandler, notificationStreamManager] in
            await notificationStreamManager.handleDidUpdateValueFor(
                characteristic: bleCharacteristic,
                serviceUUID: serviceUUID,
                deviceUUID: deviceUUID,
                data: data,
                error: error
            )
            
            await peripheralHandler.handleDidReadValueFor(
                characteristic: bleCharacteristic,
                serviceUUID: serviceUUID,
                deviceUUID: deviceUUID,
                data: data,
                error: error
            )
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        let deviceUUID = BLEDeviceIdentifier(peripheral.identifier)
        let bleCharacteristic = characteristic.toDomain()
        let serviceUUID = characteristic.service.map { NormalizedUUID(stringIdentifier: $0.uuid.uuidString) }
        
        Task { [peripheralHandler] in
            await peripheralHandler.handleDidWriteValueFor(
                characteristic: bleCharacteristic,
                serviceUUID: serviceUUID,
                deviceUUID: deviceUUID,
                error: error
            )
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        let deviceUUID = BLEDeviceIdentifier(peripheral.identifier)
        let bleCharacteristic = characteristic.toDomain()
        let serviceUUID = characteristic.service.map { NormalizedUUID(stringIdentifier: $0.uuid.uuidString) }
        let enable = characteristic.isNotifying
        
        Task { [peripheralHandler] in
            await peripheralHandler.handleDidUpdateNotificationStateFor(
                characteristic: bleCharacteristic,
                serviceUUID: serviceUUID,
                deviceUUID: deviceUUID,
                enable: enable,
                error: error
            )
        }
    }
}
