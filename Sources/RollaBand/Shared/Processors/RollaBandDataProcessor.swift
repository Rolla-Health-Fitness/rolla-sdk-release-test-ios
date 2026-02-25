import Foundation

public actor RollaBandDataProcessor {
    private let commandExecutor: CommandExecutor
    private let characteristicObserver: CharacteristicObserver
    private let logger: Logging
    private var deviceSyncInProgress: Set<BLEDeviceIdentifier> = []
    private var isHealthDataSyncInProgress = false
    
    public init(
        commandExecutor: CommandExecutor,
        characteristicObserver: CharacteristicObserver,
        logger: Logging
    ) {
        self.commandExecutor = commandExecutor
        self.characteristicObserver = characteristicObserver
        self.logger = logger
    }
    
    func getDetailedData<Entry, Block: RollaBandDataBlock, Page: RollaBandDataPage, Command: RollaBandDataCommand, Parser: RollaBandDataParser>(
        deviceUUID: BLEDeviceIdentifier,
        dataTypeName: String,
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int,
        timeout: TimeInterval,
        maxEntriesPerPage: Int,
        command: Command.Type,
        parser: Parser,
        page: Page.Type
    ) async throws -> [Entry] where Block.Entry == Entry, Page.Block == Block, Parser.Block == Block {
        
        while deviceSyncInProgress.contains(deviceUUID) {
            logger.progress(
                "\(dataTypeName) waiting for existing sync operation to complete on device: \(deviceUUID.value)",
                category: .healthDataSync
            )
            try await Task.sleep(nanoseconds: 100_000_000)
        }
        deviceSyncInProgress.insert(deviceUUID)
        
        defer {
            deviceSyncInProgress.remove(deviceUUID)
        }
        
        return try await performDetailedDataSync(
            deviceUUID: deviceUUID,
            dataTypeName: dataTypeName,
            lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
            lastSyncEntryTimestamp: lastSyncEntryTimestamp,
            timeout: timeout,
            maxEntriesPerPage: maxEntriesPerPage,
            command: command,
            parser: parser,
            page: page
        )
    }
    
    private func performDetailedDataSync<Entry, Block: RollaBandDataBlock, Page: RollaBandDataPage, Command: RollaBandDataCommand, Parser: RollaBandDataParser>(
        deviceUUID: BLEDeviceIdentifier,
        dataTypeName: String,
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int,
        timeout: TimeInterval,
        maxEntriesPerPage: Int,
        command: Command.Type,
        parser: Parser,
        page: Page.Type
    ) async throws -> [Entry] where Block.Entry == Entry, Page.Block == Block, Parser.Block == Block {
        
        let (stream, streamId) = await characteristicObserver.observeNotifications(
            deviceID: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid
        )
        
        var allEntries: [Entry] = []
        var commandType: Command.CommandType = .readRecent
        var keepPaging = true
        var pageNumber = 0
        
        do {
            while keepPaging {
                pageNumber += 1
                
                let cmd = command.init(
                    deviceUUID: deviceUUID,
                    timeout: timeout,
                    commandType: commandType,
                    baseTimestamp: lastSyncEntryBaseTimestamp
                )
                _ = try await cmd.execute(using: commandExecutor)
                
                let page = try await readOnePage(
                    stream: stream,
                    expectedIdentifier: parser.dataIdentifier,
                    maxEntriesPerPage: maxEntriesPerPage,
                    blockTimeoutSeconds: RollaBandDataConstants.defaultBlockTimeout,
                    lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
                    lastSyncEntryTimestamp: lastSyncEntryTimestamp,
                    parser: parser,
                    pageType: page
                )
                
                let pageEntries = page.blocks.flatMap { $0.entries }
                
                if !pageEntries.isEmpty {
                    allEntries.append(contentsOf: pageEntries)
                }
                
                if !page.hasMoreData {
                    logger.info("[\(dataTypeName)] PAGE \(pageNumber): No more data, sync complete", category: .healthDataSync)
                    keepPaging = false
                } else {
                    logger.info("[\(dataTypeName)] PAGE \(pageNumber): More data available, continuing to next page...", category: .healthDataSync)
                    keepPaging = true
                    commandType = .continueReading
                }
            }
            
            logger.info("[\(dataTypeName)] SYNC COMPLETE: \(allEntries.count) total entries across \(pageNumber) pages", category: .healthDataSync)
        } catch {
            logger.error("[\(dataTypeName)] Closing stream id=\(streamId) due to error: \(error)", category: .healthDataSync)
            await characteristicObserver.stopObservingNotifications(id: streamId)
            throw error
        }
        
        await characteristicObserver.stopObservingNotifications(id: streamId)
        
        return allEntries
    }
    
    private func readOnePage<Entry, Block: RollaBandDataBlock, Page: RollaBandDataPage, Parser: RollaBandDataParser>(
        stream: AsyncStream<Data>,
        expectedIdentifier: UInt8,
        maxEntriesPerPage: Int,
        blockTimeoutSeconds: TimeInterval,
        lastSyncEntryBaseTimestamp: Int,
        lastSyncEntryTimestamp: Int,
        parser: Parser,
        pageType: Page.Type
    ) async throws -> Page where Block.Entry == Entry, Page.Block == Block, Parser.Block == Block {
        
        var blocks: [Block] = []
        var totalEntriesReceived = 0 // Total entries from band (filtered + unfiltered)
        var totalFilteredEntries = 0 // Only entries that passed the filter
        var totalBlocksReceived = 0
        var hasMoreData = true
        var consecutiveTimeouts = 0
        var consecutiveFilteredBlocks = 0 // For logging only
        let maxConsecutiveTimeouts = 2
        
        let matcher = DataIdentifierMatcher(expectedIdentifier: expectedIdentifier)
        
        let dataTypeName = String(format: "0x%02X", expectedIdentifier)
        
        pageLoop: while true {
            let result = await readNextBlock(
                from: stream,
                matcher: matcher,
                timeout: blockTimeoutSeconds
            )
            
            switch result {
            case .timeout:
                consecutiveTimeouts += 1
                
                if consecutiveTimeouts >= maxConsecutiveTimeouts {
                    if !blocks.isEmpty {
                        if totalEntriesReceived >= maxEntriesPerPage {
                            hasMoreData = true
                        } else {
                            hasMoreData = false
                        }
                    } else {
                        logger.info("[readOnePage] [\(dataTypeName)] Max timeouts reached with no data - device has no data to send", category: .healthDataSync)
                        hasMoreData = false
                    }
                    break pageLoop
                }
                
                continue pageLoop
                
            case .data(let data):
                consecutiveTimeouts = 0
                totalBlocksReceived += 1
                
                let block: Block
                do {
                    block = try parser.parseDataBlock(
                        from: [UInt8](data),
                        lastSyncEntryBaseTimestamp: lastSyncEntryBaseTimestamp,
                        lastSyncEntryTimestamp: lastSyncEntryTimestamp
                    )
                } catch {
                    logger.warning("[readOnePage] [\(dataTypeName)] Failed to parse block #\(totalBlocksReceived), skipping: \(error)", category: .healthDataSync)
                    continue pageLoop
                }
                
                let filteredEntries = block.entries
                let entriesReceivedInBlock = block.totalEntriesCount
                
                // CONDITION 1: End marker (0xFF)
                if block.hasReachedEndMarker {
                    if !filteredEntries.isEmpty {
                        blocks.append(block)
                        totalEntriesReceived += entriesReceivedInBlock
                        totalFilteredEntries += filteredEntries.count
                        logger.info("[readOnePage] [\(dataTypeName)] END MARKER with \(filteredEntries.count) filtered entries - total received: \(totalEntriesReceived)", category: .healthDataSync)
                    } else {
                        logger.info("[readOnePage] [\(dataTypeName)] END MARKER with no filtered entries - total received: \(totalEntriesReceived), total filtered: \(totalFilteredEntries)", category: .healthDataSync)
                    }
                    hasMoreData = false
                    break pageLoop
                }
                
                if filteredEntries.isEmpty {
                    consecutiveFilteredBlocks += 1
                    totalEntriesReceived += entriesReceivedInBlock
                    logger.info("🔍 [readOnePage] [\(dataTypeName)] Block #\(totalBlocksReceived) had ALL entries filtered (consecutive: \(consecutiveFilteredBlocks), received: \(totalEntriesReceived)/\(maxEntriesPerPage))", category: .healthDataSync)
                    
                    if totalEntriesReceived >= maxEntriesPerPage {
                        // Check if oldest entry is newer than sync point
                        if let oldestTimestamp = block.oldestEntryTimestamp, oldestTimestamp > lastSyncEntryTimestamp {
                            logger.info("[readOnePage] [\(dataTypeName)] MAX ENTRIES RECEIVED (\(totalEntriesReceived)) with filtered block - oldest entry (\(oldestTimestamp)) > sync point (\(lastSyncEntryTimestamp)), hasMoreData=true", category: .healthDataSync)
                            hasMoreData = true
                        } else {
                            logger.info("[readOnePage] [\(dataTypeName)] MAX ENTRIES RECEIVED (\(totalEntriesReceived)) with filtered block - oldest entry <= sync point, hasMoreData=false", category: .healthDataSync)
                            hasMoreData = false
                        }
                        break pageLoop
                    }
                    
                    continue pageLoop
                } else {
                    consecutiveFilteredBlocks = 0
                }
                
                blocks.append(block)
                totalEntriesReceived += entriesReceivedInBlock
                totalFilteredEntries += filteredEntries.count
                
                // CONDITION 2: page is full
                if totalEntriesReceived >= maxEntriesPerPage {
                    if let oldestTimestamp = block.oldestEntryTimestamp, oldestTimestamp > lastSyncEntryTimestamp {
                        logger.info("[readOnePage] [\(dataTypeName)] MAX ENTRIES RECEIVED (\(totalEntriesReceived)) - oldest entry (\(oldestTimestamp)) > sync point (\(lastSyncEntryTimestamp)), hasMoreData=true", category: .healthDataSync)
                        hasMoreData = true
                    } else {
                        logger.info("[readOnePage] [\(dataTypeName)] MAX ENTRIES RECEIVED (\(totalEntriesReceived)) - oldest entry <= sync point, hasMoreData=false", category: .healthDataSync)
                        hasMoreData = false
                    }
                    break pageLoop
                }
            }
        }
        
        return pageType.init(blocks: blocks, hasMoreData: hasMoreData)
    }
    
    private func readNextBlock(
        from stream: AsyncStream<Data>,
        matcher: DataIdentifierMatcher,
        timeout: TimeInterval
    ) async -> NextBlockResult {
        await withTaskGroup(of: NextBlockResult.self) { group in
            group.addTask { [logger] in
                for await data in stream {
                    if matcher.matches(data) {
                        return .data(data)
                    } else {
                        if let firstByte = data.first {
                            logger.warning(
                                "⚠️ Received non-matching packet: expected 0x\(String(format: "%02X", matcher.expectedIdentifier)), got 0x\(String(format: "%02X", firstByte))",
                                category: .healthDataSync
                            )
                        }
                    }
                }
                return .timeout
            }
            
            group.addTask {
                try? await Task.sleep(nanoseconds: UInt64(timeout * 1_000_000_000))
                return .timeout
            }
            
            guard let result = await group.next() else {
                return .timeout
            }
            
            group.cancelAll()
            return result
        }
    }
}

