import Foundation

public struct RollaBandValidator {
    @discardableResult
    public static func validate(_ data: Data?, for command: RollaBandCommand) throws -> Data {
        guard let responseData = data else {
            throw RollaBandCommandError.noResponse(command: command)
        }
        
        guard !responseData.isEmpty else {
            throw RollaBandCommandError.invalidData(
                command: command,
                reason: .emptyResponse,
                raw: responseData
            )
        }
        
        guard let statusByte = responseData.first else {
            throw RollaBandCommandError.invalidData(
                command: command,
                reason: .missingStatusByte,
                raw: responseData
            )
        }
        
        guard let status = RollaBandStatusByte(statusByte) else {
            throw RollaBandCommandError.invalidData(
                command: command,
                reason: .unexpectedStatusByte(statusByte),
                raw: responseData
            )
        }
        
        if isSuccessStatus(status, for: command) {
            return responseData
        }
        
        if isFailureStatus(status, for: command) {
            throw RollaBandCommandError.deviceRejectedCommand(
                command: command,
                statusByte: statusByte
            )
        }
        
        throw RollaBandCommandError.unexpectedStatus(
            command: command,
            expected: getExpectedStatuses(for: command),
            actual: status
        )
    }
    
    public static func matches(_ data: Data?, for command: RollaBandCommand) -> Bool {
        guard let data = data, !data.isEmpty,
              let statusByte = data.first,
              let status = RollaBandStatusByte(statusByte) else {
            return false
        }
        
        return isSuccessStatus(status, for: command) || isFailureStatus(status, for: command)
    }
    
    private static func isSuccessStatus(_ status: RollaBandStatusByte, for command: RollaBandCommand) -> Bool {
        switch command {
        case .handshake:
            return status == .handshakeSuccess
        case .getTime:
            return status == .getTimeSuccess
        case .setTime:
            return status == .setTimeSuccess
        case .setStepCountThreshold:
            return status == .setStepCountThresholdSuccess
        case .getAutomaticDetection:
            return status == .getAutomaticDetectionSuccess
        case .setAutomaticDetection:
            return status == .setAutomaticDetectionSuccess
        case .activityControl:
            return status == .activityControlSuccess
        case .reminderControl:
            return status == .reminderControlSuccess
        case .getUserInfo:
            return status == .getUserInfoSuccess
        case .setUserInfo:
            return status == .setUserInfoSuccess
        case .otaUpdate:
            return status == .otaUpdateSuccess
        case .factoryReset:
            return status == .factoryResetSuccess
        case .getStepsData:
            return false
        case .getSleepData:
            return false
        case .getActivityHeartRateData:
            return false
        case .getHeartRateData:
            return false
        case .getHRVData:
            return false
        case .batteryLevel:
            return status == .batteryLevelSuccess
        case .chargingState:
            return false
        case .getMotionData:
            return false
        case .setMotionSavingInterval:
            return status == .setMotionSavingIntervalSuccess
        }
    }
    
    private static func isFailureStatus(_ status: RollaBandStatusByte, for command: RollaBandCommand) -> Bool {
        switch command {
        case .handshake:
            return status == .handshakeFailure
        case .getTime:
            return status == .getTimeFailure
        case .setTime:
            return status == .getTimeFailure
        case .setStepCountThreshold:
            return status == .setStepCountThresholdFailure
        case .getAutomaticDetection:
            return status == .getAutomaticDetectionFailure
        case .setAutomaticDetection:
            return status == .setAutomaticDetectionFailure
        case .activityControl:
            return status == .activityControlFailure
        case .reminderControl:
            return status == .reminderControlFailure
        case .getUserInfo:
            return status == .getUserInfoFailure
        case .setUserInfo:
            return status == .setUserInfoFailure
        case .otaUpdate:
            return status == .otaUpdateFailure
        case .factoryReset:
            return status == .factoryResetFailure
        case .getStepsData:
            return false
        case .getSleepData:
            return false
        case .getActivityHeartRateData:
            return false
        case .getHeartRateData:
            return false
        case .getHRVData:
            return false
        case .batteryLevel:
            return false
        case .chargingState:
            return false
        case .getMotionData:
            return false
        case .setMotionSavingInterval:
            return false
        }
    }
    
    private static func getExpectedStatuses(for command: RollaBandCommand) -> [RollaBandStatusByte] {
        switch command {
        case .handshake:
            return [.handshakeSuccess, .handshakeFailure]
        case .getTime:
            return [.getTimeSuccess, .getTimeFailure]
        case .setTime:
            return [.setTimeSuccess, .setTimeFailure]
        case .setStepCountThreshold:
            return [.setStepCountThresholdSuccess, .setStepCountThresholdFailure]
        case .getAutomaticDetection:
            return [.getAutomaticDetectionSuccess, .getAutomaticDetectionFailure]
        case .setAutomaticDetection:
            return [.setAutomaticDetectionSuccess, .setAutomaticDetectionFailure]
        case .activityControl:
            return [.activityControlSuccess, .activityControlFailure]
        case .reminderControl:
            return [.reminderControlSuccess, .reminderControlFailure]
        case .getUserInfo:
            return [.getUserInfoSuccess, .getUserInfoFailure]
        case .setUserInfo:
            return [.setUserInfoSuccess, .setUserInfoFailure]
        case .otaUpdate:
            return [.otaUpdateSuccess, .otaUpdateFailure]
        case .factoryReset:
            return [.factoryResetSuccess, .factoryResetFailure]
        case .getStepsData:
            return []
        case .getSleepData:
            return []
        case .getActivityHeartRateData:
            return []
        case .getHeartRateData:
            return []
        case .getHRVData:
            return []
        case .batteryLevel:
            return [.batteryLevelSuccess]
        case .chargingState:
            return []
        case .getMotionData:
            return []
        case .setMotionSavingInterval:
            return [.setMotionSavingIntervalSuccess]
        }
    }
}
