import Foundation

protocol RollaBandDataParser: Sendable {
    associatedtype Entry: RollaBandDataEntry
    associatedtype Block: RollaBandDataBlock where Block.Entry == Entry
    associatedtype ParseError: Error

    var dataIdentifier: UInt8 { get }
    var entrySize: Int { get }
    var endMarker: UInt8 { get }
    var logger: Logging { get }

    func parseDataBlock(from data: [UInt8], lastSyncEntryBaseTimestamp: Int, lastSyncEntryTimestamp: Int) throws -> Block
}
