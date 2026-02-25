import Foundation

public enum ActivityControlResult: Sendable {
    case started(workoutConfirmed: Bool)
    case stopped(workoutConfirmed: Bool)
    case alreadyActive
    case alreadyInactive
}

public enum ActivityMode: UInt8, Sendable {
    case start = 0x01
    case stop = 0x04
}

public struct ActivityControlCommand: RollaBandRequestCommand {
    public typealias Output = ActivityControlResult

    let deviceUUID: BLEDeviceIdentifier
    let timeout: TimeInterval
    let mode: ActivityMode
    let activityType: RollaBandWorkoutType
    let fireAndForget: Bool

    public init(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        mode: ActivityMode,
        activityType: RollaBandWorkoutType,
        fireAndForget: Bool = false
    ) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
        self.mode = mode
        self.activityType = activityType
        self.fireAndForget = fireAndForget
    }
    
    public func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws -> ActivityControlResult {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let notifyUUID = BLECharacteristicType.rollaBandNotification.uuid

        let command = buildCommand()

        if fireAndForget {
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

            switch mode {
            case .start:
                return .started(workoutConfirmed: false)
            case .stop:
                return .stopped(workoutConfirmed: false)
            }
        }

        return try await withThrowingTaskGroup(of: (ActivityControlResult?, Bool).self) { group in
            var controlResult: ActivityControlResult?
            var workoutConfirmed = false

            group.addTask { [deviceUUID, mode] in
                let (notificationStream, streamId) = await observer.observeNotifications(
                    deviceID: deviceUUID,
                    serviceUUID: serviceUUID,
                    characteristicUUID: notifyUUID
                )

                defer {
                    Task {
                        await observer.stopObservingNotifications(id: streamId)
                    }
                }

                var controlReceived: ActivityControlResult?
                var workoutReceived = false

                for await data in notificationStream {
                    if data.count >= 2 &&
                        (data[0] == RollaBandStatusByte.activityControlSuccess.rawValue || data[0] == RollaBandStatusByte.activityControlFailure.rawValue)
                    {
                        do {
                            controlReceived = try parseActivityControlResponse(data, mode: mode)
                        } catch {
                            return (nil, false)
                        }
                    }

                    if data.count >= 3 && data[0] == 0x16 && data[1] == 0x06 {
                        let expectedStatus: UInt8 = mode == .start ? 0x01 : 0x00
                        if data[2] == expectedStatus {
                            workoutReceived = true
                        }
                    }

                    if let control = controlReceived {
                        if case .alreadyActive = control, mode == .start {
                            return (control, workoutReceived)
                        }
                        if case .alreadyInactive = control, mode == .stop {
                            return (control, workoutReceived)
                        }

                        if workoutReceived {
                            return (control, true)
                        }
                    }
                }

                return (controlReceived, workoutReceived)
            }
            
            group.addTask {
                try await Task.sleep(nanoseconds: 100_000_000)

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

                return (nil, false)
            }
            
            group.addTask {
                try await Task.sleep(nanoseconds: UInt64(timeout * 1_000_000_000))
                return (nil, false)
            }
            
            for try await (control, workout) in group {
                if let control = control {
                    controlResult = control
                    workoutConfirmed = workout
                    break
                }
            }
            
            group.cancelAll()
            
            guard let result = controlResult else {
                throw RollaBandCommandError.noResponse(command: .activityControl)
            }
            
            switch result {
            case .started:
                return .started(workoutConfirmed: workoutConfirmed)
            case .stopped:
                return .stopped(workoutConfirmed: workoutConfirmed)
            default:
                return result
            }
        }
    }
    
    private func buildCommand() -> Data {
        var bytes = [UInt8](repeating: 0, count: 16)
        bytes[0] = RollaBandCommand.activityControl.rawValue
        bytes[1] = mode.rawValue
        bytes[2] = activityType.code
        bytes.withChecksum()
        return Data(bytes)
    }
    
    private func parseActivityControlResponse(_ data: Data?, mode: ActivityMode) throws -> ActivityControlResult {
        guard let data else {
            throw RollaBandCommandError.noResponse(command: .activityControl)
        }
        
        let validatedData = try RollaBandValidator.validate(data, for: .activityControl)
        
        guard validatedData.count >= 2 else {
            throw RollaBandCommandError.responseTooShort(
                command: .activityControl,
                expected: 2,
                actual: validatedData.count
            )
        }
        
        let statusByte = validatedData[1]
        
        switch statusByte {
        case 0x01:
            switch mode {
            case .start:
                return .started(workoutConfirmed: false)
            case .stop:
                return .stopped(workoutConfirmed: false)
            }
            
        case 0x00:
            switch mode {
            case .start:
                return .alreadyActive
            case .stop:
                return .alreadyInactive
            }
            
        default:
            throw RollaBandCommandError.invalidStatusByte(
                command: .activityControl,
                statusByte: statusByte,
                raw: data
            )
        }
    }
}
