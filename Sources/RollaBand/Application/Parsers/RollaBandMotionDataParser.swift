import Foundation

public final class RollaBandMotionDataParser: RollaBandDataParser, Sendable {
    typealias Entry = MotionDataEntry
    typealias Block = MotionDataBlock
    typealias ParseError = BLEDataParsingError

    static let dataIdentifier: UInt8 = RollaBandCommand.getMotionData.rawValue
    static let entrySize: Int = 14

    var dataIdentifier: UInt8 { Self.dataIdentifier }
    var entrySize: Int { Self.entrySize }
    var endMarker: UInt8 { RollaBandDataConstants.endMarker }
    let logger: Logging

    private let baseParser: BaseRollaBandDataParser<MotionDataEntry, MotionDataBlock>

    public init(logger: Logging) {
        self.logger = logger
        self.baseParser = BaseRollaBandDataParser(
            dataIdentifier: Self.dataIdentifier,
            entrySize: Self.entrySize,
            endMarker: RollaBandDataConstants.endMarker,
            logger: logger,
            entryParser: Self.parseMotionEntry,
            blockCreator: Self.createMotionBlock
        )
    }
    
    func parseDataBlock(from data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> MotionDataBlock {
        return try baseParser.parseDataBlock(
            from: data,
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp
        )
    }
}

extension RollaBandMotionDataParser {
    private static func parseMotionEntry(
        _ logger: Logging,
        _ entryBytes: [UInt8],
        _ lastSyncEntryBaseTimestamp: Int,
        _ lastSyncEntryTimestamp: Int
    ) throws -> EntryParseResult<MotionDataEntry> {
        
        let hexString = entryBytes.map { String(format: "%02X", $0) }.joined(separator: " ")
        logger.info("RAW: \(hexString)", category: .healthDataSync)
        
        guard let dataNumber = entryBytes.uint16BE(at: 1) else {
            throw BLEDataParsingError.parsingFailed("Failed to parse data number")
        }
        
        let baseTimestamp = try BaseRollaBandDataParser<MotionDataEntry, MotionDataBlock>.parseTimestampFromBCD(
            from: entryBytes,
            startIndex: 3
        )
        
        guard baseTimestamp >= lastSyncEntryBaseTimestamp else {
            return .filtered(dataNumber: Int(dataNumber), baseTimestamp: baseTimestamp)
        }
        
        guard let heartRateByte = entryBytes.uint8(at: 9) else {
            throw BLEDataParsingError.parsingFailed("Failed to parse heart rate")
        }

        guard let spmValue = entryBytes.uint32LE(at: 10) else {
            throw BLEDataParsingError.parsingFailed("Failed to parse SPM")
        }

        let heartRate = Int(heartRateByte)
        let spm = Int(spmValue)

        var motionPoints: [MotionPoint] = []

        if baseTimestamp > lastSyncEntryTimestamp {
            motionPoints.append(MotionPoint(
                timestamp: baseTimestamp,
                heartRate: heartRate,
                spm: spm
            ))
        }
        
        // Debug logging
        let date = Date(timeIntervalSince1970: TimeInterval(baseTimestamp / 1000))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = formatter.string(from: date)
        
        logger.info("PARSED: ID=\(dataNumber), Time=\(dateString) UTC, HR=\(heartRate), SPM=\(spm)", category: .healthDataSync)
        
        return .success(MotionDataEntry(
            dataNumber: Int(dataNumber),
            baseTimestamp: baseTimestamp,
            motionPoints: motionPoints
        ))
    }
    
    private static func createMotionBlock(
        _ entries: [MotionDataEntry],
        _ totalEntriesCount: Int,
        _ oldestEntryTimestamp: Int?,
        _ hasReachedEndMarker: Bool
    ) -> MotionDataBlock {
        return MotionDataBlock(
            entries: entries,
            totalEntriesCount: totalEntriesCount,
            oldestEntryTimestamp: oldestEntryTimestamp,
            hasReachedEndMarker: hasReachedEndMarker
        )
    }
}

