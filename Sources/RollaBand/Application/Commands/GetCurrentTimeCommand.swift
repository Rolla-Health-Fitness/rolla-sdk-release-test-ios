import Foundation

public struct GetCurrentTimeCommand: RollaBandRequestCommand {
    public typealias Output = Date

    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval

    public init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
    }

    public func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws -> Date {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid
        
        let payload = Data(buildGetTimeCommand())
        
        let matcher = RollaBandNotificationMatcher(expectedCommand: .getTime)

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
                    data: payload,
                    writeType: .withResponse,
                    timeout: timeout
                )
            )

            guard let responseData = try await group.next() else {
                throw RollaBandCommandError.noResponse(command: .getTime)
            }

            group.cancelAll()
            let validatedData = try RollaBandValidator.validate(responseData, for: .getTime)
            return try Self.parseUTCDate(from: validatedData)
        }
    }
    
    private func buildGetTimeCommand() -> [UInt8] {
        var bytes = [UInt8](repeating: 0, count: 16)
        bytes[0] = RollaBandCommand.getTime.rawValue
        bytes.withChecksum()
        return bytes
    }
    
    private static func parseUTCDate(from data: Data) throws -> Date {
        let bytes = [UInt8](data)
        guard bytes.count >= 7 else {
            throw RollaBandCommandError.invalidData(
                command: .getTime,
                reason: .emptyResponse,
                raw: data
            )
        }
        
        let year = 2000 + fromBCD(bytes[1])
        let month = fromBCD(bytes[2])
        let day = fromBCD(bytes[3])
        let hour = fromBCD(bytes[4])
        let minute = fromBCD(bytes[5])
        let second = fromBCD(bytes[6])
        
        var comps = DateComponents()
        comps.calendar = Calendar(identifier: .gregorian)
        comps.timeZone = TimeZone(secondsFromGMT: 0)
        comps.year = year
        comps.month = month
        comps.day = day
        comps.hour = hour
        comps.minute = minute
        comps.second = second
        
        guard let date = comps.calendar?.date(from: comps) else {
            throw RollaBandCommandError.invalidData(
                command: .getTime,
                reason: .malformedData,
                raw: data
            )
        }
        return date
    }
}


