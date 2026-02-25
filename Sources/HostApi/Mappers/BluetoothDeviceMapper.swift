import Foundation

struct BluetoothDeviceMapper {
    static func parseDevices(_ devices: [RollaBandDevice]) -> [BluetoothDevice] {
        return devices.map { parseDevice($0) }
    }

    static func parseDevice(_ device: RollaBandDevice) -> BluetoothDevice {
        return BluetoothDevice(
            name: device.name,
            rssi: device.rssi,
            uuid: device.macAddress,
            capabilities: parseCapabilities(from: device.capabilities),
            connectionState: ConnectionState(device.connectionState),
            deviceType: parseDeviceType(type: device.deviceType)
        )
    }

    static func parseCapabilities(from capabilities: [BandBluetoothCapability]) -> [BluetoothCapabilities] {
        return capabilities.compactMap { capability in
            switch capability {
            case .heartRate:
                return .hr
            case .runningSpeedAndCadence:
                return .rsc
            default:
                return nil
            }
        }
    }

    static func parseDeviceType(type: BluetoothDeviceType) -> DeviceType {
        switch type {
        case .band:
            return .rollaBand
        default:
            return .other
        }
    }
    
    static func parseScanFilters(from deviceTypes: [DeviceType]) -> BandScanFilters {
        var brands: Set<BluetoothDeviceBrand> = []
        var types: Set<BluetoothDeviceType> = []
        var serviceTypes: Set<BandServiceType> = []
        
        for deviceType in deviceTypes {
            switch deviceType {
            case .rollaBand:
                serviceTypes.insert(.rollaBand)
                brands.insert(.rolla)
                types.insert(.band)
            case .other:
                break
            }
        }
        
        return BandScanFilters(
            brands: brands.isEmpty ? nil : brands,
            types: types.isEmpty ? nil : types,
            serviceTypes: serviceTypes.isEmpty ? nil : serviceTypes
        )
    }
    
    static func parseScanDuration(_ durationMs: Int64) -> TimeInterval {
        return TimeInterval(durationMs) / 1000.0
    }
}

extension BluetoothState {
    static func from(_ state: BandBluetoothState) -> BluetoothState {
        switch state {
        case .poweredOn:     return .poweredOn
        case .poweredOff:    return .poweredOff
        case .unauthorized:  return .unauthorized
        case .unsupported:   return .unknown
        case .resetting:     return .resetting
        case .unknown:       return .unknown
        }
    }
}

extension ConnectionState {
    init(_ bandState: BandConnectionState) {
        switch bandState {
        case .discovered, .disconnected, .disconnecting:
            self = .disconnected
        case .connecting:
            self = .connecting
        case .connected:
            self = .connected
        }
    }
}
