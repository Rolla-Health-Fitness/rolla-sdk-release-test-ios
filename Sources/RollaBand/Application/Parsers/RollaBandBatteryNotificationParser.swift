import Foundation

public final class RollaBandBatteryNotificationParser: Sendable {
    private let logger: Logging
    
    public init(logger: Logging) {
        self.logger = logger
    }
    
    func parseBatteryNotification(from data: Data, deviceUUID: BLEDeviceIdentifier) -> BatteryLevelData? {
        let bytes = data.bytes

        guard bytes.count >= 2 else {
            return nil
        }

        let commandByte = bytes[0]
        let expectedCommand = RollaBandCommand.batteryLevel.rawValue

        guard commandByte == expectedCommand else {
            return nil
        }

        let batteryLevel = Int(bytes[1])

        guard batteryLevel >= 0 && batteryLevel <= 100 else {
            return nil
        }

        return BatteryLevelData(
            deviceUUID: deviceUUID,
            batteryLevel: batteryLevel
        )
    }
}
