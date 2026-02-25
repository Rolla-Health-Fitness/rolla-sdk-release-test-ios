import Foundation

public struct SetUserInfoCommand: RollaBandRequestCommand {
    public typealias Output = Void
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    private let userInfo: UserInfo
    private let firmwareVersion: String?
    
    public init(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        userInfo: UserInfo,
        firmwareVersion: String? = nil
    ) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
        self.userInfo = userInfo
        self.firmwareVersion = firmwareVersion
    }
    
    public func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid
        
        let command = buildCommand()
        
        let matcher = RollaBandNotificationMatcher(expectedCommand: .setUserInfo)

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
                throw RollaBandCommandError.noResponse(command: .setUserInfo)
            }

            group.cancelAll()
            try RollaBandValidator.validate(responseData, for: .setUserInfo)
        }
    }
    
    private func buildCommand() -> Data {
        var bytes = [UInt8](repeating: 0, count: 16)
        bytes[0] = RollaBandCommand.setUserInfo.rawValue
        bytes[1] = userInfo.gender.rawValue
        bytes[2] = UInt8(clamping: userInfo.age)
        bytes[3] = UInt8(clamping: userInfo.height)

        if let firmwareVersion = firmwareVersion, shouldUseFloatWeight(firmwareVersion: firmwareVersion) {
            let floatWeight = Float(userInfo.weight)
            let weightBytes = floatWeight.bitPattern.littleEndianBytes
            bytes[4] = weightBytes[0]
            bytes[5] = weightBytes[1]
            bytes[6] = weightBytes[2]
            bytes[7] = weightBytes[3]
        } else {
            bytes[4] = UInt8(clamping: Int(userInfo.weight))
        }

        bytes.withChecksum()
        return Data(bytes)
    }
    
    /// Determines if the firmware version supports float weight format
    /// Expects firmware string like "V_30353637-250418"
    private func shouldUseFloatWeight(firmwareVersion: String) -> Bool {
        guard !firmwareVersion.isEmpty,
              let suffix = firmwareVersion.split(separator: "-").last,
              suffix.count == 6 else {
            return false
        }
        
        let dateString = String(suffix)  // "250418"
        guard
            let yy = Int(dateString.prefix(2)),
            let mm = Int(dateString.dropFirst(2).prefix(2)),
            let dd = Int(dateString.dropFirst(4).prefix(2))
        else {
            return false
        }
        
        return (yy, mm, dd) >= (25, 4, 18)
    }
}

private extension UInt32 {
    var littleEndianBytes: [UInt8] {
        return [
            UInt8(self & 0xFF),
            UInt8((self >> 8) & 0xFF),
            UInt8((self >> 16) & 0xFF),
            UInt8((self >> 24) & 0xFF)
        ]
    }
}
