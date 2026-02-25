import Foundation

protocol BluetoothDevicesUseCase: Sendable {
    func getAllDevicesWithStates() async -> [DeviceState]
    func allDevicesStream() async -> AsyncStream<[DeviceState]>
    func getDeviceState(for deviceId: BLEDeviceIdentifier) async -> DeviceState?
}
