import Foundation

public enum RollaBandCommand: UInt8, Sendable {
    case handshake = 0x33
    case getTime = 0x41
    case setTime = 0x01
    case setStepCountThreshold = 0x03
    case activityControl = 0x19
    case reminderControl = 0x16
    case setAutomaticDetection = 0x2A
    case getAutomaticDetection = 0x2B
    case getUserInfo = 0x42
    case setUserInfo = 0x02
    case otaUpdate = 0x47
    case getStepsData = 0x52
    case getSleepData = 0x53
    case getActivityHeartRateData = 0x54
    case getHeartRateData = 0x55
    case getHRVData = 0x56
    case factoryReset = 0x12
    case batteryLevel = 0x13
    case chargingState = 0x20
    case getMotionData = 0x77
    case setMotionSavingInterval = 0x78
}

extension RollaBandCommand {
    public var name: String {
        switch self {
        case .handshake:
            return "handshake"
        case .activityControl:
            return "activity control"
        case .reminderControl:
            return "reminder control"
        case .getTime:
            return "get time"
        case .setTime:
            return "set time"
        case .setStepCountThreshold:
            return "set step count threshold"
        case .getAutomaticDetection:
            return "get automatic detection"
        case .setAutomaticDetection:
            return "set automatic detection"
        case .getUserInfo:
            return "get user info"
        case .setUserInfo:
            return "set user info"
        case .otaUpdate:
            return "ota update"
        case .getStepsData:
            return "get steps data"
        case .getSleepData:
            return "get sleep data"
        case .getActivityHeartRateData:
            return "get activity heart rate data"
        case .getHeartRateData:
            return "get heart rate data"
        case .getHRVData:
            return "get HRV data"
        case .factoryReset:
            return "factory reset"
        case .batteryLevel:
            return "battery level"
        case .chargingState:
            return "charging state"
        case .getMotionData:
            return "get motion data"
        case .setMotionSavingInterval:
            return "set motion saving interval"
        }
    }
}
