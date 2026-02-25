import Foundation

actor BLEConnectionEventsHandler {
    private let asyncRequestManager: AsyncRequestManager<CentralManagerRequestKey, Void>
    private let notificationStreamManaging: BLENotificationStreamManaging
    private let deviceRepository: DeviceRepository

    init(
        asyncRequestManager: AsyncRequestManager<CentralManagerRequestKey, Void>,
        deviceRepository: DeviceRepository,
        notificationStreamManaging: BLENotificationStreamManaging
    ) {
        self.asyncRequestManager = asyncRequestManager
        self.deviceRepository = deviceRepository
        self.notificationStreamManaging = notificationStreamManaging
    }
}

extension BLEConnectionEventsHandler: BLECentralManagerConnectionEventsHandling {
    func didConnect(deviceUUID: BLEDeviceIdentifier) async {
        let key = CentralManagerRequestKey.connect(deviceUUID: deviceUUID)
        await asyncRequestManager.fulfillRequest(key: key, value: ())
    }
    
    func didFailToConnect(deviceUUID: BLEDeviceIdentifier, error: Error?) async {
        let key = CentralManagerRequestKey.connect(deviceUUID: deviceUUID)
        await asyncRequestManager.fulfillRequestWithError(
            key: key,
            error: error ?? BLECentralError.unknown
        )
    }
    
    func didDisconnect(deviceUUID: BLEDeviceIdentifier, error: Error?) async {
        let disconnectKey = CentralManagerRequestKey.disconnect(deviceUUID: deviceUUID)
        let wasIntentional = await asyncRequestManager.hasRequest(for: disconnectKey)
        
        if wasIntentional {
            if let error {
                await asyncRequestManager.fulfillRequestWithError(key: disconnectKey, error: error)
            } else {
                await asyncRequestManager.fulfillRequest(key: disconnectKey, value: ())
            }
        } else {
            if let error {
                await deviceRepository.reportDisconnection(deviceUUID, reason: .error(error.localizedDescription))
            } else {
                await deviceRepository.reportDisconnection(deviceUUID, reason: .deviceInitiated)
            }
        }

        await notificationStreamManaging.cleanupNotificationStreams(for: deviceUUID)
        await asyncRequestManager.cancelPendingRequestsForDevice(deviceUUID: deviceUUID)
    }

    func didFailToDisconnectDevice(deviceUUID: BLEDeviceIdentifier, error: Error?) async {
        await notificationStreamManaging.cleanupNotificationStreams(for: deviceUUID)
        let key = CentralManagerRequestKey.disconnect(deviceUUID: deviceUUID)
        await asyncRequestManager.fulfillRequestWithError(
            key: key,
            error: error ?? BLECentralError.unknown
        )
    }

    func handleBluetoothPoweredOff() async {
        await notificationStreamManaging.cleanupAllNotificationStreams()
        await asyncRequestManager.cancelAllRequests()
        await deviceRepository.handleBluetoothPoweredOff()
    }
}



