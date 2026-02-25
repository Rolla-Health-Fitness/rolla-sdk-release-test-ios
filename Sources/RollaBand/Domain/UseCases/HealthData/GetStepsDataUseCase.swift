import Foundation

public protocol GetStepsDataUseCase: Sendable {
    func execute(
        for deviceId: String,
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int
    ) async throws -> StepsDataResponse
}
