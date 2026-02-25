import Foundation

extension BluetoothDeviceBrand {
    init(_ bleBrand: DeviceBrand) {
        switch bleBrand {
        case .rolla: self = .rolla
        case .wahoo: self = .wahoo
        case .garmin: self = .garmin
        case .tacx: self = .tacx
        case .polar: self = .polar
        case .suunto: self = .suunto
        case .apple: self = .apple
        case .unknown: self = .unknown
        case .custom(let name): self = .custom(name)
        }
    }

    var toDeviceBrand: DeviceBrand {
        switch self {
        case .rolla: return .rolla
        case .wahoo: return .wahoo
        case .garmin: return .garmin
        case .tacx: return .tacx
        case .polar: return .polar
        case .suunto: return .suunto
        case .apple: return .apple
        case .unknown: return .unknown
        case .custom(let name): return .custom(name)
        }
    }
}

extension BluetoothDeviceType {
    init(_ bleType: BLEDeviceType) {
        switch bleType {
        case .heartRateSensor: self = .heartRateSensor
        case .footPod: self = .footPod
        case .bikeTrainer: self = .bikeTrainer
        case .band: self = .band
        case .watch: self = .watch
        case .rscSensor: self = .rscSensor
        case .speedSensor: self = .speedSensor
        case .powerMeter: self = .powerMeter
        case .unknown: self = .unknown
        case .custom(let type): self = .custom(type)
        }
    }

    var toBLEDeviceType: BLEDeviceType {
        switch self {
        case .heartRateSensor: return .heartRateSensor
        case .footPod: return .footPod
        case .bikeTrainer: return .bikeTrainer
        case .band: return .band
        case .watch: return .watch
        case .rscSensor: return .rscSensor
        case .speedSensor: return .speedSensor
        case .powerMeter: return .powerMeter
        case .unknown: return .unknown
        case .custom(let type): return .custom(type)
        }
    }
}

extension BandNormalizedUUID {
    init(_ bleUUID: NormalizedUUID) {
        self.init(stringIdentifier: bleUUID.uuidString)
    }

    var toNormalizedUUID: NormalizedUUID {
        return NormalizedUUID(stringIdentifier: self.uuidString)
    }
}

extension BandServiceType {
    init(_ bleServiceType: BLEServiceType) {
        let uuid = BandNormalizedUUID(bleServiceType.uuid)
        self = BandServiceType.from(uuid: uuid)
    }
}

extension BandService {
    init(_ bleService: BLEService) {
        self.init(
            uuid: BandNormalizedUUID(bleService.uuid),
            isPrimary: bleService.isPrimary
        )
    }
}

extension BandDiscoveredDevice {
    init?(_ bleDevice: DiscoveredDevice) {
        guard let macAddress = bleDevice.macAddress, !macAddress.isEmpty else {
            return nil
        }
        self.init(
            macAddress: macAddress,
            name: bleDevice.name,
            rssi: bleDevice.rssi,
            brand: BluetoothDeviceBrand(bleDevice.brand),
            type: BluetoothDeviceType(bleDevice.type),
            advertisedServices: bleDevice.advertisedServices.map { BandNormalizedUUID($0) },
            manufacturerData: bleDevice.manufacturerData,
            timestamp: bleDevice.timestamp
        )
    }
}

extension BandConnectedDevice {
    init?(_ bleDevice: ConnectedDevice) {
        guard let macAddress = bleDevice.macAddress, !macAddress.isEmpty else {
            return nil
        }
        self.init(
            macAddress: macAddress,
            name: bleDevice.name,
            advertisedServices: bleDevice.advertisedServices?.map { BandNormalizedUUID($0) },
            services: bleDevice.services.map { BandService($0) },
            deviceType: BluetoothDeviceType(bleDevice.deviceType),
            brand: BluetoothDeviceBrand(bleDevice.brand)
        )
    }
}

