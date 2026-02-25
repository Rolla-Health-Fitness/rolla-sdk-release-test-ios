import Foundation

public final class RollaBandGetHeartRateDataUseCase: GetHeartRateDataUseCase {
    private let processor: RollaBandDataProcessor
    private let parser: RollaBandHeartRateDataParser
    private let activityParser: RollaBandActivityHeartRateDataParser
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager

    public init(
        processor: RollaBandDataProcessor,
        parser: RollaBandHeartRateDataParser,
        activityParser: RollaBandActivityHeartRateDataParser,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager
    ) {
        self.processor = processor
        self.parser = parser
        self.activityParser = activityParser
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
    }

    public func execute(
        for deviceId: String,
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int,
        passiveLastSyncedBaseTimestamp: Int
    ) async throws -> HeartRateDataResponse {

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let allSingleEntries = try await processor.getDetailedData(
            deviceUUID: deviceUUID,
            dataTypeName: "HeartRate",
            lastSyncEntryBaseTimestamp: passiveLastSyncedBaseTimestamp,
            lastSyncEntryTimestamp: passiveLastSyncedBaseTimestamp,
            timeout: RollaBandDataConstants.defaultTimeout,
            maxEntriesPerPage: 50 * 24,
            command: GetHeartRateDataCommand.self,
            parser: parser,
            page: HeartRatePage.self
        )
        
        let allActivityEntries = try await processor.getDetailedData(
            deviceUUID: deviceUUID,
            dataTypeName: "ActivityHeartRate",
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp,
            timeout: RollaBandDataConstants.defaultTimeout,
            maxEntriesPerPage: 50 * 10,
            command: GetHeartRateDataInActivityCommand.self,
            parser: activityParser,
            page: ActivityHeartRatePage.self
        )
        
        let singleHeartRates: [HeartRate] = allSingleEntries.map { entry in
            HeartRate(timestamp: entry.baseTimestamp, value: entry.heartRate)
        }

        let activityHeartRates: [HeartRate] = allActivityEntries.flatMap { $0.heartRates }

        let allHeartRates = singleHeartRates + activityHeartRates

        let allSingleBaseTimestamps = allSingleEntries.map { $0.baseTimestamp }
        let allActivityBaseTimestamps = allActivityEntries.map { $0.baseTimestamp }

        let passiveLastSyncedBaseTimestamp = allSingleBaseTimestamps.max() ?? passiveLastSyncedBaseTimestamp
        let activityLastSyncedBaseTimestamp = allActivityBaseTimestamps.max() ?? lastSyncEntryBaseTimestamp
        let activityLastSyncedEntryTimestamp = activityHeartRates.map { $0.timestamp }.max() ?? lastSyncEntryTimestamp
       
        return HeartRateDataResponse(
            entries: allHeartRates,
            activityLastSyncedBaseTimestamp: activityLastSyncedBaseTimestamp,
            activityLastSyncedEntryTimestamp: activityLastSyncedEntryTimestamp,
            passiveLastSyncedBaseTimestamp: passiveLastSyncedBaseTimestamp
        )
    }
}
