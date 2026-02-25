import Foundation

public final class RollaBandGetMotionDataUseCase: GetMotionDataUseCase {
    private let processor: RollaBandDataProcessor
    private let parser: RollaBandMotionDataParser
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager

    public init(
        processor: RollaBandDataProcessor,
        parser: RollaBandMotionDataParser,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager
    ) {
        self.processor = processor
        self.parser = parser
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
    }

    public func execute(
        for deviceId: String,
        lastSyncTimestamp: Int
    ) async throws -> MotionDataResponse {

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let allEntries = try await processor.getDetailedData(
            deviceUUID: deviceUUID,
            dataTypeName: "Motion",
            lastSyncEntryBaseTimestamp: lastSyncTimestamp,
            lastSyncEntryTimestamp: lastSyncTimestamp,
            timeout: RollaBandDataConstants.defaultTimeout,
            maxEntriesPerPage: 50 * 17,
            command: GetMotionDataCommand.self,
            parser: parser,
            page: MotionDataPage.self
        )

        let allMotionPoints = allEntries.flatMap { $0.motionPoints }

        print("[Motion] Total motion points synced: \(allMotionPoints.count) entries")

        return MotionDataResponse(motionPoints: allMotionPoints)
    }
}

