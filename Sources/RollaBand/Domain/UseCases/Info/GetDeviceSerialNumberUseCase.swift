import Foundation

public protocol GetDeviceSerialNumberUseCase: Sendable {
    func execute(for deviceId: String) async throws -> String?
}

