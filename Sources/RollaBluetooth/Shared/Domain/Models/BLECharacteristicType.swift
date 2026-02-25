import Foundation

public enum BLECharacteristicType: Sendable, Hashable {
    // Heart Rate Service Characteristics
    case heartRateMeasurement
    case heartRateControlPoint
    case bodySensorLocation
    
    // Battery Service Characteristics
    case batteryLevel
    case batteryPowerState
    
    // Device Information Characteristics
    case manufacturerName
    case modelNumber
    case serialNumber
    case hardwareRevision
    case firmwareRevision
    case softwareRevision
    case systemId
    case regulatoryCertification
    
    // Cycling Power Characteristics
    case cyclingPowerMeasurement
    case cyclingPowerFeature
    case cyclingPowerControlPoint
    
    // Running Speed and Cadence Characteristics
    case rscMeasurement
    case rscFeature
    case rscControlPoint

    // Cycling Speed and Cadence Characteristics
    case cscMeasurement
    case cscFeature
    case cscControlPoint

    // Custom characteristic
    case custom(String)
    
    /// The actual UUID for this characteristic
    public var uuid: NormalizedUUID {
        switch self {
        // Heart Rate
        case .heartRateMeasurement: return NormalizedUUID(stringIdentifier: "2A37")
        case .heartRateControlPoint: return NormalizedUUID(stringIdentifier: "2A39")
        case .bodySensorLocation: return NormalizedUUID(stringIdentifier: "2A38")
        
        // Battery
        case .batteryLevel: return NormalizedUUID(stringIdentifier: "2A19")
        case .batteryPowerState: return NormalizedUUID(stringIdentifier: "2A1A")
        
        // Device Information
        case .manufacturerName: return NormalizedUUID(stringIdentifier: "2A29")
        case .modelNumber: return NormalizedUUID(stringIdentifier: "2A24")
        case .serialNumber: return NormalizedUUID(stringIdentifier: "2A25")
        case .hardwareRevision: return NormalizedUUID(stringIdentifier: "2A27")
        case .firmwareRevision: return NormalizedUUID(stringIdentifier: "2A26")
        case .softwareRevision: return NormalizedUUID(stringIdentifier: "2A28")
        case .systemId: return NormalizedUUID(stringIdentifier: "2A23")
        case .regulatoryCertification: return NormalizedUUID(stringIdentifier: "2A2A")
        
        // Running Speed and Cadence
        case .rscMeasurement: return NormalizedUUID(stringIdentifier: "2A53")
        case .rscFeature: return NormalizedUUID(stringIdentifier: "2A54")
        case .rscControlPoint: return NormalizedUUID(stringIdentifier: "2A55")

        // Cycling Power
        case .cyclingPowerMeasurement: return NormalizedUUID(stringIdentifier: "2A63")
        case .cyclingPowerFeature: return NormalizedUUID(stringIdentifier: "2A65")
        case .cyclingPowerControlPoint: return NormalizedUUID(stringIdentifier: "2A66")

        // Cycling Speed and Cadence
        case .cscMeasurement: return NormalizedUUID(stringIdentifier: "2A5B")
        case .cscFeature: return NormalizedUUID(stringIdentifier: "2A5C")
        case .cscControlPoint: return NormalizedUUID(stringIdentifier: "2A55")
        
        // Custom
        case .custom(let uuidString): return NormalizedUUID(stringIdentifier: uuidString)
        }
    }
    
    public var displayName: String {
        switch self {
        case .heartRateMeasurement: return "Heart Rate Measurement"
        case .heartRateControlPoint: return "Heart Rate Control Point"
        case .bodySensorLocation: return "Body Sensor Location"
        case .batteryLevel: return "Battery Level"
        case .batteryPowerState: return "Battery Power State"
        case .manufacturerName: return "Manufacturer Name"
        case .modelNumber: return "Model Number"
        case .serialNumber: return "Serial Number"
        case .hardwareRevision: return "Hardware Revision"
        case .firmwareRevision: return "Firmware Revision"
        case .softwareRevision: return "Software Revision"
        case .systemId: return "System ID"
        case .regulatoryCertification: return "Regulatory Certification"
        case .rscMeasurement: return "RSC Measurement"
        case .rscFeature: return "RSC Feature"
        case .rscControlPoint: return "RSC Control Point"
        case .cyclingPowerMeasurement: return "Cycling Power Measurement"
        case .cyclingPowerFeature: return "Cycling Power Feature"
        case .cyclingPowerControlPoint: return "Cycling Power Control Point"
        case .cscMeasurement: return "CSC Measurement"
        case .cscFeature: return "CSC Feature"
        case .cscControlPoint: return "CSC Control Point"
        case .custom(let uuid): return "Custom (\(uuid))"
        }
    }
    
    public static func from(uuid: NormalizedUUID) -> BLECharacteristicType {
        switch uuid.normalizedShortForm {
        // Heart Rate
        case "2A37": return .heartRateMeasurement
        case "2A39": return .heartRateControlPoint
        case "2A38": return .bodySensorLocation
        
        // Battery
        case "2A19": return .batteryLevel
        case "2A1A": return .batteryPowerState
        
        // Device Information
        case "2A29": return .manufacturerName
        case "2A24": return .modelNumber
        case "2A25": return .serialNumber
        case "2A27": return .hardwareRevision
        case "2A26": return .firmwareRevision
        case "2A28": return .softwareRevision
        case "2A23": return .systemId
        case "2A2A": return .regulatoryCertification
        
        // Running Speed and Cadence
        case "2A53": return .rscMeasurement
        case "2A54": return .rscFeature

        // Cycling Power
        case "2A63": return .cyclingPowerMeasurement
        case "2A65": return .cyclingPowerFeature
        case "2A66": return .cyclingPowerControlPoint

        // Cycling Speed and Cadence
        case "2A5B": return .cscMeasurement
        case "2A5C": return .cscFeature

        // Shared Control Point (both RSC and CSC use this)
        case "2A55": return .rscControlPoint // Default to RSC, context will determine usage
        
        // Unknown characteristics become custom
        default: return .custom(uuid.uuidString)
        }
    }
}
