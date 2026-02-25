import Foundation

public struct ActivityHeartRateDataEntry: RollaBandDataEntry {
    public let dataNumber: Int
    public let baseTimestamp: Int
    public let heartRates: [HeartRate]
    
    public init(
        dataNumber: Int,
        baseTimestamp: Int,
        heartRates: [HeartRate]
    ) {
        self.dataNumber = dataNumber
        self.baseTimestamp = baseTimestamp
        self.heartRates = heartRates
    }
}




