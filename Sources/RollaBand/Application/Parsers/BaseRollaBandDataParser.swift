import Foundation

public enum EntryParseResult<Entry> {
    case success(Entry)
    case filtered(dataNumber: Int, baseTimestamp: Int)
    case invalid
}

public final class BaseRollaBandDataParser<Entry: RollaBandDataEntry, Block: RollaBandDataBlock>: RollaBandDataParser, Sendable
where Block.Entry == Entry {

    public typealias ParseError = BLEDataParsingError
    public typealias EntryParser = @Sendable (Logging, [UInt8], Int, Int) throws -> EntryParseResult<Entry>
    public typealias BlockCreator = @Sendable ([Entry], Int, Int?, Bool) -> Block

    public let dataIdentifier: UInt8
    public let entrySize: Int
    public let endMarker: UInt8
    public let logger: Logging

    private let entryParser: EntryParser
    private let blockCreator: BlockCreator

    public init(
        dataIdentifier: UInt8,
        entrySize: Int,
        endMarker: UInt8,
        logger: Logging,
        entryParser: @escaping EntryParser,
        blockCreator: @escaping BlockCreator
    ) {
        self.dataIdentifier = dataIdentifier
        self.entrySize = entrySize
        self.endMarker = endMarker
        self.logger = logger
        self.entryParser = entryParser
        self.blockCreator = blockCreator
    }

    func parseDataBlock(from data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> Block {
        guard let identifierByte = data.first else {
            throw BLEDataParsingError.parsingFailed("Empty notification chunk received")
        }

        guard identifierByte == dataIdentifier else {
            throw BLEDataParsingError.parsingFailed(
                "Expected identifier 0x\(String(format: "%02X", dataIdentifier)), got 0x\(String(format: "%02X", identifierByte))"
            )
        }

        let hasEndMarker = detectEndMarker(in: data)

        let (entries, totalCount, oldestTimestamp) = try parseAllEntries(
            from: data,
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp
        )

        logger.info("Parsed \(entries.count) filtered entries out of \(totalCount) total entries, oldestTimestamp=\(oldestTimestamp?.description ?? "nil"), hasReachedEndMarker=\(hasEndMarker)", category: .healthDataSync)

        return blockCreator(entries, totalCount, oldestTimestamp, hasEndMarker)
    }
    
    private func parseAllEntries(from data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> ([Entry], Int, Int?) {
        var entries: [Entry] = []
        var totalEntriesCount = 0 // both filtered and unfiltered
        var oldestEntryTimestamp: Int? = nil
        var position = 0
        var lastDataNumber: Int? = nil

        while position < data.count {
            if data[position] == endMarker {
                logger.info("Found end marker at position \(position), stopping parsing", category: .healthDataSync)
                break
            }

            guard position + entrySize <= data.count else {
                logger.info("Not enough bytes for complete entry at position \(position), stopping parsing", category: .healthDataSync)
                break
            }

            guard data[position] == dataIdentifier else {
                position = findNextValidEntryPosition(
                    in: data,
                    startingFrom: position,
                    expectedDataNumber: lastDataNumber.map { $0 + 1 },
                    lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
                    lastSyncEntryTimestamp: lastSyncEntryTimestamp
                )
                continue
            }

            let parseResult = parseEntryAtPosition(
                position: position,
                in: data,
                lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
                lastSyncEntryTimestamp: lastSyncEntryTimestamp
            )

            switch parseResult {
            case .success(let entry):
                lastDataNumber = entry.dataNumber
                entries.append(entry)
                totalEntriesCount += 1
                oldestEntryTimestamp = min(oldestEntryTimestamp ?? entry.baseTimestamp, entry.baseTimestamp)
                position += entrySize

            case .filtered(let dataNumber, let baseTimestamp):
                lastDataNumber = dataNumber
                totalEntriesCount += 1
                oldestEntryTimestamp = min(oldestEntryTimestamp ?? baseTimestamp, baseTimestamp)
                position += entrySize

            case .invalid:
                totalEntriesCount += 1
                position = findNextValidEntryPosition(
                    in: data,
                    startingFrom: position + 1,
                    expectedDataNumber: lastDataNumber.map { $0 + 1 },
                    lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
                    lastSyncEntryTimestamp: lastSyncEntryTimestamp
                )
            }
        }

        return (entries, totalEntriesCount, oldestEntryTimestamp)
    }
    
    private func detectEndMarker(in data: [UInt8]) -> Bool {
        guard !data.isEmpty else { return false }
        
        if data.last == endMarker {
            return true
        }
        
        if data.count >= 2 &&
            data[data.count - 2] == dataIdentifier &&
            data.last == endMarker {
            return true
        }
        
        return false
    }
    
    private func parseEntryAtPosition(position: Int, in data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) -> EntryParseResult<Entry> {
        guard position + entrySize <= data.count else {
            let remainingBytes = Array(data[position...])
            if !isValidEndMarker(remainingBytes) {
                logger.warning("Incomplete entry at end: \(remainingBytes.count) bytes", category: .healthDataSync)
            }
            return .invalid
        }
        
        let entryBytes = Array(data[position..<position + entrySize])
        
        do {
            return try entryParser(
                logger,
                entryBytes,
                lastSyncEntryBaseTimestamp,
                lastSyncEntryTimestamp
            )
        } catch {
            logger.warning("Failed to parse entry at position \(position): \(error)", category: .healthDataSync)
            return .invalid
        }
    }
    
    private func findNextValidEntryPosition(
        in data: [UInt8],
        startingFrom position: Int,
        expectedDataNumber: Int?,
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int
    ) -> Int {
        var searchPosition = position + 1
        logger.progress(
            "Searching for valid entry from position \(position), expected data number: \(expectedDataNumber?.description ?? "none")",
            category: .healthDataSync
        )
        
        while searchPosition < data.count {
            guard data[searchPosition] == dataIdentifier else {
                searchPosition += 1
                continue
            }
            
            guard searchPosition + entrySize <= data.count else {
                logger.warning(
                    "Not enough bytes at position \(searchPosition), need \(entrySize), have \(data.count - searchPosition)",
                    category: .healthDataSync
                )
                searchPosition += 1
                continue
            }
            
            let entryBytes = Array(data[searchPosition..<searchPosition + entrySize])
            let parseResult = (try? entryParser(logger, entryBytes, lastSyncEntryBaseTimestamp, lastSyncEntryTimestamp)) ?? .invalid
            
            switch parseResult {
            case .success(let entry):
                if let expectedDataNumber {
                    let nextExpected = expectedDataNumber + 1
                    guard entry.dataNumber == nextExpected else {
                        logger.warning("Sequence mismatch at position \(searchPosition): expected \(nextExpected), got \(entry.dataNumber)", category: .healthDataSync)
                        searchPosition += 1
                        continue
                    }
                }
                
                logger.info("Found valid entry at position \(searchPosition), data number: \(entry.dataNumber)", category: .healthDataSync)
                return searchPosition
                
            case .filtered(let dataNumber, _):
                if let expectedDataNumber {
                    let nextExpected = expectedDataNumber + 1
                    guard dataNumber == nextExpected else {
                        logger.warning("Sequence mismatch at position \(searchPosition): expected \(nextExpected), got \(dataNumber)", category: .healthDataSync)
                        searchPosition += 1
                        continue
                    }
                }

                logger.info("Found filtered entry at position \(searchPosition), data number: \(dataNumber) (older than sync timestamp)", category: .healthDataSync)
                return searchPosition
                
            case .invalid:
                logger.warning("Failed to parse entry at position \(searchPosition)", category: .healthDataSync)
                searchPosition += 1
                continue
            }
        }
        
        logger.info("Reached end of data", category: .healthDataSync)
        return data.count
    }
    
    private func isValidEndMarker(_ bytes: [UInt8]) -> Bool {
        if bytes.count == 1 && bytes[0] == endMarker { return true }
        if bytes.count == 2 && bytes[0] == dataIdentifier && bytes[1] == endMarker { return true }
        return false
    }
    
    static func parseTimestampFromBCD(from bytes: [UInt8], startIndex: Int) throws -> Int {
        guard startIndex + 5 < bytes.count else {
            throw BLEDataParsingError.parsingFailed("Not enough bytes for timestamp parsing")
        }
        
        let year = fromBCD(bytes[startIndex]) + 2000
        let month = fromBCD(bytes[startIndex + 1])
        let day = fromBCD(bytes[startIndex + 2])
        let hour = fromBCD(bytes[startIndex + 3])
        let minute = fromBCD(bytes[startIndex + 4])
        let second = fromBCD(bytes[startIndex + 5])
        
        guard year >= 2020 else {
            throw BLEDataParsingError.parsingFailed("Invalid year: \(year) (expected 2000-2099)")
        }
        guard month >= 1 && month <= 12 else {
            throw BLEDataParsingError.parsingFailed("Invalid month: \(month) (expected 1-12)")
        }
        guard day >= 1 && day <= 31 else {
            throw BLEDataParsingError.parsingFailed("Invalid day: \(day) (expected 1-31)")
        }
        guard hour >= 0 && hour <= 23 else {
            throw BLEDataParsingError.parsingFailed("Invalid hour: \(hour) (expected 0-23)")
        }
        guard minute >= 0 && minute <= 59 else {
            throw BLEDataParsingError.parsingFailed("Invalid minute: \(minute) (expected 0-59)")
        }
        guard second >= 0 && second <= 59 else {
            throw BLEDataParsingError.parsingFailed("Invalid second: \(second) (expected 0-59)")
        }
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let date = Calendar.current.date(from: dateComponents) else {
            throw BLEDataParsingError.parsingFailed("Invalid timestamp components: \(year)-\(month)-\(day) \(hour):\(minute):\(second)")
        }
        
        return Int(date.timeIntervalSince1970 * 1000)
    }
}
