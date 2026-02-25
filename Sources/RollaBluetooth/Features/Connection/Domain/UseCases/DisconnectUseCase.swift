import Foundation

protocol DisconnectUseCase: Sendable {
    func disconnect(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws
}
