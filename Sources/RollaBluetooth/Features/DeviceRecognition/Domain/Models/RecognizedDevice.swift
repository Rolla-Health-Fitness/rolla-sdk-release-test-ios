import Foundation

public struct RecognizedDevice: Sendable, Equatable {
    public let brand: DeviceBrand
    public let type: BLEDeviceType
    public let serviceTypes: Set<BLEServiceType>

    public init(brand: DeviceBrand, type: BLEDeviceType, serviceTypes: Set<BLEServiceType>) {
        self.brand = brand
        self.type = type
        self.serviceTypes = serviceTypes
    }
}

