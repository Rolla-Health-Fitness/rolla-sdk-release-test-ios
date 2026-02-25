import Foundation

public final class RollaBandStepsDataParser: RollaBandDataParser, Sendable {
    typealias Entry = StepsDataEntry
    typealias Block = StepsDataBlock
    typealias ParseError = BLEDataParsingError
    
    static let dataIdentifier: UInt8 = 0x52
    static let entrySize: Int = 25
    
    var dataIdentifier: UInt8 { Self.dataIdentifier }
    var entrySize: Int { Self.entrySize }
    var endMarker: UInt8 { RollaBandDataConstants.endMarker }
    
    let logger: Logging
    private let baseParser: BaseRollaBandDataParser<StepsDataEntry, StepsDataBlock>

    public init(logger: Logging) {
        self.logger = logger
        self.baseParser = BaseRollaBandDataParser(
            dataIdentifier: Self.dataIdentifier,
            entrySize: Self.entrySize,
            endMarker: RollaBandDataConstants.endMarker,
            logger: logger,
            entryParser: Self.parseStepsEntry,
            blockCreator: Self.createStepsBlock
        )
    }
    
    func parseDataBlock(from data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> StepsDataBlock {
        return try baseParser.parseDataBlock(
            from: data,
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp
        )
    }
}

extension RollaBandStepsDataParser {
    static func parseStepsEntry(logger: Logging, from entryBytes: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> EntryParseResult<StepsDataEntry> {
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
        
        let baseTimestamp = try BaseRollaBandDataParser<StepsDataEntry, StepsDataBlock>.parseTimestampFromBCD(
            from: entryBytes,
            startIndex: 3
        )

        guard baseTimestamp >= lastSyncEntryBaseTimestamp else {
            return .filtered(dataNumber: Int(dataNumber), baseTimestamp: baseTimestamp)
        }
        
        guard let totalSteps = entryBytes.uint16LE(at: 9),
              let totalCaloriesRaw = entryBytes.uint16LE(at: 11),
              let totalDistanceRaw = entryBytes.uint16LE(at: 13)
        else {
            throw BLEDataParsingError.parsingFailed("Failed to parse totals")
        }
        
        let totalCalories = Double(totalCaloriesRaw) * 0.01 // to KCAL
        let totalDistance = Double(totalDistanceRaw) * 0.01
        
        let minuteStepCounts = Array(entryBytes[15..<25])
        
        let totalNonZeroSteps = minuteStepCounts.reduce(0) { $0 + (Int($1) > 0 ? Int($1) : 0) }

        var steps: [Step] = []
        for (minuteIndex, stepCount) in minuteStepCounts.enumerated() {
            let minuteTimestampMillis = baseTimestamp + (minuteIndex * 60 * 1000)

            guard stepCount > 0 else { continue }
            
            let caloriesForThisMinute = totalNonZeroSteps > 0 ?
            totalCalories * (Double(stepCount) / Double(totalNonZeroSteps)) : 0.0
            
            guard minuteTimestampMillis > lastSyncEntryTimestamp else { continue }
            
            steps.append(Step(
                timestamp: minuteTimestampMillis,
                steps: Int(stepCount),
                calories: caloriesForThisMinute
            ))
        }
        
        // just for debugging
        let date = Date(timeIntervalSince1970: TimeInterval(baseTimestamp / 1000))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = formatter.string(from: date)
        
        let stepCounts = minuteStepCounts.map { String($0) }.joined(separator: ", ")
        logger.info("PARSED: ID=\(dataNumber), Time=\(dateString) UTC, Total=\(totalSteps), Steps=[\(stepCounts)], total calories \(totalCalories), total distance \(totalDistance)", category: .healthDataSync)
        
        return .success(StepsDataEntry(
            dataNumber: Int(dataNumber),
            baseTimestamp: baseTimestamp,
            totalSteps: totalSteps,
            totalCalories: totalCalories,
            totalDistance: totalDistance,
            steps: steps
        ))
    }
    
    static func createStepsBlock(
        entries: [StepsDataEntry],
        totalEntriesCount: Int,
        oldestEntryTimestamp: Int?,
        hasReachedEndMarker: Bool
    ) -> StepsDataBlock {
        return StepsDataBlock(
            entries: entries,
            totalEntriesCount: totalEntriesCount,
            oldestEntryTimestamp: oldestEntryTimestamp,
            hasReachedEndMarker: hasReachedEndMarker
        )
    }
}
