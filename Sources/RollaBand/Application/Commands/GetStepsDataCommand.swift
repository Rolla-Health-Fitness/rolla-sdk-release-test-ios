import Foundation

public enum StepsCommandType: UInt8, RollaBandReadCommandType {
    case readRecent = 0x00
    case continueReading = 0x02
}

public struct GetStepsDataCommand: RollaBandDataCommand {
    public typealias PageType = StepsCommandType
    public typealias Output = Void

    public let deviceUUID: BLEDeviceIdentifier
    public let timeout: TimeInterval
    public let commandType: StepsCommandType
    public let baseTimestamp: Int?

    public init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval, commandType: StepsCommandType, baseTimestamp: Int?) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
        self.commandType = commandType
        self.baseTimestamp = baseTimestamp
    }
    
    public func execute(using commandExecutor: CommandExecutor) async throws {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid

        let command = buildCommand()

        try await commandExecutor.execute(
            WriteCommand(
                deviceID: deviceUUID,
                serviceUUID: serviceUUID,
                characteristicUUID: writeUUID,
                data: command,
                writeType: .withoutResponse,
                timeout: timeout
            )
        )
    }
    
    private func buildCommand() -> Data {
        var bytes = [UInt8](repeating: 0, count: 16)
        bytes[0] = RollaBandCommand.getStepsData.rawValue
        bytes[1] = commandType.rawValue

        if let baseTimestamp {
            bytes.fillTimestamp(from: baseTimestamp)
        }

        bytes.withChecksum()
        return Data(bytes)
    }
}
