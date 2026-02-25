import Foundation

public protocol GetSleepDataUseCase: Sendable {
    func execute(
        for deviceId: String,
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int
    ) async throws -> SleepDataResponse
}

