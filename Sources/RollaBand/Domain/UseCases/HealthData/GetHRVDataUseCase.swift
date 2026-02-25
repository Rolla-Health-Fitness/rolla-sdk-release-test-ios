import Foundation

public protocol GetHRVDataUseCase: Sendable {
    func execute(
        for deviceId: String,
        lastSyncEntryBaseTimestamp: Int
    ) async throws -> HRVDataResponse
}
