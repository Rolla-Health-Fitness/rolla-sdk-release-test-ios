import Foundation

public final class RollaBandGetSleepDataUseCase: GetSleepDataUseCase {
    private let processor: RollaBandDataProcessor
    private let parser: RollaBandSleepDataParser
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager

    public init(
        processor: RollaBandDataProcessor,
        parser: RollaBandSleepDataParser,
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
    ) async throws -> SleepDataResponse {

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let allEntries = try await processor.getDetailedData(
            deviceUUID: deviceUUID,
            dataTypeName: "Sleep",
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp,
            timeout: RollaBandDataConstants.defaultTimeout,
            maxEntriesPerPage: 50,
            command: GetSleepDataCommand.self,
            parser: parser,
            page: SleepPage.self
        )
        
        let allSleepStages = allEntries.flatMap { $0.sleepStages }
        
        let consolidatedStages = consolidateAllSleepStages(allSleepStages)
        
        let newestEntryBaseTimestamp = allEntries.map { $0.baseTimestamp }.max() ?? lastSyncEntryBaseTimestamp
        let newestEntryTimestamp = consolidatedStages.map { $0.endTimestamp }.max() ?? lastSyncEntryTimestamp
        
        return SleepDataResponse(
            entries: consolidatedStages,
            lastSyncedEntryTimestamp: newestEntryTimestamp,
            lastSyncedBaseTimestamp: newestEntryBaseTimestamp
        )
    }
    
    private func consolidateAllSleepStages(_ sleepStages: [SleepStage]) -> [ConsolidatedSleepStage] {
        guard !sleepStages.isEmpty else { return [] }
        
        let sortedStages = sleepStages.sorted { $0.timestamp < $1.timestamp }
        var consolidatedStages: [ConsolidatedSleepStage] = []
        
        var currentStage = sortedStages[0]
        var stageStartTimestamp = currentStage.timestamp
        
        for i in 1..<sortedStages.count {
            let nextStage = sortedStages[i]
            let timeBetween = nextStage.timestamp - currentStage.timestamp
            let shouldEndStage = nextStage.value != currentStage.value || timeBetween > 60000
            
            if shouldEndStage {
                consolidatedStages.append(ConsolidatedSleepStage(
                    startTimestamp: stageStartTimestamp,
                    endTimestamp: currentStage.timestamp + 60000,
                    value: currentStage.value
                ))
                
                stageStartTimestamp = nextStage.timestamp
            }
            
            currentStage = nextStage
        }
        
        consolidatedStages.append(ConsolidatedSleepStage(
            startTimestamp: stageStartTimestamp,
            endTimestamp: currentStage.timestamp + 60000,
            value: currentStage.value
        ))
        
        return consolidatedStages
    }
}
