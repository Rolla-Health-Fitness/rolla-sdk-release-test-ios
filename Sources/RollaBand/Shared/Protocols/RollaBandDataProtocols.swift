import Foundation

public protocol RollaBandDataPage: Sendable, Equatable {
    associatedtype Block: RollaBandDataBlock

    var blocks: [Block] { get }
    var hasMoreData: Bool { get }

    init(blocks: [Block], hasMoreData: Bool)
}

public protocol RollaBandDataBlock: Sendable, Equatable {
    associatedtype Entry: RollaBandDataEntry

    var entries: [Entry] { get }
    var totalEntriesCount: Int { get } // Total entries received from band (filtered + unfiltered)
    var oldestEntryTimestamp: Int? { get } // Timestamp of oldest entry in block (even if filtered), nil if no entries
    var hasReachedEndMarker: Bool { get }
}

public protocol RollaBandDataEntry: Sendable, Equatable {
    var dataNumber: Int { get }
    var baseTimestamp: Int { get }
}

protocol RollaBandReadCommandType: RawRepresentable, Sendable where RawValue == UInt8 {
    static var readRecent: Self { get }
    static var continueReading: Self { get }
}

protocol RollaBandDataCommand: BLECommand {
    associatedtype CommandType: RollaBandReadCommandType

    var baseTimestamp: Int? { get }

    init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval, commandType: CommandType, baseTimestamp: Int?)

    func execute(using commandExecutor: CommandExecutor) async throws -> Output
}

public enum RollaBandDataConstants {
    public static let defaultTimeout: TimeInterval = 30.0
    public static let defaultBlockTimeout: TimeInterval = 10
    public static let defaultMaxEntriesPerPage = 450
    public static let endMarker: UInt8 = 0xFF
}

