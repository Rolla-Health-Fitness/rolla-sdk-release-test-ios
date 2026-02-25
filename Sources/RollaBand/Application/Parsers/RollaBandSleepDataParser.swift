import Foundation

public final class RollaBandSleepDataParser: RollaBandDataParser, Sendable {
    typealias Entry = SleepDataEntry
    typealias Block = SleepDataBlock
    typealias ParseError = BLEDataParsingError
    
    static let dataIdentifier: UInt8 = 0x53
    static let entrySize: Int = 130
    
    var dataIdentifier: UInt8 { Self.dataIdentifier }
    var entrySize: Int { Self.entrySize }
    var endMarker: UInt8 { RollaBandDataConstants.endMarker }
    
    let logger: Logging
    private let baseParser: BaseRollaBandDataParser<SleepDataEntry, SleepDataBlock>

    public init(logger: Logging) {
        self.logger = logger
        self.baseParser = BaseRollaBandDataParser(
            dataIdentifier: Self.dataIdentifier,
            entrySize: Self.entrySize,
            endMarker: RollaBandDataConstants.endMarker,
            logger: logger,
            entryParser: Self.parseSleepEntry,
            blockCreator: Self.createSleepBlock
        )
    }
    
    func parseDataBlock(from data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> SleepDataBlock {
        return try baseParser.parseDataBlock(
            from: data,
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp
        )
    }
}

extension RollaBandSleepDataParser {
    static func parseSleepEntry(logger: Logging, from entryBytes: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> EntryParseResult<SleepDataEntry> {
        guard entryBytes.count == entrySize else {
            throw BLEDataParsingError.parsingFailed("Entry must be exactly \(entrySize) bytes, got \(entryBytes.count)")
        }
        
        guard entryBytes[0] == dataIdentifier else {
            throw BLEDataParsingError.parsingFailed("Entry must start with 0x\(String(format: "%02X", dataIdentifier)), got 0x\(String(format: "%02X", entryBytes[0]))")
        }
        
        let hexString = entryBytes.map { String(format: "%02X", $0) }.joined(separator: " ")
        logger.info("RAW: \(hexString)", category: .healthDataSync)
        
        
        guard let dataNumber = entryBytes.uint16LE(at: 1) else {
            throw BLEDataParsingError.parsingFailed("Failed to parse data number")
        }
        
        let baseTimestamp = try BaseRollaBandDataParser<SleepDataEntry, SleepDataBlock>.parseTimestampFromBCD(
            from: entryBytes,
            startIndex: 3
        )
        
        guard baseTimestamp >= lastSyncEntryBaseTimestamp else {
            return .filtered(dataNumber: Int(dataNumber), baseTimestamp: baseTimestamp)
        }
        
        let sleepLength = Int(entryBytes[9])
        let sleepDataStartIndex = 10
        let sleepDataEndIndex = min(sleepDataStartIndex + sleepLength, entryBytes.count)
        let sleepDataBytes = Array(entryBytes[sleepDataStartIndex..<sleepDataEndIndex])
        
        var sleepStages: [SleepStage] = []
        for (minuteIndex, sleepStageByte) in sleepDataBytes.enumerated() {
            let timestampMillis = baseTimestamp + (minuteIndex * 60 * 1000)

            guard timestampMillis > lastSyncEntryTimestamp else {
                continue
            }

            sleepStages.append(SleepStage(
                timestamp: timestampMillis,
                value: SleepStageValue.from(sleepStageByte)
            ))
        }
        
        let date = Date(timeIntervalSince1970: TimeInterval(baseTimestamp / 1000))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = formatter.string(from: date)
        
        let sleepQualitiesString = sleepDataBytes.prefix(10).map { SleepStageValue.from($0).rawValue }.joined(separator: ", ")
        logger.info("PARSED: ID=\(dataNumber), Time=\(dateString) UTC, Length=\(sleepLength), Sleep=[\(sleepQualitiesString)...]", category: .healthDataSync)
        
        return .success(SleepDataEntry(
            dataNumber: Int(dataNumber),
            baseTimestamp: baseTimestamp,
            sleepLength: sleepLength,
            sleepStages: sleepStages
        ))
    }
    
    static func createSleepBlock(
        entries: [SleepDataEntry],
        totalEntriesCount: Int,
        oldestEntryTimestamp: Int?,
        hasReachedEndMarker: Bool
    ) -> SleepDataBlock {
        return SleepDataBlock(
            entries: entries,
            totalEntriesCount: totalEntriesCount,
            oldestEntryTimestamp: oldestEntryTimestamp,
            hasReachedEndMarker: hasReachedEndMarker
        )
    }
}
