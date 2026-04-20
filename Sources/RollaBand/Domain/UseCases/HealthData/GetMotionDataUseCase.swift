import Foundation

public protocol GetMotionDataUseCase {
    func execute(
        for deviceId: String,
        lastSyncTimestamp: Int,
        firmwareVersion: String?
    ) async throws -> MotionDataResponse
}
