import Foundation

protocol ConnectUseCase: Sendable {
    func connect(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        brand: DeviceBrand?,
        type: BLEDeviceType?,
        macAddress: String?
    ) async throws
}
