import Foundation

public protocol UnpairRollaBandUseCase: Sendable {
    func execute(deviceUUID: BLEDeviceIdentifier) async
}

