import Foundation

actor DeviceRecognitionRegistry {
    private var plugins: [DeviceRecognitionPlugin]
    private let logger: Logging
    private let logCategory: LogCategory = .scanning

    init(plugins: [DeviceRecognitionPlugin] = [], logger: Logging) {
        self.logger = logger
        self.plugins = plugins.sorted { plugin1, plugin2 in
            let maxPriority1 = plugin1.signatures.map(\.priority).max() ?? 0
            let maxPriority2 = plugin2.signatures.map(\.priority).max() ?? 0
            return maxPriority1 > maxPriority2
        }
    }

    func recognize(
        deviceId: BLEDeviceIdentifier,
        name: String?,
        services: [NormalizedUUID],
        manufacturerData: Data?
    ) -> RecognizedDevice {
        let serviceUUIDs = services.map { $0.normalizedShortForm }.joined(separator: ", ")
        logger.debug(
            "Recognizing device - Name: \(name ?? "nil"), Services: \(services.count) [\(serviceUUIDs)], ManufacturerData: \(manufacturerData != nil)",
            category: logCategory
        )

        for plugin in plugins {
            let sortedSignatures = plugin.signatures.sorted { $0.priority > $1.priority }
            for signature in sortedSignatures {
                if let recognized = signature.recognize(
                    name: name,
                    services: services,
                    manufacturerData: manufacturerData
                ) {
                    let serviceNames = recognized.serviceTypes.map { service in
                        switch service {
                        case .heartRate: return "HeartRate"
                        case .battery: return "Battery"
                        case .deviceInformation: return "DeviceInfo"
                        case .runningSpeedAndCadence: return "RSC"
                        case .pulseOximeter: return "PulseOx"
                        case .dfu: return "DFU"
                        case .custom(let uuid): return "Custom(\(uuid))"
                        }
                    }.joined(separator: ", ")

                    logger.info(
                        "Device recognized - Brand: \(recognized.brand.rawValue), Type: \(recognized.type.rawValue), Services: [\(serviceNames)]",
                        category: logCategory
                    )
                    return recognized
                }
            }
        }

        logger.debug("Device not recognized, returning unknown", category: logCategory)
        return RecognizedDevice(
            brand: .unknown,
            type: .unknown,
            serviceTypes: []
        )
    }
}
