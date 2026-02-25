import Foundation

public protocol ChargingStateObservationUseCase: Sendable {
    func observeChargingState(for deviceId: String) async throws -> AsyncStream<ChargingStateData>
    func stopObservingChargingState(for deviceId: String) async throws
}
