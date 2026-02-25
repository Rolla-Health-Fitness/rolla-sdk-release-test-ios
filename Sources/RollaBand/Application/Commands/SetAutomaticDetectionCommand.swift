import Foundation

struct AutomaticDetectionSettings: Sendable {
    let workMode: WorkMode
    let startHour: UInt8
    let startMinute: UInt8
    let endHour: UInt8
    let endMinute: UInt8
    let weekDays: WeekDays
    let intervalMinutes: UInt16
    let modeType: AutomaticModeType
    
    init(
        workMode: WorkMode = .intervalWithinTimePeriod,
        startHour: UInt8 = 0x00,
        startMinute: UInt8 = 0x00,
        endHour: UInt8 = 0x23,
        endMinute: UInt8 = 0x59,
        weekDays: WeekDays = .allDays,
        intervalMinutes: UInt16? = nil,
        modeType: AutomaticModeType
    ) {
        self.workMode = workMode
        self.startHour = startHour
        self.startMinute = startMinute
        self.endHour = endHour
        self.endMinute = endMinute
        self.weekDays = weekDays
        self.intervalMinutes = intervalMinutes ?? modeType.timeInterval
        self.modeType = modeType
    }
}

enum AutomaticModeType: UInt8, Sendable, CaseIterable {
    case heartRate = 0x01
    case hrv = 0x04
    
    var name: String {
        switch self {
        case .heartRate:
            return "Heart Rate"
        case .hrv:
            return "HRV"
        }
    }
    
    var timeInterval: UInt16 {
        switch self {
        case .heartRate:
            return 10
        case .hrv:
            return 10
        }
    }
    
    public var value: UInt8 {
        return self.rawValue
    }
}

enum WorkMode: UInt8, Sendable {
    case off = 0x00
    case timePeriod = 0x01
    case intervalWithinTimePeriod = 0x02
}

struct WeekDays: OptionSet, Sendable {
    let rawValue: UInt8
    
    init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
    
    static let sunday = WeekDays(rawValue: 1 << 0)
    static let monday = WeekDays(rawValue: 1 << 1)
    static let tuesday = WeekDays(rawValue: 1 << 2)
    static let wednesday = WeekDays(rawValue: 1 << 3)
    static let thursday = WeekDays(rawValue: 1 << 4)
    static let friday = WeekDays(rawValue: 1 << 5)
    static let saturday = WeekDays(rawValue: 1 << 6)
    
    static let allDays: WeekDays = WeekDays(rawValue: 0xFF)
    static let weekdays: WeekDays = [.monday, .tuesday, .wednesday, .thursday, .friday]
    static let weekend: WeekDays = [.saturday, .sunday]
}

extension AutomaticDetectionSettings {
    static func create(
        workMode: WorkMode = .intervalWithinTimePeriod,
        startHour: UInt8 = 0,
        startMinute: UInt8 = 0,
        endHour: UInt8 = 23,
        endMinute: UInt8 = 59,
        weekDays: WeekDays = .allDays,
        intervalMinutes: UInt16? = nil,
        modeType: AutomaticModeType
    ) -> AutomaticDetectionSettings {
        return AutomaticDetectionSettings(
            workMode: workMode,
            startHour: toBCD(Int(startHour)),
            startMinute: toBCD(Int(startMinute)),
            endHour: toBCD(Int(endHour)),
            endMinute: toBCD(Int(endMinute)),
            weekDays: weekDays,
            intervalMinutes: intervalMinutes,
            modeType: modeType
        )
    }
}


struct SetAutomaticDetectionCommand: RollaBandRequestCommand {
    typealias Output = Void
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    private let settings: AutomaticDetectionSettings
    
    init(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        settings: AutomaticDetectionSettings
    ) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
        self.settings = settings
    }
    
    func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws -> Void {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid
        
        let command = buildCommand()
        let matcher = RollaBandNotificationMatcher(expectedCommand: .setAutomaticDetection)
        
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
                    data: Data(command),
                    writeType: .withResponse,
                    timeout: timeout
                )
            )
            
            guard let responseData = try await group.next() else {
                throw RollaBandCommandError.noResponse(command: .setAutomaticDetection)
            }
            
            group.cancelAll()
            try RollaBandValidator.validate(responseData, for: .setAutomaticDetection)
        }
    }
    
    private func buildCommand() -> [UInt8] {
        var command = Array(repeating: UInt8(0), count: 16)
        command[0] = RollaBandCommand.setAutomaticDetection.rawValue
        command[1] = settings.workMode.rawValue
        command[2] = settings.startHour
        command[3] = settings.startMinute
        command[4] = settings.endHour
        command[5] = settings.endMinute
        command[6] = settings.weekDays.rawValue
        command[7] = UInt8(settings.intervalMinutes & 0xFF)        // GG - low byte
        command[8] = UInt8((settings.intervalMinutes >> 8) & 0xFF) // HH - high byte
        command[9] = settings.modeType.value
        command.withChecksum()
        return command
    }
}
