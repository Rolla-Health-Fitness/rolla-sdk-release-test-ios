import Foundation

public struct SetCurrentTimeCommand: RollaBandRequestCommand {
    public typealias Output = Void
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    private let date: Date
    
    public init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval, date: Date = Date()) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
        self.date = date
    }
    
    public func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid
        
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0) ?? TimeZone(abbreviation: "UTC") ?? .current
        
        let dc = cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let yearYY = (dc.year ?? 2000) % 100
        
        var command = [UInt8](repeating: 0, count: 16)
        command[0] = RollaBandCommand.setTime.rawValue
        command[1] = toBCD(yearYY)
        command[2] = toBCD(dc.month  ?? 0)
        command[3] = toBCD(dc.day    ?? 0)
        command[4] = toBCD(dc.hour   ?? 0)
        command[5] = toBCD(dc.minute ?? 0)
        command[6] = toBCD(dc.second ?? 0)
        command.withChecksum()
        
        try await withThrowingTaskGroup(of: Data?.self) { group in
            group.addTask {
                try await observer.waitForNotification(
                    deviceID: deviceUUID,
                    serviceUUID: serviceUUID,
                    characteristicUUID: notifyUUID,
                    timeout: timeout,
                    matcher: RollaBandNotificationMatcher(expectedCommand: .setTime)
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

            guard let responseData = try await group.next() else {
                throw RollaBandCommandError.noResponse(command: .setTime)
            }

            group.cancelAll()
            try RollaBandValidator.validate(responseData, for: .setTime)
        }
    }
}
