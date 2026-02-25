import Foundation

protocol GetDeviceStateUseCase: Sendable {
    func execute(deviceUUID: BLEDeviceIdentifier) async -> DeviceState?
}

