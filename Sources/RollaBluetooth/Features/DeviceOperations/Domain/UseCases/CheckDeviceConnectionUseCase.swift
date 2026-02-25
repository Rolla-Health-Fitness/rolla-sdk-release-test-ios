import Foundation

protocol CheckDeviceConnectionUseCase: Sendable {
    func execute(deviceUUID: BLEDeviceIdentifier) async -> Bool
}

