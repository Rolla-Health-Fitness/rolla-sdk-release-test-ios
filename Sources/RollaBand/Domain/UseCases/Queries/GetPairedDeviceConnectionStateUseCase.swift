import Foundation

public protocol GetPairedDeviceConnectionStateUseCase: Sendable {
    func execute(identifier: String) async throws -> DeviceState
}

