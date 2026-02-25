import Foundation

struct HRSignature: DeviceSignature {
    let priority: Int = 10

    func recognize(
        name: String?,
        services: [NormalizedUUID],
        manufacturerData: Data?
    ) -> RecognizedDevice? {
        let serviceTypes = Set(services.compactMap { BLEServiceType.from(uuid: $0) })

        guard serviceTypes.contains(.heartRate) else {
            return nil
        }

        return RecognizedDevice(
            brand: .unknown,
            type: .heartRateSensor,
            serviceTypes: serviceTypes
        )
    }
}
