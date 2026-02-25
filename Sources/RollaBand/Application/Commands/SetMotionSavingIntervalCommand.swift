import Foundation

public struct SetMotionSavingIntervalCommand: RollaBandRequestCommand {
    public typealias Output = UInt8
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    private let intervalSeconds: UInt8
    
    public init(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        intervalSeconds: UInt8
    ) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
        self.intervalSeconds = intervalSeconds
    }
    
    public func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws -> UInt8 {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid
        
        let command = buildCommand()
        
        return try await withThrowingTaskGroup(of: Data?.self) { group in
            group.addTask {
                try await observer.waitForNotification(
                    deviceID: deviceUUID,
                    serviceUUID: serviceUUID,
                    characteristicUUID: notifyUUID,
                    timeout: timeout,
                    matcher: RollaBandNotificationMatcher(expectedCommand: .setMotionSavingInterval)
                )
            }
            
            try await commandExecutor.execute(
                WriteCommand(
                    deviceID: deviceUUID,
                    serviceUUID: serviceUUID,
                    characteristicUUID: writeUUID,
                    data: Data(command),
                    writeType: .withResponse,
                    timeout: timeout
                )
            )
            
            guard let result = try await group.next(), let responseData = result else {
                throw RollaBandCommandError.noResponse(command: .setMotionSavingInterval)
            }

            group.cancelAll()
            try RollaBandValidator.validate(responseData, for: .setMotionSavingInterval)

            let bytes = [UInt8](responseData)
            guard bytes.count >= 2 else {
                throw RollaBandCommandError.invalidData(
                    command: .setMotionSavingInterval,
                    reason: .responseTooShort(expected: 2, actual: bytes.count),
                    raw: responseData
                )
            }

            if bytes[1] == 0xFF {
                throw RollaBandCommandError.deviceRejectedCommand(
                    command: .setMotionSavingInterval,
                    statusByte: bytes[1]
                )
            }

            return bytes[1]
        }
    }
    
    private func buildCommand() -> [UInt8] {
        var command = Array(repeating: UInt8(0), count: 16)
        command[0] = RollaBandCommand.setMotionSavingInterval.rawValue
        command[1] = 0x01
        command[2] = intervalSeconds
        command.withChecksum()
        return command
    }
}

