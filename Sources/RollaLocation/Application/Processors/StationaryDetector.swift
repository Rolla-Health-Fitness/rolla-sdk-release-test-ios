import Foundation

final class StationaryDetector {

    private struct PositionEntry {
        let timestamp: Date
        let coordinate: Coordinate
    }

    private var buffer: [PositionEntry] = []
    private var _isStationary: Bool = false

    private let windowSeconds: TimeInterval = 8.0
    private let minimumEntries: Int = 3
    private let maxBufferCount: Int = 200
    private let displacementEntryThreshold: Double = 1.0

    /// Exposed read-only so callers can log fine-grained detector state.
    private(set) var consecutiveSlowReadings: Int = 0
    private let requiredSlowReadings: Int

    private let enterSpeedThreshold: Double
    private let exitSpeedThreshold: Double
    private let exitDisplacementThreshold: Double

    init(
        enterSpeedThreshold: Double = 0.40,
        requiredSlowReadings: Int = 3,
        exitSpeedThreshold: Double = 0.45,
        exitDisplacementThreshold: Double = 3.0
    ) {
        self.enterSpeedThreshold = enterSpeedThreshold
        self.requiredSlowReadings = requiredSlowReadings
        self.exitSpeedThreshold = exitSpeedThreshold
        self.exitDisplacementThreshold = exitDisplacementThreshold
    }
    
    var isStationary: Bool { _isStationary }

    /// True while consecutive slow readings are accumulating but haven't yet reached the
    /// threshold — the detector suspects the user may be stopping.
    var isPendingStationary: Bool { !_isStationary && consecutiveSlowReadings > 0 }

    /// Current max displacement across the retained buffer. Exposed for
    /// logging only; `update`/`checkDisplacementStationary` recompute
    /// internally. Returns 0 when the buffer has fewer than the
    /// minimum entries needed for a meaningful reading.
    var currentDisplacement: Double {
        guard buffer.count >= minimumEntries, let first = buffer.first else { return 0 }
        var maxDisplacement = 0.0
        for entry in buffer.dropFirst() {
            let dist = first.coordinate.distance(to: entry.coordinate)
            maxDisplacement = max(maxDisplacement, dist)
        }
        return maxDisplacement
    }
    
    func addPosition(_ coordinate: Coordinate, at timestamp: Date) {
        buffer.append(PositionEntry(timestamp: timestamp, coordinate: coordinate))
        let cutoff = timestamp.addingTimeInterval(-windowSeconds)
        buffer.removeAll { $0.timestamp < cutoff }
        if buffer.count > maxBufferCount {
            buffer.removeFirst(buffer.count - maxBufferCount)
        }
    }
    
    func update(dopplerSpeed: Double) -> Bool {
        if !_isStationary {
            if dopplerSpeed < enterSpeedThreshold {
                consecutiveSlowReadings += 1
                if consecutiveSlowReadings >= requiredSlowReadings {
                    _isStationary = true
                    consecutiveSlowReadings = 0
                }
            } else {
                consecutiveSlowReadings = 0
            }
        }
        
        guard
            buffer.count >= minimumEntries,
            let first = buffer.first
        else {
            return _isStationary
        }
        
        var maxDisplacement = 0.0
        for entry in buffer.dropFirst() {
            let dist = first.coordinate.distance(to: entry.coordinate)
            maxDisplacement = max(maxDisplacement, dist)
        }
        
        let displacement = maxDisplacement
        
        if _isStationary {
            if dopplerSpeed > exitSpeedThreshold || displacement > exitDisplacementThreshold {
                _isStationary = false
            }
        } else {
            if buffer.count >= 6 && displacement < displacementEntryThreshold {
                _isStationary = true
                consecutiveSlowReadings = 0
            }
        }
        
        return _isStationary
    }
    
    func checkDisplacementStationary() -> Bool {
        guard
            buffer.count >= minimumEntries,
            let first = buffer.first
        else {
            return false
        }
        
        var maxDisplacement = 0.0
        for entry in buffer.dropFirst() {
            let dist = first.coordinate.distance(to: entry.coordinate)
            maxDisplacement = max(maxDisplacement, dist)
        }
        let displacement = maxDisplacement
        
        if !_isStationary {
            if displacement < 5.0 {
                _isStationary = true
            }
        } else {
            if displacement > exitDisplacementThreshold {
                _isStationary = false
            }
        }
        
        return _isStationary
    }
    
    func reset() {
        buffer.removeAll()
        _isStationary = false
        consecutiveSlowReadings = 0
    }
}
