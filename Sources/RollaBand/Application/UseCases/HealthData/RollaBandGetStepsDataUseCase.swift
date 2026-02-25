import Foundation

public final class RollaBandGetStepsDataUseCase: GetStepsDataUseCase {
    private let processor: RollaBandDataProcessor
    private let parser: RollaBandStepsDataParser
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager

    public init(
        processor: RollaBandDataProcessor,
        parser: RollaBandStepsDataParser,
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
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int
    ) async throws -> StepsDataResponse {

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let allEntries = try await processor.getDetailedData(
            deviceUUID: deviceUUID,
            dataTypeName: "Steps",
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp,
            timeout: RollaBandDataConstants.defaultTimeout,
            maxEntriesPerPage: 50 * 9,
            command: GetStepsDataCommand.self,
            parser: parser,
            page: StepsDataPage.self
        )
        
        let allSteps = allEntries.flatMap { $0.steps }
        let newestEntryBaseTimestamp = allEntries.map { $0.baseTimestamp }.max() ?? lastSyncEntryBaseTimestamp
        let newestEntryTimestamp = allSteps.map { $0.timestamp }.max() ?? lastSyncEntryTimestamp

        let totalSteps = allSteps.reduce(0) { $0 + $1.steps }
        print("[Steps] Total steps synced: \(totalSteps) from \(allSteps.count) entries")

        return StepsDataResponse(
            steps: allSteps,
            lastSyncedBaseTimestamp: newestEntryBaseTimestamp,
            lastSyncedEntryTimestamp: newestEntryTimestamp
        )
    }
}