extension RollaBandDataProcessor {
    func getRawDataAsHexString<Command: RollaBandDataCommand>(
        deviceUUID: BLEDeviceIdentifier,
        command: Command.Type,
        expectedIdentifier: UInt8,
        entrySize: Int,
        maxPacketsPerPage: Int,
        timeout: TimeInterval
    ) async throws -> String {
        let dataTypeName = String(format: "0x%02X", expectedIdentifier)
        
        while deviceSyncInProgress.contains(deviceUUID) {
            logger.progress(
                "\(dataTypeName) waiting for existing sync operation to complete on device: \(deviceUUID.value)",
                category: .healthDataSync
            )
            try await Task.sleep(nanoseconds: 100_000_000)
        }
        deviceSyncInProgress.insert(deviceUUID)
        
        defer {
            deviceSyncInProgress.remove(deviceUUID)
        }
        
        let (stream, streamId) = await characteristicObserver.observeNotifications(
            deviceID: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid
        )
        
        var allBlockLines: [String] = []
        var commandType: Command.CommandType = .readRecent
        var keepPaging = true
        var pageNumber = 0
        
        do {
            while keepPaging {
                pageNumber += 1
                
                let cmd = command.init(
                    deviceUUID: deviceUUID,
                    timeout: timeout,
                    commandType: commandType,
                    baseTimestamp: 0
                )
                _ = try await cmd.execute(using: commandExecutor)
                
                let (blockLines, hasMoreData, entriesReceived) = try await readOneRawPage(
                    stream: stream,
                    expectedIdentifier: expectedIdentifier,
                    entrySize: entrySize,
                    maxEntriesPerPage: maxPacketsPerPage,
                    blockTimeoutSeconds: RollaBandDataConstants.defaultBlockTimeout
                )
                
                allBlockLines.append(contentsOf: blockLines)
                
                if !hasMoreData {
                    logger.info("[\(dataTypeName)] PAGE \(pageNumber): No more data, sync complete (\(entriesReceived) entries)", category: .healthDataSync)
                    keepPaging = false
                } else {
                    logger.info("[\(dataTypeName)] PAGE \(pageNumber): More data available (\(entriesReceived) entries), continuing to next page...", category: .healthDataSync)
                    keepPaging = true
                    commandType = .continueReading
                }
            }
            
            logger.info("[\(dataTypeName)] SYNC COMPLETE: \(allBlockLines.count) total entries across \(pageNumber) pages", category: .healthDataSync)
        } catch {
            logger.error("[\(dataTypeName)] Closing stream id=\(streamId) due to error: \(error)", category: .healthDataSync)
            await characteristicObserver.stopObservingNotifications(id: streamId)
            throw error
        }
        
        await characteristicObserver.stopObservingNotifications(id: streamId)
        
        return allBlockLines.joined(separator: "\n")
    }
    
