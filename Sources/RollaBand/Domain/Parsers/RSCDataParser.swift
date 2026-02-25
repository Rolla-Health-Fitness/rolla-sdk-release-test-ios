import Foundation

public protocol RSCDataParser: Sendable {
    func parseRSCData(from data: Data, deviceUUID: BLEDeviceIdentifier) -> RunningSpeedCadenceData?
}
