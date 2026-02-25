import Foundation

public struct RollaBandHeartRateInActivityDataParser: HeartRateDataParser {
    public init() {}

    public func parseRollaBandHeartRateData(from data: Data, deviceUUID: BLEDeviceIdentifier) -> HeartRateData? {
        guard !data.isEmpty else {
            return nil
        }

        let bytes = [UInt8](data)

        guard bytes.count >= 2 else {
            return nil
        }
        
        guard bytes[0] == 0x18 else {
            return nil
        }
        
        let heartRate = Int(bytes[1])

        guard heartRate > 0 && heartRate <= 255 else {
            return nil
        }

        let heartRateData = HeartRateData(
            deviceUUID: deviceUUID,
            heartRate: heartRate,
            timestamp: Date()
        )

        return heartRateData
    }
}
