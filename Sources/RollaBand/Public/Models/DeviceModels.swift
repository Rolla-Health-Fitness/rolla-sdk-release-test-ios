import Foundation

// MARK: - Device Brand

public enum BluetoothDeviceBrand: Sendable, Hashable, Equatable {
    case rolla
    case wahoo
    case garmin
    case tacx
    case polar
    case suunto
    case apple
    case unknown
    case custom(String)
    
    public var rawValue: String {
        switch self {
        case .rolla: return "Rolla"
        case .wahoo: return "Wahoo"
        case .garmin: return "Garmin"
        case .tacx: return "Tacx"
        case .polar: return "Polar"
        case .suunto: return "Suunto"
        case .apple: return "Apple"
        case .unknown: return "Unknown"
        case .custom(let name): return name
        }
    }
    
    public init(rawValue: String) {
        switch rawValue {
        case "Rolla": self = .rolla
        case "Wahoo": self = .wahoo
        case "Garmin": self = .garmin
        case "Tacx": self = .tacx
        case "Polar": self = .polar
        case "Suunto": self = .suunto
        case "Apple": self = .apple
        case "Unknown": self = .unknown
        default: self = .custom(rawValue)
        }
    }
}

// MARK: - Device Type

public enum BluetoothDeviceType: Sendable, Hashable, Equatable {
    case heartRateSensor
    case footPod
    case bikeTrainer
    case band
    case watch
    case rscSensor
    case speedSensor
    case powerMeter
    case unknown
    case custom(String)

    public var rawValue: String {
        switch self {
        case .heartRateSensor: return "heart_rate_sensor"
        case .footPod: return "foot_pod"
        case .bikeTrainer: return "bike_trainer"
        case .band: return "band"
        case .watch: return "watch"
        case .rscSensor: return "rsc_sensor"
        case .speedSensor: return "speed_sensor"
        case .powerMeter: return "power_meter"
        case .unknown: return "unknown"
        case .custom(let type): return type
        }
    }

    public init(rawValue: String) {
        switch rawValue {
        case "heart_rate_sensor": self = .heartRateSensor
        case "foot_pod": self = .footPod
        case "bike_trainer": self = .bikeTrainer
        case "band": self = .band
        case "watch": self = .watch
        case "rsc_sensor": self = .rscSensor
        case "speed_sensor": self = .speedSensor
        case "power_meter": self = .powerMeter
        case "unknown": self = .unknown
        default: self = .custom(rawValue)
        }
    }
}

// MARK: - Normalized UUID

public struct BandNormalizedUUID: Equatable, Hashable, Sendable {
    public let uuidString: String
    
    public init(stringIdentifier: String) {
        self.uuidString = Self.normalize(stringIdentifier)
    }
    
    public var normalizedShortForm: String {
        let clean = uuidString.replacingOccurrences(of: "-", with: "")
        
        if uuidString.hasPrefix("0000") && uuidString.hasSuffix("-0000-1000-8000-00805F9B34FB") {
            return String(clean.dropFirst(4).prefix(4))
        }
        
        return String(clean.prefix(4))
    }
    
    private static func normalize(_ uuid: String) -> String {
        let cleaned = uuid.replacingOccurrences(of: "-", with: "").uppercased()
        
        if cleaned.count == 4 {
            return "0000\(cleaned)-0000-1000-8000-00805F9B34FB"
        }
        
        if cleaned.count == 8 {
            return "\(cleaned)-0000-1000-8000-00805F9B34FB"
        }
        
        if cleaned.count == 32 {
            let uuid = cleaned
            return "\(uuid.prefix(8))-\(uuid.dropFirst(8).prefix(4))-\(uuid.dropFirst(12).prefix(4))-\(uuid.dropFirst(16).prefix(4))-\(uuid.dropFirst(20))"
        }
        
        return uuid.uppercased()
    }
}

// MARK: - Service Type

public enum BandServiceType: Sendable, Hashable {
    case heartRate
    case battery
    case deviceInformation
    case runningSpeedAndCadence
    case pulseOximeter
    case dfu
    case rollaBand
    case custom(String)

    public var uuid: BandNormalizedUUID {
        switch self {
        case .heartRate: return BandNormalizedUUID(stringIdentifier: "180D")
        case .battery: return BandNormalizedUUID(stringIdentifier: "180F")
        case .deviceInformation: return BandNormalizedUUID(stringIdentifier: "180A")
        case .runningSpeedAndCadence: return BandNormalizedUUID(stringIdentifier: "1814")
        case .pulseOximeter: return BandNormalizedUUID(stringIdentifier: "1822")
        case .dfu: return BandNormalizedUUID(stringIdentifier: "FE59")
        case .rollaBand: return BandNormalizedUUID(stringIdentifier: "FFF0")
        case .custom(let uuidString): return BandNormalizedUUID(stringIdentifier: uuidString)
        }
    }

    public static func from(uuid: BandNormalizedUUID) -> BandServiceType {
        switch uuid.normalizedShortForm {
        case "180D": return .heartRate
        case "180F": return .battery
        case "180A": return .deviceInformation
        case "1814": return .runningSpeedAndCadence
        case "1822": return .pulseOximeter
        case "FE59": return .dfu
        case "FFF0": return .rollaBand
        default: return .custom(uuid.uuidString)
        }
    }
}

