import Foundation

public protocol DisconnectRollaBandUseCase: Sendable {
    func execute(identifier: String, timeout: TimeInterval) async throws -> BLEDeviceIdentifier
}

