import Foundation

public final class CharacteristicObserver: Sendable {
    private let notificationStreamManager: BLENotificationStreamManaging

    init(notificationStreamManager: BLENotificationStreamManaging) {
        self.notificationStreamManager = notificationStreamManager
    }

    public convenience init() {
        let deps = RollaBluetoothDependencies.shared
        self.init(notificationStreamManager: deps.notificationStreamManager)
    }
    
    public func observeNotifications(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID
    ) async -> (stream: AsyncStream<Data>, id: UUID) {
        return await notificationStreamManager.observeNotifications(
            deviceID: deviceID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )
    }
    
    public func stopObservingNotifications(id: UUID) async {
        await notificationStreamManager.stopObservingNotifications(id: id)
    }
    
    //TODO: Remove
    public func waitForNotification(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        timeout: TimeInterval,
        matcher: NotificationMatcher? = nil
    ) async throws -> Data? {
        return try await notificationStreamManager.waitForNotification(
            deviceID: deviceID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID,
            timeout: timeout,
            matcher: matcher
        )
    }
    
    public func stopObservingNotifications(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID
    ) async {
        await notificationStreamManager.cleanupNotificationStream(
            for: deviceID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID
        )
    }
    
    public func stopObservingNotifications(for deviceID: BLEDeviceIdentifier) async {
        await notificationStreamManager.cleanupNotificationStreams(for: deviceID)
    }
    
    public func stopObservingAllNotifications() async {
        await notificationStreamManager.cleanupAllNotificationStreams()
    }
}
