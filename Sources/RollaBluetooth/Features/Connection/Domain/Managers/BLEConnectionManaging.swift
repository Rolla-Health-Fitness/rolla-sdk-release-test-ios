import Foundation

protocol BLEConnectionManaging: Sendable {
    func connect(to deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws
    func disconnect(from deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws
}
