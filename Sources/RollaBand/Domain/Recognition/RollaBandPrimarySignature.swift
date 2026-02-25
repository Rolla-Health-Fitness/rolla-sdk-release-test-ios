import Foundation

struct RollaBandPrimarySignature: DeviceSignature {
    let priority = 100
    
    private let requiredServices: Set<NormalizedUUID> = [
        BLEServiceType.rollaBand.uuid,
        BLEServiceType.heartRate.uuid,
        BLEServiceType.deviceInformation.uuid,
        BLEServiceType.battery.uuid,
        BLEServiceType.runningSpeedAndCadence.uuid
    ]
    
    func recognize(
        name: String?,
        services: [NormalizedUUID],
        manufacturerData: Data?
    ) -> RecognizedDevice? {
        let serviceSet = Set(services)
        
        guard requiredServices.isSubset(of: serviceSet) else {
            return nil
        }
        
        guard (manufacturerData?.extractedMACAddress) != nil else {
            return nil
        }
        
        let serviceTypes = Set(services.compactMap { BLEServiceType.from(uuid: $0) })
    
        return RecognizedDevice(
            brand: .rolla,
            type: .band,
            serviceTypes: serviceTypes
        )
    }
}
