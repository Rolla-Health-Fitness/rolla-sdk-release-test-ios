import Foundation

public final class RollaBandActivityHeartRateDataParser: RollaBandDataParser {
    typealias Entry = ActivityHeartRateDataEntry
    typealias Block = ActivityHeartRateDataBlock
    typealias ParseError = BLEDataParsingError
    
    static let dataIdentifier: UInt8 = 0x54
    static let entrySize: Int = 24
    
    var dataIdentifier: UInt8 { Self.dataIdentifier }
    var entrySize: Int { Self.entrySize }
    var endMarker: UInt8 { RollaBandDataConstants.endMarker }
    
    let logger: Logging
    private let baseParser: BaseRollaBandDataParser<ActivityHeartRateDataEntry, ActivityHeartRateDataBlock>
    
    public init(logger: Logging) {
        self.logger = logger
        self.baseParser = BaseRollaBandDataParser(
            dataIdentifier: Self.dataIdentifier,
            entrySize: Self.entrySize,
            endMarker: RollaBandDataConstants.endMarker,
            logger: logger,
            entryParser: Self.parseActivityHeartRateEntry,
            blockCreator: Self.createActivityHeartRateBlock
        )
    }
    
    func parseDataBlock(from data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> ActivityHeartRateDataBlock {
        return try baseParser.parseDataBlock(
            from: data,
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp
        )
    }
}

extension RollaBandActivityHeartRateDataParser {
    static func parseActivityHeartRateEntry(
        logger: Logging,
        from entryBytes: [UInt8],
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int
    ) throws -> EntryParseResult<ActivityHeartRateDataEntry> {

        guard entryBytes.count == entrySize else {
            throw BLEDataParsingError.parsingFailed("Entry must be exactly \(entrySize) bytes, got \(entryBytes.count)")
        }

        guard entryBytes[0] == dataIdentifier else {
            throw BLEDataParsingError.parsingFailed(
                "Entry must start with 0x\(String(format: "%02X", dataIdentifier)), got 0x\(String(format: "%02X", entryBytes[0]))"
            )
        }

        let hexString = entryBytes.map { String(format: "%02X", $0) }.joined(separator: " ")
        logger.info("RAW: \(hexString)", category: .healthDataSync)
        
        
        guard let dataNumber = entryBytes.uint16LE(at: 1) else {
            throw BLEDataParsingError.parsingFailed("Failed to parse data number")
        }
        
        let baseTimestamp = try BaseRollaBandDataParser<ActivityHeartRateDataEntry, ActivityHeartRateDataBlock>.parseTimestampFromBCD(
            from: entryBytes,
            startIndex: 3
        )
        
        guard baseTimestamp >= lastSyncEntryBaseTimestamp else {
            return .filtered(dataNumber: Int(dataNumber), baseTimestamp: baseTimestamp)
        }
        
        let heartRateValues = Array(entryBytes[9..<21])
        
        var heartRateMinutes: [HeartRate] = []
        for (minuteIndex, heartRateValue) in heartRateValues.enumerated() {
            let minuteTimestampMillis = baseTimestamp + (minuteIndex * 60 * 1000)
            
            // Drop 0xFF (255): firmware end-of-activity sentinel, not a real BPM (QA-207).
            guard heartRateValue > 0, heartRateValue != 255, minuteTimestampMillis > lastSyncEntryTimestamp else {
                continue
            }

            heartRateMinutes.append(HeartRate(
                timestamp: minuteTimestampMillis,
                value: Int(heartRateValue)
            ))
        }
        
        //  just for debugging
        let date = Date(timeIntervalSince1970: TimeInterval(baseTimestamp / 1000))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = formatter.string(from: date)

        let heartRateValuesString = heartRateValues.map { String($0) }.joined(separator: ", ")
        logger.info("PARSED: ID=\(dataNumber), Time=\(dateString) UTC, HeartRates=[\(heartRateValuesString)]", category: .healthDataSync)
        
        return .success(ActivityHeartRateDataEntry(
            dataNumber: Int(dataNumber),
            baseTimestamp: baseTimestamp,
            heartRates: heartRateMinutes
        ))
    }
    
    static func createActivityHeartRateBlock(
        entries: [ActivityHeartRateDataEntry],
        totalEntriesCount: Int,
        oldestEntryTimestamp: Int?,
        hasReachedEndMarker: Bool
    ) -> ActivityHeartRateDataBlock {
        return ActivityHeartRateDataBlock(
            entries: entries,
            totalEntriesCount: totalEntriesCount,
            oldestEntryTimestamp: oldestEntryTimestamp,
            hasReachedEndMarker: hasReachedEndMarker
        )
    }
}
