import Foundation

public final class RollaBandChargingStateParser: Sendable {
    private let logger: Logging

    public init(logger: Logging) {
        self.logger = logger
    }

    func parseChargingStateNotification(
        from data: Data,
        deviceUUID: BLEDeviceIdentifier
    ) -> ChargingStateData? {
        let bytes = [UInt8](data)
        
        guard bytes.count >= 2 else {
            logger.warning("Charging state notification too short: \(bytes.count) bytes", category: .deviceInfo)
            return nil
        }
        
        guard bytes[0] == RollaBandCommand.chargingState.rawValue else {
            return nil
        }
        
        let state: ChargingState
        switch bytes[1] {
        case 0x00:
            state = .notCharging
        case 0x01:
            state = .charging
        default:
            logger.warning("Unknown charging state value: \(bytes[1])", category: .deviceInfo)
            return nil
        }
        
        return ChargingStateData(
            state: state,
            deviceUUID: deviceUUID,
            timestamp: Date()
        )
    }
}