    func getRawDataAsHexString(
        deviceUUID: BLEDeviceIdentifier,
        commandByte: UInt8,
        expectedIdentifier: UInt8,
        entrySize: Int,
        maxPacketsPerPage: Int,
        timeout: TimeInterval
    ) async throws -> String {
        let dataTypeName = String(format: "0x%02X", expectedIdentifier)
        
        while deviceSyncInProgress.contains(deviceUUID) {
            logger.progress(
                "\(dataTypeName) waiting for existing sync operation to complete on device: \(deviceUUID.value)",
                category: .healthDataSync
            )
            try await Task.sleep(nanoseconds: 100_000_000)
        }
        deviceSyncInProgress.insert(deviceUUID)
        
        defer {
            deviceSyncInProgress.remove(deviceUUID)
        }
        
        let (stream, streamId) = await characteristicObserver.observeNotifications(
            deviceID: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid
        )
        
        var allBlockLines: [String] = []
        var commandType: CustomCommandType = .readRecent
        var keepPaging = true
        var pageNumber = 0
        
        do {
            while keepPaging {
                pageNumber += 1
                
                let cmd = GetCustomDataCommand(
                    deviceUUID: deviceUUID,
                    timeout: timeout,
                    commandByte: commandByte,
                    commandType: commandType
                )
                try await cmd.execute(using: commandExecutor)
                
                let (blockLines, hasMoreData, entriesReceived) = try await readOneRawPage(
                    stream: stream,
                    expectedIdentifier: expectedIdentifier,
                    entrySize: entrySize,
                    maxEntriesPerPage: maxPacketsPerPage,
                    blockTimeoutSeconds: RollaBandDataConstants.defaultBlockTimeout
                )
                
                allBlockLines.append(contentsOf: blockLines)
                
                if !hasMoreData {
                    logger.info("[\(dataTypeName)] PAGE \(pageNumber): No more data, sync complete (\(entriesReceived) entries)", category: .healthDataSync)
                    keepPaging = false
                } else {
                    logger.info("[\(dataTypeName)] PAGE \(pageNumber): More data available (\(entriesReceived) entries), continuing to next page...", category: .healthDataSync)
                    keepPaging = true
                    commandType = .continueReading
                }
            }
            
            logger.info("[\(dataTypeName)] SYNC COMPLETE: \(allBlockLines.count) total entries across \(pageNumber) pages", category: .healthDataSync)
        } catch {
            logger.error("[\(dataTypeName)] Closing stream id=\(streamId) due to error: \(error)", category: .healthDataSync)
            await characteristicObserver.stopObservingNotifications(id: streamId)
            throw error
        }
        
        await characteristicObserver.stopObservingNotifications(id: streamId)
        
        return allBlockLines.joined(separator: "\n")
    }

