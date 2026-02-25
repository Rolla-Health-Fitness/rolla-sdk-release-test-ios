import Foundation

protocol RemoveDeviceUseCase: Sendable {
    func execute(deviceUUID: BLEDeviceIdentifier) async
}

