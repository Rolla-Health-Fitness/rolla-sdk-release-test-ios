import Foundation

public final class RollaBandHRVDataParser: RollaBandDataParser, Sendable {
    typealias Entry = HRVDataEntry
    typealias Block = HRVDataBlock
    typealias ParseError = BLEDataParsingError
    
    static let dataIdentifier: UInt8 = 0x56
    static let entrySize: Int = 15
    
    var dataIdentifier: UInt8 { Self.dataIdentifier }
    var entrySize: Int { Self.entrySize }
    var endMarker: UInt8 { RollaBandDataConstants.endMarker }
    
    let logger: Logging
    private let baseParser: BaseRollaBandDataParser<HRVDataEntry, HRVDataBlock>

    public init(logger: Logging) {
        self.logger = logger
        self.baseParser = BaseRollaBandDataParser(
            dataIdentifier: Self.dataIdentifier,
            entrySize: Self.entrySize,
            endMarker: RollaBandDataConstants.endMarker,
            logger: logger,
            entryParser: Self.parseHRVEntry,
            blockCreator: Self.createHRVBlock
        )
    }
    
    func parseDataBlock(from data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> HRVDataBlock {
        return try baseParser.parseDataBlock(
            from: data,
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp
        )
    }
}

extension RollaBandHRVDataParser {
    static func parseHRVEntry(logger: Logging, from entryBytes: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> EntryParseResult<HRVDataEntry> {
        guard entryBytes.count == entrySize else{
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
        
        let baseTimestamp = try BaseRollaBandDataParser<HRVDataEntry, HRVDataBlock>.parseTimestampFromBCD(
            from: entryBytes,
            startIndex: 3
        )
        
        let hrvValue = Int(entryBytes[9])
        
        guard baseTimestamp > lastSyncEntryBaseTimestamp else {
            return .filtered(dataNumber: Int(dataNumber), baseTimestamp: baseTimestamp)
        }
        
        //        let fatigueLevel = Int(entryBytes[12])
        //        let systolicBP = Int(entryBytes[13])
        //        let diastolicBP = Int(entryBytes[14])
        
        //  just for debugging
        let date = Date(timeIntervalSince1970: TimeInterval(baseTimestamp / 1000))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = formatter.string(from: date)
        
        logger.info("PARSED: ID=\(dataNumber), Time=\(dateString) UTC, HRV=\(hrvValue)", category: .healthDataSync)
        
        return .success(HRVDataEntry(
            dataNumber: Int(dataNumber),
            baseTimestamp: baseTimestamp,
            hrvValue: hrvValue
        ))
    }
    
    static func createHRVBlock(
        entries: [HRVDataEntry],
        totalEntriesCount: Int,
        oldestEntryTimestamp: Int?,
        hasReachedEndMarker: Bool
    ) -> HRVDataBlock {
        return HRVDataBlock(
            entries: entries,
            totalEntriesCount: totalEntriesCount,
            oldestEntryTimestamp: oldestEntryTimestamp,
            hasReachedEndMarker: hasReachedEndMarker
        )
    }
}