    func getSingleReadAsHexString(
        deviceUUID: BLEDeviceIdentifier,
        commandByte: UInt8,
        timeout: TimeInterval
    ) async throws -> String {
        let dataTypeName = String(format: "0x%02X", commandByte)

        while deviceSyncInProgress.contains(deviceUUID) {
            logger.progress(
                "\(dataTypeName) waiting for existing sync operation to complete on device: \(deviceUUID.value)",
                category: .healthDataSync
            )
            try await Task.sleep(nanoseconds: 100_000_000)
        }
        deviceSyncInProgress.insert(deviceUUID)

        defer {
            deviceSyncInProgress.remove(deviceUUID)
        }

        let (stream, streamId) = await characteristicObserver.observeNotifications(
            deviceID: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid
        )

        do {
            let cmd = GetCustomDataCommand(
                deviceUUID: deviceUUID,
                timeout: timeout,
                commandByte: commandByte,
                commandType: .readRecent
            )
            try await cmd.execute(using: commandExecutor)

            let matcher = DataIdentifierMatcher(expectedIdentifier: commandByte)
            let result = await readNextBlock(
                from: stream,
                matcher: matcher,
                timeout: RollaBandDataConstants.defaultBlockTimeout
            )

            await characteristicObserver.stopObservingNotifications(id: streamId)

            switch result {
            case .data(let data):
                let bytes = [UInt8](data)
                logger.info("[\(dataTypeName)] Single read received \(bytes.count) bytes", category: .healthDataSync)
                return bytes.map { String(format: "%02X", $0) }.joined(separator: " ")
            case .timeout:
                logger.warning("[\(dataTypeName)] Single read timed out", category: .healthDataSync)
                return "NO DATA"
            }
        } catch {
            logger.error("[\(dataTypeName)] Single read error: \(error)", category: .healthDataSync)
            await characteristicObserver.stopObservingNotifications(id: streamId)
            throw error
        }
    }

