import Foundation

public protocol HeartRateObservationUseCase: Sendable {
    func observeHeartRate(for deviceId: String) async throws -> AsyncStream<HeartRateData>
    func stopObservingHeartRate(for deviceId: String) async throws
}
