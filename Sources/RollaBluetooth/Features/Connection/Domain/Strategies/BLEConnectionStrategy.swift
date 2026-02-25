import Foundation

public protocol BLEConnectionStrategy: Sendable {
    var deviceType: BLEDeviceType { get }
    var deviceBrand: DeviceBrand? { get }
    
    func connect(to device: DiscoveredDevice, timeout: TimeInterval) async throws
    func postConnectionSetup(for device: DiscoveredDevice, timeout: TimeInterval) async throws -> ConnectedDevice
    func disconnect(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws
    func preDisconnectionCleanup(for device: ConnectedDevice, timeout: TimeInterval) async throws
}

public extension BLEConnectionStrategy {
    var deviceBrand: DeviceBrand? { nil }
    func preDisconnectionCleanup(for device: ConnectedDevice, timeout: TimeInterval) async throws {
        
    }
}
