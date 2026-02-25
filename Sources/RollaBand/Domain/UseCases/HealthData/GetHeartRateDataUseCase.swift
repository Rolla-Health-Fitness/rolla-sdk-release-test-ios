import Foundation

public protocol GetHeartRateDataUseCase: Sendable {
    func execute(
        for deviceId: String,
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int,
        passiveLastSyncedBaseTimestamp: Int
    ) async throws -> HeartRateDataResponse
}
