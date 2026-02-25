import Foundation

public enum RawLogDataType: Sendable, CustomStringConvertible {
    case steps
    case sleep
    case heartRate
    case activityHeartRate
    case hrv
    case custom(commandByte: UInt8, entrySize: Int, maxPacketsPerPage: Int)
    case customRead(commandByte: UInt8)

    public var description: String {
        switch self {
        case .steps: return "STEPS"
        case .sleep: return "SLEEP"
        case .heartRate: return "HEART RATE"
        case .activityHeartRate: return "ACTIVITY HEART RATE"
        case .hrv: return "HRV"
        case .custom(let byte, _, _): return String(format: "CUSTOM 0x%02X", byte)
        case .customRead(let byte): return String(format: "CUSTOM READ 0x%02X", byte)
        }
    }
}

public protocol GetRawLogsUseCase: Sendable {
    func execute(for deviceId: String, dataType: RawLogDataType) async throws -> String
    func executeAll(for deviceId: String) async throws -> String
}

public final class RollaBandGetRawLogsUseCase: GetRawLogsUseCase, Sendable {
    private let processor: RollaBandDataProcessor
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager
    private let formatter: RawLogsFormatter

    public init(
        processor: RollaBandDataProcessor,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager,
        formatter: RawLogsFormatter = RawLogsFormatter()
    ) {
        self.processor = processor
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
        self.formatter = formatter
    }

    public func execute(for deviceId: String, dataType: RawLogDataType) async throws -> String {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        switch dataType {
        case .steps:
            return try await processor.getRawDataAsHexString(
                deviceUUID: deviceUUID,
                command: GetStepsDataCommand.self,
                expectedIdentifier: RollaBandStepsDataParser.dataIdentifier,
                entrySize: RollaBandStepsDataParser.entrySize,
                maxPacketsPerPage: 50 * 9,
                timeout: RollaBandDataConstants.defaultTimeout
            )
        case .sleep:
            return try await processor.getRawDataAsHexString(
                deviceUUID: deviceUUID,
                command: GetSleepDataCommand.self,
                expectedIdentifier: RollaBandSleepDataParser.dataIdentifier,
                entrySize: RollaBandSleepDataParser.entrySize,
                maxPacketsPerPage: 50,
                timeout: RollaBandDataConstants.defaultTimeout
            )
        case .heartRate:
            return try await processor.getRawDataAsHexString(
                deviceUUID: deviceUUID,
                command: GetHeartRateDataCommand.self,
                expectedIdentifier: RollaBandHeartRateDataParser.dataIdentifier,
                entrySize: RollaBandHeartRateDataParser.entrySize,
                maxPacketsPerPage: 50 * 24,
                timeout: RollaBandDataConstants.defaultTimeout
            )
        case .activityHeartRate:
            return try await processor.getRawDataAsHexString(
                deviceUUID: deviceUUID,
                command: GetHeartRateDataInActivityCommand.self,
                expectedIdentifier: RollaBandActivityHeartRateDataParser.dataIdentifier,
                entrySize: RollaBandActivityHeartRateDataParser.entrySize,
                maxPacketsPerPage: 50 * 10,
                timeout: RollaBandDataConstants.defaultTimeout
            )
        case .hrv:
            return try await processor.getRawDataAsHexString(
                deviceUUID: deviceUUID,
                command: GetHRVDataCommand.self,
                expectedIdentifier: RollaBandHRVDataParser.dataIdentifier,
                entrySize: RollaBandHRVDataParser.entrySize,
                maxPacketsPerPage: 50 * 16,
                timeout: RollaBandDataConstants.defaultTimeout
            )
        case .custom(let commandByte, let entrySize, let maxPacketsPerPage):
            return try await processor.getRawDataAsHexString(
                deviceUUID: deviceUUID,
                commandByte: commandByte,
                expectedIdentifier: commandByte,
                entrySize: entrySize,
                maxPacketsPerPage: maxPacketsPerPage,
                timeout: RollaBandDataConstants.defaultTimeout
            )
        case .customRead(let commandByte):
            return try await processor.getSingleReadAsHexString(
                deviceUUID: deviceUUID,
                commandByte: commandByte,
                timeout: RollaBandDataConstants.defaultTimeout
            )
        }
    }

    public func executeAll(for deviceId: String) async throws -> String {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let dataTypes: [RawLogDataType] = [
            .steps, .sleep, .heartRate, .activityHeartRate, .hrv,
            .custom(commandByte: 0x76, entrySize: 10, maxPacketsPerPage: 24 * 50),
            .custom(commandByte: 0x77, entrySize: 14, maxPacketsPerPage: 17 * 50),
            .custom(commandByte: 0x58, entrySize: 33, maxPacketsPerPage: 7 * 50),
            .custom(commandByte: 0x59, entrySize: 75, maxPacketsPerPage: 3 * 50),
            .custom(commandByte: 0x5C, entrySize: 25, maxPacketsPerPage: 9 * 50),
            .customRead(commandByte: 0x66),
        ]

        var sections: [String] = []
        for dataType in dataTypes {
            let result: Result<String, Error>
            do {
                result = .success(try await execute(for: deviceId, dataType: dataType))
            } catch {
                result = .failure(error)
            }
            sections.append(formatter.formatSection(header: dataType.description, content: result))
        }

        return sections.joined()
    }
}
