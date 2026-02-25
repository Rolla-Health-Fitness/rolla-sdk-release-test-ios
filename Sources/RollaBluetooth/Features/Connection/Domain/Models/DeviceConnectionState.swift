import Foundation

public enum DeviceConnectionState: Sendable, CaseIterable {
    case unknown
    case disconnected
    case connecting
    case connected
    case disconnecting
}
