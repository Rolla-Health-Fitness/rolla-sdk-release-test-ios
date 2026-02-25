import Foundation

protocol BLENotificationStreamManaging: Sendable {
    func observeNotifications(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID
    ) async -> (stream: AsyncStream<Data>, id: UUID)

    func stopObservingNotifications(id: UUID) async

    func waitForNotification(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        timeout: TimeInterval,
        matcher: NotificationMatcher?
    ) async throws -> Data?

    func handleDidUpdateValueFor(
        characteristic: BLECharacteristic,
        serviceUUID: NormalizedUUID?,
        deviceUUID: BLEDeviceIdentifier,
        data: Data?,
        error: Error?
    ) async

    func cleanupNotificationStream(
        for deviceUUID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID
    ) async

    func cleanupNotificationStreams(
        for deviceUUID: BLEDeviceIdentifier
    ) async

    func cleanupAllNotificationStreams() async
}
