import Foundation

public protocol DeviceIdentityManaging: Sendable {
    func registerDevice(mac: String, appleUUID: UUID, name: String?, brand: DeviceBrand, type: BLEDeviceType) async
    func getAppleUUID(for mac: String) async -> UUID?
    func getMAC(for appleUUID: UUID) async -> String?
    func isDevicePaired(mac: String) async -> Bool
    func isDevicePaired(appleUUID: UUID) async -> Bool
    func resolveDeviceIdentifier(_ identifier: String) async -> BLEDeviceIdentifier?
    func getPairedDevice(mac: String) async -> PairedDevice?
    func getPairedDevice(identifier: String) async -> PairedDevice?
    func removeDevice(identifier: BLEDeviceIdentifier) async
    func removeAllDevices() async
}

