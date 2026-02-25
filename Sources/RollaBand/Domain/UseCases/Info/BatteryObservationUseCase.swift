import Foundation

public protocol BatteryObservationUseCase: Sendable {
    func startObservingBattery(for deviceId: String) async throws -> AsyncStream<BatteryLevelData>
    func stopObservingBattery(for deviceId: String) async throws
}