    private func readOneRawPage(
        stream: AsyncStream<Data>,
        expectedIdentifier: UInt8,
        entrySize: Int,
        maxEntriesPerPage: Int,
        blockTimeoutSeconds: TimeInterval
    ) async throws -> (blockLines: [String], hasMoreData: Bool, entriesReceived: Int) {
        
        var blockLines: [String] = []
        var totalEntriesReceived = 0
        var totalBlocksReceived = 0
        var hasMoreData = true
        var consecutiveTimeouts = 0
        let maxConsecutiveTimeouts = 2
        let endMarker: UInt8 = RollaBandDataConstants.endMarker
        
        let matcher = DataIdentifierMatcher(expectedIdentifier: expectedIdentifier)
        let dataTypeName = String(format: "0x%02X", expectedIdentifier)
        
        pageLoop: while true {
            let result = await readNextBlock(
                from: stream,
                matcher: matcher,
                timeout: blockTimeoutSeconds
            )
            
            switch result {
            case .timeout:
                consecutiveTimeouts += 1
                
                if consecutiveTimeouts >= maxConsecutiveTimeouts {
                    if !blockLines.isEmpty {
                        if totalEntriesReceived >= maxEntriesPerPage {
                            hasMoreData = true
                        } else {
                            hasMoreData = false
                        }
                    } else {
                        logger.info("[readOneRawPage] [\(dataTypeName)] Max timeouts reached with no data - device has no data to send", category: .healthDataSync)
                        hasMoreData = false
                    }
                    break pageLoop
                }
                
                continue pageLoop
                
            case .data(let data):
                consecutiveTimeouts = 0
                totalBlocksReceived += 1
                let bytes = [UInt8](data)
                
                // CONDITION 1: End marker (0xFF)
                let hasEndMarker = bytes.last == endMarker
                
                // Split block into packets by entry size
                let packets = divideBlockIntoPackets(data: bytes, header: expectedIdentifier, packetSize: entrySize)
                
                for packet in packets {
                    blockLines.append(formatPacket(bytes: packet))
                }
                
                totalEntriesReceived += packets.count
                
                if hasEndMarker {
                    let endMarkerLine = String(format: "%02X FF", expectedIdentifier)
                    blockLines.append(endMarkerLine)
                    logger.info("[readOneRawPage] [\(dataTypeName)] END MARKER - total received: \(totalEntriesReceived)", category: .healthDataSync)
                    hasMoreData = false
                    break pageLoop
                }
                
                // CONDITION 2: page is full
                if totalEntriesReceived >= maxEntriesPerPage {
                    logger.info("[readOneRawPage] [\(dataTypeName)] MAX ENTRIES RECEIVED (\(totalEntriesReceived)), hasMoreData=true", category: .healthDataSync)
                    hasMoreData = true
                    break pageLoop
                }
            }
        }
        
        return (blockLines, hasMoreData, totalEntriesReceived)
    }
    
