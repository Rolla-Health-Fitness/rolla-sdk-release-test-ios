import Foundation

protocol ConnectionLifecycleManaging: Sendable {
    func connect(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        brand: DeviceBrand?,
        type: BLEDeviceType?,
        macAddress: String?
    ) async throws
    func disconnect(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws
    func getAllDeviceStateChangesStream() async -> AsyncStream<[DeviceStateChange]>
    func stopHandlingDeviceStateChanges(for deviceUUID: BLEDeviceIdentifier) async
    func cancelReconnection(for deviceUUID: BLEDeviceIdentifier) async
}

