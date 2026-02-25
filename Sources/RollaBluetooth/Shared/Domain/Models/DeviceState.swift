import Foundation

public enum DeviceState: Sendable, Equatable {
    case discovered(DiscoveredDevice)
    case connecting(DiscoveredDevice)
    case connected(ConnectedDevice)
    case disconnecting(ConnectedDevice)
    case disconnected(DiscoveredDevice)
    
    public var deviceId: BLEDeviceIdentifier {
        switch self {
        case .discovered(let device), .connecting(let device), .disconnected(let device):
            return device.id
        case .connected(let device), .disconnecting(let device):
            return device.id
        }
    }
    
    public var name: String? {
        switch self {
        case .discovered(let device), .connecting(let device), .disconnected(let device):
            return device.name
        case .connected(let device), .disconnecting(let device):
            return device.name
        }
    }

    public var canConnect: Bool {
        switch self {
        case .discovered, .disconnected:
            return true
        case .connecting, .connected, .disconnecting:
            return false
        }
    }
    
    public var isDisconnected: Bool {
        switch self {
        case .disconnected:
            return true
        default:
            return false
        }
    }

    public var discoveredDevice: DiscoveredDevice? {
        switch self {
        case .discovered(let device), .connecting(let device), .disconnected(let device):
            return device
        case .connected, .disconnecting:
            return nil
        }
    }

    public var connectedDevice: ConnectedDevice? {
        switch self {
        case .connected(let device), .disconnecting(let device):
            return device
        case .discovered, .connecting, .disconnected:
            return nil
        }
    }
}

extension DeviceState: CustomStringConvertible {
    public var description: String {
        switch self {
        case .discovered:
            return "discovered"
        case .connecting:
            return "connecting"
        case .connected:
            return "connected"
        case .disconnecting:
            return "disconnecting"
        case .disconnected:
            return "disconnected"
        }
    }
}
