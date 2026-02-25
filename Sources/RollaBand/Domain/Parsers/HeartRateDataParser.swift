import Foundation

public protocol HeartRateDataParser: Sendable {
    func parseRollaBandHeartRateData(from data: Data, deviceUUID: BLEDeviceIdentifier) -> HeartRateData?
}
