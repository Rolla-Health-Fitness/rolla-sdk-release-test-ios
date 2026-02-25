import Foundation

public struct HeartRateDataEntry: RollaBandDataEntry {
    public let dataNumber: Int
    public let baseTimestamp: Int
    public let heartRate: Int
    
    public init(
        dataNumber: Int,
        baseTimestamp: Int,
        heartRate: Int
    ) {
        self.dataNumber = dataNumber
        self.baseTimestamp = baseTimestamp
        self.heartRate = heartRate
    }
}



