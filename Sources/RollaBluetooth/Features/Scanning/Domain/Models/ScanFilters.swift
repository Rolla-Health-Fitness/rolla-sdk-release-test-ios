import Foundation

public struct ScanFilters: Sendable, Equatable {
    public let brands: Set<DeviceBrand>?
    public let types: Set<BLEDeviceType>?
    public let serviceTypes: Set<BLEServiceType>?

    public init(
        brands: Set<DeviceBrand>? = nil,
        types: Set<BLEDeviceType>? = nil,
        serviceTypes: Set<BLEServiceType>? = nil
    ) {
        self.brands = brands
        self.types = types
        self.serviceTypes = serviceTypes
    }
    
    func passes(_ recognizedDevice: RecognizedDevice) -> Bool {
        if let brands {
            guard brands.contains(recognizedDevice.brand) else {
                return false
            }
        }

        if let types {
            guard types.contains(recognizedDevice.type) else {
                return false
            }
        }

        if let serviceTypes {
            let hasAllRequiredServices = serviceTypes.isSubset(of: recognizedDevice.serviceTypes)
            guard hasAllRequiredServices else {
                return false
            }
        }
        return true
    }

    private func formatBrands(_ brands: Set<DeviceBrand>) -> String {
        brands.map { $0.rawValue }.sorted().joined(separator: ", ")
    }

    private func formatTypes(_ types: Set<BLEDeviceType>) -> String {
        types.map { $0.rawValue }.sorted().joined(separator: ", ")
    }

    private func formatServiceTypes(_ serviceTypes: Set<BLEServiceType>) -> String {
        serviceTypes.map { $0.uuid.normalizedShortForm }.sorted().joined(separator: ", ")
    }
}

public extension ScanFilters {
    static func brands(_ brands: Set<DeviceBrand>) -> ScanFilters {
        return ScanFilters(brands: brands)
    }

    static func types(_ types: Set<BLEDeviceType>) -> ScanFilters {
        return ScanFilters(types: types)
    }

    static func services(_ services: Set<BLEServiceType>) -> ScanFilters {
        return ScanFilters(serviceTypes: services)
    }

    static let none = ScanFilters()
}
