import Foundation

public enum WorkoutStatus: String, Sendable, CaseIterable, Codable {
    case inactive = "inactive"
    case starting = "starting"
    case active = "active"
    case paused = "paused"
    case stopping = "stopping"
    case completed = "completed"
    case failed = "failed"
}

public struct WorkoutState: Sendable, Codable, Equatable {
    public let macAddress: String
    public let deviceName: String?
    public let activityType: RollaBandWorkoutType
    public let status: WorkoutStatus
    public let startTime: Date?
    public let pausedTime: Date?
    public let endTime: Date?
    public let duration: TimeInterval
    public let lastUpdated: Date

    public init(
        macAddress: String,
        deviceName: String?,
        activityType: RollaBandWorkoutType,
        status: WorkoutStatus,
        startTime: Date? = nil,
        pausedTime: Date? = nil,
        endTime: Date? = nil,
        duration: TimeInterval = 0,
        lastUpdated: Date = Date()
    ) {
        self.macAddress = macAddress
        self.deviceName = deviceName
        self.activityType = activityType
        self.status = status
        self.startTime = startTime
        self.pausedTime = pausedTime
        self.endTime = endTime
        self.duration = duration
        self.lastUpdated = lastUpdated
    }
    
    public var isActive: Bool {
        return status == .active || status == .paused
    }
    
    public var canStop: Bool {
        return status == .active || status == .paused
    }
    
    public var currentDuration: TimeInterval {
        guard let startTime = startTime else { return duration }
        
        switch status {
        case .active:
            return duration + Date().timeIntervalSince(startTime)
        case .paused:
            guard let pausedTime = pausedTime else { return duration }
            return duration + pausedTime.timeIntervalSince(startTime)
        case .completed, .failed:
            guard let endTime = endTime else { return duration }
            return duration + endTime.timeIntervalSince(startTime)
        default:
            return duration
        }
    }
}

extension WorkoutState {
    func withStatus(_ newStatus: WorkoutStatus) -> WorkoutState {
        let now = Date()
        var newDuration = duration
        var newStartTime = startTime
        var newPausedTime = pausedTime
        var newEndTime = endTime
        
        switch newStatus {
        case .starting:
            newStartTime = now
            newDuration = 0
            newPausedTime = nil
            newEndTime = nil
            
        case .active:
            if status == .paused, let pausedTime = pausedTime, let startTime = startTime {
                newDuration = duration + pausedTime.timeIntervalSince(startTime)
            }
            newStartTime = now
            newPausedTime = nil
            
        case .paused:
            if status == .active, let startTime = startTime {
                newDuration = duration + now.timeIntervalSince(startTime)
            }
            newPausedTime = now
            
        case .completed, .failed:
            if status == .active, let startTime = startTime {
                newDuration = duration + now.timeIntervalSince(startTime)
            } else if status == .paused, let pausedTime = pausedTime, let startTime = startTime {
                newDuration = duration + pausedTime.timeIntervalSince(startTime)
            }
            newEndTime = now
            
        case .inactive:
            newStartTime = nil
            newPausedTime = nil
            newEndTime = nil
            newDuration = 0
            
        case .stopping:
            break
        }
        
        return WorkoutState(
            macAddress: macAddress,
            deviceName: deviceName,
            activityType: activityType,
            status: newStatus,
            startTime: newStartTime,
            pausedTime: newPausedTime,
            endTime: newEndTime,
            duration: newDuration,
            lastUpdated: now
        )
    }
}
