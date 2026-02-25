import Foundation

public final class RollaBandHeartRateDataParser: RollaBandDataParser {
    typealias Entry = HeartRateDataEntry
    typealias Block = HeartRateDataBlock
    typealias ParseError = BLEDataParsingError
    
    static let dataIdentifier: UInt8 = 0x55
    static let entrySize: Int = 10
    
    var dataIdentifier: UInt8 { Self.dataIdentifier }
    var entrySize: Int { Self.entrySize }
    var endMarker: UInt8 { RollaBandDataConstants.endMarker }
    
    let logger: Logging
    private let baseParser: BaseRollaBandDataParser<HeartRateDataEntry, HeartRateDataBlock>
    
    public init(logger: Logging) {
        self.logger = logger
        self.baseParser = BaseRollaBandDataParser(
            dataIdentifier: Self.dataIdentifier,
            entrySize: Self.entrySize,
            endMarker: RollaBandDataConstants.endMarker,
            logger: logger,
            entryParser: Self.parseHeartRateEntry,
            blockCreator: Self.createHeartRateBlock
        )
    }
    
    func parseDataBlock(from data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> HeartRateDataBlock {
        return try baseParser.parseDataBlock(
            from: data,
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp
        )
    }
}

extension RollaBandHeartRateDataParser {
    static func parseHeartRateEntry(
        logger: Logging,
        from entryBytes: [UInt8],
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int
    ) throws -> EntryParseResult<HeartRateDataEntry> {
        guard entryBytes.count == RollaBandHeartRateDataParser.entrySize else {
            throw BLEDataParsingError.parsingFailed("Entry must be exactly \(RollaBandHeartRateDataParser.entrySize) bytes, got \(entryBytes.count)")
        }

        guard entryBytes[0] == RollaBandHeartRateDataParser.dataIdentifier else {
            throw BLEDataParsingError.parsingFailed("Entry must start with 0x\(String(format: "%02X", RollaBandHeartRateDataParser.dataIdentifier)), got 0x\(String(format: "%02X", entryBytes[0]))")
        }

        let hexString = entryBytes.map { String(format: "%02X", $0) }.joined(separator: " ")
        logger.info("RAW: \(hexString)", category: .healthDataSync)
        
        
        guard let dataNumber = entryBytes.uint16LE(at: 1) else {
            throw BLEDataParsingError.parsingFailed("Failed to parse data number")
        }
        
        let baseTimestamp = try BaseRollaBandDataParser<HeartRateDataEntry, HeartRateDataBlock>.parseTimestampFromBCD(
            from: entryBytes,
            startIndex: 3
        )
        
        guard baseTimestamp > lastSyncEntryBaseTimestamp else {
            return .filtered(dataNumber: Int(dataNumber), baseTimestamp: baseTimestamp)
        }
        
        let heartRate = Int(entryBytes[9])
        
        // just for debugging
        let date = Date(timeIntervalSince1970: TimeInterval(baseTimestamp / 1000))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = formatter.string(from: date)
        
        logger.info("PARSED: ID=\(dataNumber), Time=\(dateString) UTC, HeartRate=\(heartRate)", category: .healthDataSync)
        
        return .success(HeartRateDataEntry(
            dataNumber: Int(dataNumber),
            baseTimestamp: baseTimestamp,
            heartRate: heartRate
        ))
    }
    
    static func createHeartRateBlock(
        entries: [HeartRateDataEntry],
        totalEntriesCount: Int,
        oldestEntryTimestamp: Int?,
        hasReachedEndMarker: Bool
    ) -> HeartRateDataBlock {
        return HeartRateDataBlock(
            entries: entries,
            totalEntriesCount: totalEntriesCount,
            oldestEntryTimestamp: oldestEntryTimestamp,
            hasReachedEndMarker: hasReachedEndMarker
        )
    }
}
