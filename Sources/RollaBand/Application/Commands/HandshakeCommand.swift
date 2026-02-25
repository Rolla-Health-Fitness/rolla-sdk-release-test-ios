import Foundation

public struct HandshakeCommand: RollaBandRequestCommand {
    public typealias Output = Data
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    
    public init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
    }
    
    public func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws -> Data {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid

        let command = builCommand()

        let matcher = RollaBandNotificationMatcher(expectedCommand: .handshake)

        return try await withThrowingTaskGroup(of: Data?.self) { group in
            group.addTask {
                try await observer.waitForNotification(
                    deviceID: deviceUUID,
                    serviceUUID: serviceUUID,
                    characteristicUUID: notifyUUID,
                    timeout: timeout,
                    matcher: matcher
                )
            }

            try await commandExecutor.execute(
                WriteCommand(
                    deviceID: deviceUUID,
                    serviceUUID: serviceUUID,
                    characteristicUUID: writeUUID,
                    data: command,
                    writeType: .withResponse,
                    timeout: timeout
                )
            )

            guard let responseData = try await group.next() else {
                throw RollaBandCommandError.noResponse(command: .handshake)
            }

            group.cancelAll()
            return try RollaBandValidator.validate(responseData, for: .handshake)
        }
    }
    
    private func builCommand() -> Data {
        var bytes = [UInt8](repeating: 0, count: 16)
        bytes[0] = RollaBandCommand.handshake.rawValue
        bytes[1] = 0x01
        bytes.withChecksum()
        return Data(bytes)
    }
}
