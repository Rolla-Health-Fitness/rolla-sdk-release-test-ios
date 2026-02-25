import Foundation

public struct HRVDataEntry: RollaBandDataEntry {
    public let dataNumber: Int
    public let baseTimestamp: Int
    public let hrvValue: Int
//    let fatigueLevel: Int
//    let systolicBP: Int
//    let diastolicBP: Int
    
    public init(
        dataNumber: Int,
        baseTimestamp: Int,
        hrvValue: Int
//        fatigueLevel: Int,
//        systolicBP: Int,
//        diastolicBP: Int
    ) {
        self.dataNumber = dataNumber
        self.baseTimestamp = baseTimestamp
        self.hrvValue = hrvValue
//        self.fatigueLevel = fatigueLevel
//        self.systolicBP = systolicBP
//        self.diastolicBP = diastolicBP
    }
}
