import Foundation

public enum StepThresholdType: UInt8, Sendable, CaseIterable {
    case start = 0x8A
    case stop = 0x8F
    
    public var name: String {
        switch self {
        case .start:
            return "Start"
        case .stop:
            return "Stop"
        }
    }
}

public struct SetStepCountThresholdCommand: RollaBandRequestCommand {
    public typealias Output = Void
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    private let thresholdType: StepThresholdType
    
    public init(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        thresholdType: StepThresholdType
    ) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
        self.thresholdType = thresholdType
    }
    
    public func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws -> Void {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid
        
        let command = buildCommand()
        
        try await withThrowingTaskGroup(of: Data?.self) { group in
            group.addTask {
                try await observer.waitForNotification(
                    deviceID: deviceUUID,
                    serviceUUID: serviceUUID,
                    characteristicUUID: notifyUUID,
                    timeout: timeout,
                    matcher: RollaBandNotificationMatcher(expectedCommand: .setStepCountThreshold)
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
                throw RollaBandCommandError.noResponse(command: .setStepCountThreshold)
            }
            
            group.cancelAll()
            try RollaBandValidator.validate(responseData, for: .setStepCountThreshold)
        }
    }
    
    private func buildCommand() -> [UInt8] {
        var command = Array(repeating: UInt8(0), count: 16)
        command[0] = RollaBandCommand.setStepCountThreshold.rawValue
        command[5] = 0x81
        command[6] = thresholdType.rawValue
        command.withChecksum()
        return command
    }
}