    private func divideBlockIntoPackets(data: [UInt8], header: UInt8, packetSize: Int) -> [[UInt8]] {
        var packets: [[UInt8]] = []
        var index = 0
        
        while index < data.count {
            if data[index] == header {
                let end = min(index + packetSize, data.count)
                let packet = Array(data[index..<end])
                
                if packet.count == packetSize {
                    packets.append(packet)
                }
                index += packetSize
            } else {
                index += 1
            }
        }
        
        return packets
    }
    
    private func formatPacket(bytes: [UInt8]) -> String {
        bytes.enumerated().map { index, byte in
            if index >= 3 && index <= 8 {
                let decoded = Int((byte >> 4) & 0x0F) * 10 + Int(byte & 0x0F)
                return String(format: "%02d", decoded)
            } else {
                return String(format: "%02X", byte)
            }
        }.joined(separator: " ")
    }
}

private enum NextBlockResult: Sendable {
    case data(Data)
    case timeout
}

private struct DataIdentifierMatcher: NotificationMatcher {
    let expectedIdentifier: UInt8
    
    init(expectedIdentifier: UInt8) {
        self.expectedIdentifier = expectedIdentifier
    }
    
    func matches(_ data: Data?) -> Bool {
        guard let data = data, let firstByte = data.first else { return false }
        return firstByte == expectedIdentifier
    }
}
