import Foundation

public protocol RunningSpeedCadenceObservationUseCase: Sendable {
    func observeRSC(for deviceId: String) async throws -> AsyncStream<RunningSpeedCadenceData>
    func stopObservingRSC(for deviceId: String) async throws
}

