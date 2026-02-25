import Foundation

public protocol GetDeviceConnectionStateUseCase: Sendable {
    func getDeviceState(deviceId: BLEDeviceIdentifier) async throws -> DeviceState
}

