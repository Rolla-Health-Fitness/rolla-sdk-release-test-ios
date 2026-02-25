import Foundation

public final class RollaBandGetHRVDataUseCase: GetHRVDataUseCase {
    private let processor: RollaBandDataProcessor
    private let parser: RollaBandHRVDataParser
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager

    public init(
        processor: RollaBandDataProcessor,
        parser: RollaBandHRVDataParser,
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
        lastSyncEntryBaseTimestamp: Int
    ) async throws -> HRVDataResponse {

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }
        
        let allEntries = try await processor.getDetailedData(
            deviceUUID: deviceUUID,
            dataTypeName: "HRV",
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryBaseTimestamp,
            timeout: RollaBandDataConstants.defaultTimeout,
            maxEntriesPerPage: 50 * 16,
            command: GetHRVDataCommand.self,
            parser: parser,
            page: HRVPage.self
        )

        let newestEntryBaseTimestamp = allEntries.map { $0.baseTimestamp }.max() ?? lastSyncEntryBaseTimestamp

        return HRVDataResponse(
            entries: allEntries,
            lastSyncedBaseTimestamp: newestEntryBaseTimestamp
        )
    }
}
