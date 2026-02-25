import Foundation

private enum RSCFlags {
    static let strideLengthPresent: UInt8 = 0x01
    static let totalDistancePresent: UInt8 = 0x02
    static let runningStatus: UInt8 = 0x04        
}

private enum RSCConstants {
    static let speedScaleFactor: Double = 256.0     // 1/256 m/s per bit
}

public final class DefaultRSCDataParser: RSCDataParser {
    public init() {}

    public func parseRSCData(from data: Data, deviceUUID: BLEDeviceIdentifier) -> RunningSpeedCadenceData? {
        guard !data.isEmpty, data.count >= 4 else {
            return nil
        }
        
        let bytes = Array(data)
        var parser = BLEDataParser(bytes: bytes)

        guard
            let flags = parser.readUInt8(),  // Read flags byte to advance parser position
            let speed = parseInstantaneousSpeed(from: &parser),
            let cadence = parseInstantaneousCadence(from: &parser)
        else {
            return nil
        }

        _ = flags
        
        //        let strideLength = parseOptionalStrideLength(flags: flags, parser: &parser)
        //        let totalDistance = parseOptionalTotalDistance(flags: flags, parser: &parser)
        //        let isRunning = (flags & RSCFlags.runningStatus) != 0
        
        return createRSCData(
            deviceUUID: deviceUUID,
            speed: speed,
            cadence: cadence
            //            strideLength: strideLength,
            //            totalDistance: totalDistance,
            //            isRunning: isRunning
        )
    }
}

private extension DefaultRSCDataParser {
    func parseInstantaneousSpeed(from parser: inout BLEDataParser) -> Double? {
        guard let rawSpeed = parser.readUInt16LE() else { return nil }
        let speedMs = Double(rawSpeed) / RSCConstants.speedScaleFactor  // Convert to m/s
        return speedMs * 3.6  // Convert to km/h
    }
    
    func parseInstantaneousCadence(from parser: inout BLEDataParser) -> Int? {
        guard let rawCadence = parser.readUInt8() else { return nil }
        return Int(rawCadence)
    }
    
    func parseOptionalStrideLength(flags: UInt8, parser: inout BLEDataParser) -> Int? {
        guard (flags & RSCFlags.strideLengthPresent) != 0,
              let rawStrideLength = parser.readUInt16LE() else {
            return nil
        }
        return Int(rawStrideLength) // in centimeters
    }
    
    func parseOptionalTotalDistance(flags: UInt8, parser: inout BLEDataParser) -> UInt32? {
        guard (flags & RSCFlags.totalDistancePresent) != 0,
              let rawDistance = parser.readUInt32LE() else {
            return nil
        }
        return rawDistance // in meters
    }
    
    func createRSCData(
        deviceUUID: BLEDeviceIdentifier,
        speed: Double,
        cadence: Int
        //        strideLength: Int?,
        //        totalDistance: UInt32?,
        //        isRunning: Bool
    ) -> RunningSpeedCadenceData {
        return RunningSpeedCadenceData(
            deviceUUID: deviceUUID,
            instantaneousSpeed: speed,        // Speed in km/h
            instantaneousCadence: cadence,           // Raw cadence
            //            instantaneousStrideLength: strideLength // Optional: stride length in cm
            //            totalDistance: totalDistance,           // Optional: total distance in meters
            //            isRunning: isRunning,                   // Walking(false) vs Running(true)
            //            timestamp: Date()                       // Current timestamp
        )
    }
}
