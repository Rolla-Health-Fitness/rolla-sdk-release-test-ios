import Foundation

public protocol GetDeviceFirmwareUseCase: Sendable {
    func execute(for deviceId: String) async throws -> String?
}
