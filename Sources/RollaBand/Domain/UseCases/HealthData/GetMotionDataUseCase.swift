import Foundation

public protocol GetMotionDataUseCase {
    func execute(
        for deviceId: String,
        lastSyncTimestamp: Int
    ) async throws -> MotionDataResponse
}