extension RollaBandDevice {
    init?(_ bleState: DeviceState) {
        let macAddress: String?
        switch bleState {
        case .discovered(let device), .connecting(let device), .disconnected(let device):
            macAddress = device.macAddress
        case .connected(let device), .disconnecting(let device):
            macAddress = device.macAddress
        }

        guard let mac = macAddress, !mac.isEmpty else {
            return nil
        }

        let name: String
        switch bleState {
        case .discovered(let device), .connecting(let device), .disconnected(let device):
            name = device.name ?? "Unknown Device"
        case .connected(let device), .disconnecting(let device):
            name = device.name ?? "Unknown Device"
        }

        let rssi: Int
        switch bleState {
        case .discovered(let device), .connecting(let device), .disconnected(let device):
            rssi = device.rssi
        case .connected, .disconnecting:
            rssi = 0
        }

        let capabilities: [BandBluetoothCapability]
        switch bleState {
        case .discovered(let device), .connecting(let device), .disconnected(let device):
            capabilities = device.advertisedServices.compactMap { uuid in
                let serviceType = BLEServiceType.from(uuid: uuid)
                let bandServiceType = BandServiceType(serviceType)
                return BandBluetoothCapability(bandServiceType)
            }
        case .connected(let device), .disconnecting(let device):
            capabilities = device.services.compactMap { service in
                let serviceType = BLEServiceType.from(uuid: service.uuid)
                let bandServiceType = BandServiceType(serviceType)
                return BandBluetoothCapability(bandServiceType)
            }
        }

        let connectionState: BandConnectionState
        switch bleState {
        case .discovered:
            connectionState = .discovered
        case .connecting:
            connectionState = .connecting
        case .connected:
            connectionState = .connected
        case .disconnecting:
            connectionState = .disconnecting
        case .disconnected:
            connectionState = .disconnected
        }

        let deviceType: BluetoothDeviceType
        switch bleState {
        case .discovered(let device), .connecting(let device), .disconnected(let device):
            deviceType = BluetoothDeviceType(device.type)
        case .connected(let device), .disconnecting(let device):
            deviceType = BluetoothDeviceType(device.deviceType)
        }

        self.init(
            name: name,
            rssi: Int64(rssi),
            macAddress: mac,
            capabilities: capabilities,
            connectionState: connectionState,
            deviceType: deviceType
        )
    }
}

extension BandScanFilters {
    var toScanFilters: ScanFilters {
        let bleBrands: Set<DeviceBrand>? = brands.map { Set($0.map { $0.toDeviceBrand }) }
        let bleTypes: Set<BLEDeviceType>? = types.map { Set($0.map { $0.toBLEDeviceType }) }
        let bleServiceTypes: Set<BLEServiceType>? = serviceTypes.map { Set($0.map { BLEServiceType.from(uuid: $0.uuid.toNormalizedUUID) }) }

        return ScanFilters(
            brands: bleBrands,
            types: bleTypes,
            serviceTypes: bleServiceTypes
        )
    }
}

extension BandFirmwareUpdateEvent {
    init?(_ bleEvent: FirmwareUpdateEvent, macAddress: String?) {
        guard let mac = macAddress, !mac.isEmpty else {
            return nil
        }
        switch bleEvent {
        case .preparationStarted:
            self = .preparationStarted(macAddress: mac)
        case .preparationCompleted:
            self = .preparationCompleted(macAddress: mac)
        case .preparationFailed(_, let error):
            self = .preparationFailed(macAddress: mac, error: error)
        case .updateStarted:
            self = .updateStarted(macAddress: mac)
        case .progressChanged(_, let progress, let stage):
            self = .progressChanged(macAddress: mac, progress: progress, stage: stage)
        case .updateCompleted:
            self = .updateCompleted(macAddress: mac)
        case .updateFailed(_, let error):
            self = .updateFailed(macAddress: mac, error: error)
        case .updateAborted:
            self = .updateAborted(macAddress: mac)
        }
    }
}

extension BandBluetoothState {
    init(_ bleState: CBBluetoothState) {
        switch bleState {
        case .unknown:      self = .unknown
        case .resetting:    self = .resetting
        case .unsupported:  self = .unsupported
        case .unauthorized: self = .unauthorized
        case .poweredOff:   self = .poweredOff
        case .poweredOn:    self = .poweredOn
        }
    }
}
