import Foundation

public final class RollaBandGetMotionDataUseCase: GetMotionDataUseCase {
    private let processor: RollaBandDataProcessor
    private let legacyParser: RollaBandMotionDataParser
    private let secondLevelParser: RollaBandMotionSecondLevelDataParser
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager

    public init(
        processor: RollaBandDataProcessor,
        legacyParser: RollaBandMotionDataParser,
        secondLevelParser: RollaBandMotionSecondLevelDataParser,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager
    ) {
        self.processor = processor
        self.legacyParser = legacyParser
        self.secondLevelParser = secondLevelParser
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
    }

    public func execute(
        for deviceId: String,
        lastSyncTimestamp: Int,
        firmwareVersion: String?
    ) async throws -> MotionDataResponse {

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let useSecondLevel = RollaBandMotionSecondLevelFirmware.isSupported(firmwareVersion: firmwareVersion)

        let allEntries: [MotionDataEntry]
        if useSecondLevel {
            allEntries = try await processor.getDetailedData(
                deviceUUID: deviceUUID,
                dataTypeName: "Motion",
                lastSyncEntryBaseTimestamp: lastSyncTimestamp,
                lastSyncEntryTimestamp: lastSyncTimestamp,
                timeout: RollaBandDataConstants.defaultTimeout,
                maxEntriesPerPage: 50 * 16,
                command: GetMotionSecondLevelDataCommand.self,
                parser: secondLevelParser,
                page: MotionDataPage.self
            )
        } else {
            allEntries = try await processor.getDetailedData(
                deviceUUID: deviceUUID,
                dataTypeName: "Motion",
                lastSyncEntryBaseTimestamp: lastSyncTimestamp,
                lastSyncEntryTimestamp: lastSyncTimestamp,
                timeout: RollaBandDataConstants.defaultTimeout,
                maxEntriesPerPage: 50 * 17,
                command: GetMotionDataCommand.self,
                parser: legacyParser,
                page: MotionDataPage.self
            )
        }

        let allMotionPoints = allEntries.flatMap { $0.motionPoints }


        return MotionDataResponse(motionPoints: allMotionPoints)
    }
}

