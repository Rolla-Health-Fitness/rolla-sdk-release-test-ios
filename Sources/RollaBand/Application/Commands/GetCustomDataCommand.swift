import Foundation

public enum CustomCommandType: UInt8, RollaBandReadCommandType {
    case readRecent = 0x00
    case continueReading = 0x02
}

public struct GetCustomDataCommand: Sendable {
    public let deviceUUID: BLEDeviceIdentifier
    public let timeout: TimeInterval
    public let commandByte: UInt8
    public let commandType: CustomCommandType

    public init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval, commandByte: UInt8, commandType: CustomCommandType) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
        self.commandByte = commandByte
        self.commandType = commandType
    }

    public func execute(using commandExecutor: CommandExecutor) async throws {
        var bytes = [UInt8](repeating: 0, count: 16)
        bytes[0] = commandByte
        bytes[1] = commandType.rawValue
        bytes.withChecksum()

        try await commandExecutor.execute(
            WriteCommand(
                deviceID: deviceUUID,
                serviceUUID: BLEServiceType.rollaBand.uuid,
                characteristicUUID: BLECharacteristicType.rollaBandWriteCommand.uuid,
                data: Data(bytes),
                writeType: .withoutResponse,
                timeout: timeout
            )
        )
    }
}
