import Foundation

public protocol GetDeviceBatteryUseCase: Sendable {
    func execute(for deviceId: String) async throws -> Int
}
