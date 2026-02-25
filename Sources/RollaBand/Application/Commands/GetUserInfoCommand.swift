import Foundation

public struct GetUserInfoCommand: RollaBandRequestCommand {
    public typealias Output = UserInfo
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    private let firmwareVersion: String?
    
    public init(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        firmwareVersion: String? = nil
    ) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
        self.firmwareVersion = firmwareVersion
    }
    
    public func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws -> UserInfo {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid
        
        let command = buildCommand()
        
        let matcher = RollaBandNotificationMatcher(expectedCommand: .getUserInfo)

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
                throw RollaBandCommandError.noResponse(command: .getUserInfo)
            }

            group.cancelAll()
            let validatedData = try RollaBandValidator.validate(responseData, for: .getUserInfo)
            return try parseUserInfo(from: validatedData, firmwareVersion: firmwareVersion)
        }
    }
    
    private func buildCommand() -> Data {
        var bytes = [UInt8](repeating: 0, count: 16)
        bytes[0] = RollaBandCommand.getUserInfo.rawValue
        bytes.withChecksum()
        return Data(bytes)
    }
    
    private func parseUserInfo(from responseData: Data, firmwareVersion: String?) throws -> UserInfo {
        guard responseData.hasMinimumLength(12) else {
            throw RollaBandCommandError.noResponse(command: .getUserInfo)
        }
        
        var parser = BLEDataParser(data: responseData)
        
        _ = parser.readUInt8()
        
        guard let genderByte = parser.readUInt8(),
              let age = parser.readUInt8(),
              let height = parser.readUInt8() else {
            throw RollaBandCommandError.noResponse(command: .getUserInfo)
        }
        
        let gender = Gender(rawValue: genderByte) ?? .female
        
        let weight: Double
        if let fw = firmwareVersion, shouldUseFloatWeight(fwString: fw) {
            weight = parser.readDoubleFromFloatLE() ?? Double(parser.readUInt8() ?? 0)
        } else {
            weight = Double(parser.readUInt8() ?? 0)
        }
        
//        guard let stepLength = parser.readUInt8() else {
//            throw RollaBandCommandError.noResponse(command: .getUserInfo)
//        }
        
//        guard let deviceIdBytes = parser.readBytes(count: 6) else {
//            throw RollaBandCommandError.noResponse(command: .getUserInfo)
//        }
        
        //let filteredDeviceIdBytes = deviceIdBytes.filter { $0 != 0x00 }
        // let deviceId = Data(filteredDeviceIdBytes)
        
        return UserInfo(
            gender: gender,
            age: Int(age),
            height: Int(height),
            weight: weight
        )
    }
    
    /// Determines if the firmware version supports float weight format
    /// Expects firmware string like "V_30353637-250418"
    private func shouldUseFloatWeight(fwString: String) -> Bool {
        guard !fwString.isEmpty,
              let suffix = fwString.split(separator: "-").last,
              suffix.count == 6 else {
            return false
        }
        
        let str = String(suffix)  // "250418"
        guard let yy = Int(str.prefix(2)),
              let mm = Int(str.dropFirst(2).prefix(2)),
              let dd = Int(str.dropFirst(4).prefix(2)) else {
            return false
        }
        
        return (yy, mm, dd) >= (25, 4, 18)
    }
}
