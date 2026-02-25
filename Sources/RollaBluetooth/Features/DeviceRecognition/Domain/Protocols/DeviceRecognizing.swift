import Foundation

public protocol DeviceRecognizing: Sendable {
    func recognize(
        deviceId: BLEDeviceIdentifier,
        name: String?,
        advertisedServices: [NormalizedUUID],
        manufacturerData: Data?
    ) async -> RecognizedDevice
}
