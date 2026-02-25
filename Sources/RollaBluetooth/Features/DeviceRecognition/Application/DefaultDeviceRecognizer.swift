import Foundation

struct DefaultDeviceRecognizer: DeviceRecognizing {
    private let registry: DeviceRecognitionRegistry

    init(registry: DeviceRecognitionRegistry) {
        self.registry = registry
    }

    func recognize(
        deviceId: BLEDeviceIdentifier,
        name: String?,
        advertisedServices: [NormalizedUUID],
        manufacturerData: Data?
    ) async -> RecognizedDevice {

        await registry.recognize(
            deviceId: deviceId,
            name: name,
            services: advertisedServices,
            manufacturerData: manufacturerData
        )
    }
}