// MARK: - Service

public struct BandService: Equatable, Hashable, Sendable {
    public let uuid: BandNormalizedUUID
    public let isPrimary: Bool

    public init(uuid: BandNormalizedUUID, isPrimary: Bool = true) {
        self.uuid = uuid
        self.isPrimary = isPrimary
    }

    public var serviceType: BandServiceType {
        return BandServiceType.from(uuid: uuid)
    }
}

// MARK: - Discovered Device

public struct BandDiscoveredDevice: Sendable, Equatable, Hashable {
    public let macAddress: String
    public let name: String?
    public let rssi: Int
    public let brand: BluetoothDeviceBrand
    public let type: BluetoothDeviceType
    public let timestamp: Date
    public let advertisedServices: [BandNormalizedUUID]
    public let manufacturerData: Data?

    public init(
        macAddress: String,
        name: String?,
        rssi: Int,
        brand: BluetoothDeviceBrand,
        type: BluetoothDeviceType,
        advertisedServices: [BandNormalizedUUID] = [],
        manufacturerData: Data? = nil,
        timestamp: Date = Date()
    ) {
        self.macAddress = macAddress
        self.name = name
        self.rssi = rssi
        self.brand = brand
        self.type = type
        self.advertisedServices = advertisedServices
        self.manufacturerData = manufacturerData
        self.timestamp = timestamp
    }
}

// MARK: - Connected Device

public struct BandConnectedDevice: Sendable, Equatable, Hashable {
    public let macAddress: String
    public let name: String?
    public let advertisedServices: [BandNormalizedUUID]?
    public let services: [BandService]
    public let deviceType: BluetoothDeviceType
    public let brand: BluetoothDeviceBrand

    public init(
        macAddress: String,
        name: String?,
        advertisedServices: [BandNormalizedUUID]?,
        services: [BandService],
        deviceType: BluetoothDeviceType = .unknown,
        brand: BluetoothDeviceBrand = .unknown
    ) {
        self.macAddress = macAddress
        self.name = name
        self.advertisedServices = advertisedServices
        self.services = services
        self.deviceType = deviceType
        self.brand = brand
    }
}

// MARK: - Bluetooth Capability

public enum BandBluetoothCapability: Sendable, Equatable, Hashable {
    case heartRate
    case runningSpeedAndCadence
    case cyclingSpeedAndCadence
    case other(BandServiceType)

    init?(_ serviceType: BandServiceType) {
        switch serviceType {
        case .heartRate:
            self = .heartRate
        case .runningSpeedAndCadence:
            self = .runningSpeedAndCadence
        case .battery, .deviceInformation, .pulseOximeter, .dfu, .rollaBand, .custom:
            return nil
        }
    }
}

public struct RollaBandDevice: Sendable, Equatable {
    /// Device name
    public let name: String

    /// Received Signal Strength Indicator in dBm
    public let rssi: Int64

    /// Unique device identifier (MAC address)
    public let macAddress: String

    /// List of Bluetooth capabilities supported by this device
    /// Used to determine what data can be received from the device
    public let capabilities: [BandBluetoothCapability]

    /// Current connection state of the device
    public let connectionState: BandConnectionState

    /// Type classification of the device
    public let deviceType: BluetoothDeviceType

    public init(
        name: String,
        rssi: Int64,
        macAddress: String,
        capabilities: [BandBluetoothCapability],
        connectionState: BandConnectionState,
        deviceType: BluetoothDeviceType
    ) {
        self.name = name
        self.rssi = rssi
        self.macAddress = macAddress
        self.capabilities = capabilities
        self.connectionState = connectionState
        self.deviceType = deviceType
    }
}

// MARK: - Bluetooth State

public enum BandBluetoothState: Equatable, Sendable {
    case unknown
    case resetting
    case unsupported
    case unauthorized
    case poweredOff
    case poweredOn
}

// MARK: - Firmware Update Event

public enum BandFirmwareUpdateEvent: Sendable {
    case preparationStarted(macAddress: String)
    case preparationCompleted(macAddress: String)
    case preparationFailed(macAddress: String, error: String)
    case updateStarted(macAddress: String)
    case progressChanged(macAddress: String, progress: Int, stage: String)
    case updateCompleted(macAddress: String)
    case updateFailed(macAddress: String, error: String)
    case updateAborted(macAddress: String)
}

// MARK: - Scan Filters

public struct BandScanFilters: Sendable, Equatable {
    public let brands: Set<BluetoothDeviceBrand>?
    public let types: Set<BluetoothDeviceType>?
    public let serviceTypes: Set<BandServiceType>?

    public init(
        brands: Set<BluetoothDeviceBrand>? = nil,
        types: Set<BluetoothDeviceType>? = nil,
        serviceTypes: Set<BandServiceType>? = nil
    ) {
        self.brands = brands
        self.types = types
        self.serviceTypes = serviceTypes
    }
}

