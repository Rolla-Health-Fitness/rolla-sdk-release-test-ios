import Foundation

public enum RollaBandStatusByte: UInt8, Sendable {
    // Handshake
    case handshakeSuccess = 0x33
    case handshakeFailure = 0xC3

    // Get Time
    case getTimeSuccess = 0x41
    case getTimeFailure = 0xC1
    
    // Set Time
    case setTimeSuccess = 0x01
    case setTimeFailure = 0x81

    // Set Step Count Threshold
    case setStepCountThresholdSuccess = 0x03
    case setStepCountThresholdFailure = 0x83

    // Activity Data
    case activityControlSuccess = 0x19
    case activityControlFailure = 0xA6

    // Reminder Control
    case reminderControlSuccess = 0x16
    case reminderControlFailure = 0x96
    
    // Get Automatic detection
    case getAutomaticDetectionSuccess = 0x2B
    case getAutomaticDetectionFailure = 0xAB

    // Set Automatic detection
    case setAutomaticDetectionSuccess = 0x2A
    case setAutomaticDetectionFailure = 0xAA

    // Get User Info
    case getUserInfoSuccess = 0x42
    case getUserInfoFailure = 0xC2

    // Set User Info
    case setUserInfoSuccess = 0x02
    case setUserInfoFailure = 0x82

    // OTA Update
    case otaUpdateSuccess = 0x47
    case otaUpdateFailure = 0xC7

    // Factory Reset
    case factoryResetSuccess = 0x12
    case factoryResetFailure = 0x92

    case batteryLevelSuccess = 0x13

    // Set Motion Saving Interval
    case setMotionSavingIntervalSuccess = 0x78

    init?(_ byte: UInt8) {
        self.init(rawValue: byte)
    }
}
