import Foundation

protocol StrategyBasedConnectionManaging: Sendable {
    func connect(to device: DiscoveredDevice, timeout: TimeInterval) async throws -> ConnectedDevice
    func disconnect(from device: ConnectedDevice, timeout: TimeInterval) async throws
}
