import Foundation

struct FactoryResetCommand: RollaBandRequestCommand {
    typealias Output = Void
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    
    init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
    }
    
    func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid
        
        let command = buildCommand()
        
        let matcher = RollaBandNotificationMatcher(expectedCommand: .factoryReset)
        
        try await withThrowingTaskGroup(of: Data?.self) { group in
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
                throw RollaBandCommandError.noResponse(command: .factoryReset)
            }
            
            group.cancelAll()
            _ = try RollaBandValidator.validate(responseData, for: .factoryReset)
        }
    }
    
    private func buildCommand() -> Data {
        var bytes = [UInt8](repeating: 0, count: 16)
        bytes[0] = RollaBandCommand.factoryReset.rawValue
        bytes.withChecksum()
        return Data(bytes)
    }
}

