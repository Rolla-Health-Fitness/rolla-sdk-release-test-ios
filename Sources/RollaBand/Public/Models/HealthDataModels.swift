import Foundation

public struct BandDevice: Sendable, Equatable, Hashable {
    public let macAddress: String
    public let name: String?
    public let signalStrength: Int?
    public let connectionState: BandConnectionState
    public let lastSeen: Date

    public init(
        macAddress: String,
        name: String?,
        signalStrength: Int?,
        connectionState: BandConnectionState,
        lastSeen: Date
    ) {
        self.macAddress = macAddress
        self.name = name
        self.signalStrength = signalStrength
        self.connectionState = connectionState
        self.lastSeen = lastSeen
    }
}

public enum BandConnectionState: Sendable, Equatable {
    case discovered
    case connecting
    case connected
    case disconnecting
    case disconnected

    init(from deviceState: DeviceState) {
        switch deviceState {
        case .discovered:
            self = .discovered
        case .connecting:
            self = .connecting
        case .connected:
            self = .connected
        case .disconnecting:
            self = .disconnecting
        case .disconnected:
            self = .disconnected
        }
    }
}

/// Represents a device state change event
public struct BandDeviceStateChange: Sendable, Equatable {
    /// Device identifier (MAC address for RollaBand devices).
    public let deviceId: String

    /// Current connection state
    public let state: BandConnectionState

    /// Previous connection state (if available)
    public let previousState: BandConnectionState?

    /// Timestamp of the state change
    public let timestamp: Date

    init?(from change: DeviceStateChange) {
        let macAddress: String?
        switch change.currentState {
        case .discovered(let discovered),
             .connecting(let discovered),
             .disconnected(let discovered):
            macAddress = discovered.macAddress
        case .connected(let connected),
             .disconnecting(let connected):
            macAddress = connected.macAddress
        }

        guard let deviceId = macAddress else {
            return nil
        }

        self.deviceId = deviceId
        self.state = BandConnectionState(from: change.currentState)
        self.previousState = change.previousState.map { BandConnectionState(from: $0) }
        self.timestamp = change.timestamp
    }
}

// MARK: - Steps Data

/// Single step measurement
public struct StepData: Sendable {
    /// Unix timestamp when steps were recorded
    public let timestamp: Int
    /// Number of steps
    public let steps: Int
    /// Calories burned
    public let calories: Double
    
    public init(timestamp: Int, steps: Int, calories: Double) {
        self.timestamp = timestamp
        self.steps = steps
        self.calories = calories
    }
    
    /// Convert from internal Step model
    init(step: Step) {
        self.timestamp = step.timestamp
        self.steps = step.steps
        self.calories = step.calories
    }
}

/// Result of steps sync operation
public struct StepsSyncResult: Sendable {
    /// Array of step measurements
    public let steps: [StepData]
    /// Cursor for next sync (block timestamp)
    public let lastSyncedBlockTimestamp: Int
    /// Cursor for next sync (entry timestamp)
    public let lastSyncedEntryTimestamp: Int
    
    public init(steps: [StepData], lastSyncedBlockTimestamp: Int, lastSyncedEntryTimestamp: Int) {
        self.steps = steps
        self.lastSyncedBlockTimestamp = lastSyncedBlockTimestamp
        self.lastSyncedEntryTimestamp = lastSyncedEntryTimestamp
    }
}

// MARK: - Heart Rate Data

/// Single heart rate measurement from health data sync
public struct HeartRateSyncData: Sendable {
    /// Unix timestamp when heart rate was recorded
    public let timestamp: Int
    /// Heart rate in BPM
    public let bpm: Int

    public init(timestamp: Int, bpm: Int) {
        self.timestamp = timestamp
        self.bpm = bpm
    }

    /// Convert from internal HeartRate model
    init(heartRate: HeartRate) {
        self.timestamp = heartRate.timestamp
        self.bpm = heartRate.value
    }
}

/// Result of heart rate sync operation
public struct HeartRateSyncResult: Sendable {
    /// Array of heart rate measurements
    public let heartRates: [HeartRateSyncData]
    /// Cursor for next activity HR sync (block timestamp)
    public let activityLastSyncedBlockTimestamp: Int
    /// Cursor for next activity HR sync (entry timestamp)
    public let activityLastSyncedEntryTimestamp: Int
    /// Cursor for next passive HR sync
    public let passiveLastSyncedTimestamp: Int

    public init(
        heartRates: [HeartRateSyncData],
        activityLastSyncedBlockTimestamp: Int,
        activityLastSyncedEntryTimestamp: Int,
        passiveLastSyncedTimestamp: Int
    ) {
        self.heartRates = heartRates
        self.activityLastSyncedBlockTimestamp = activityLastSyncedBlockTimestamp
        self.activityLastSyncedEntryTimestamp = activityLastSyncedEntryTimestamp
        self.passiveLastSyncedTimestamp = passiveLastSyncedTimestamp
    }
}

// MARK: - HRV Data

/// Single HRV measurement
public struct HRVData: Sendable {
    /// Unix timestamp when HRV was recorded
    public let timestamp: Int
    /// HRV value in milliseconds
    public let hrv: Int
    
    public init(timestamp: Int, hrv: Int) {
        self.timestamp = timestamp
        self.hrv = hrv
    }
    
    /// Convert from internal HRVDataEntry model
    init(entry: HRVDataEntry) {
        self.timestamp = entry.baseTimestamp
        self.hrv = entry.hrvValue
    }
}

/// Result of HRV sync operation
public struct HRVSyncResult: Sendable {
    /// Array of HRV measurements
    public let hrvEntries: [HRVData]
    /// Cursor for next sync
    public let lastSyncedBlockTimestamp: Int
    
    public init(hrvEntries: [HRVData], lastSyncedBlockTimestamp: Int) {
        self.hrvEntries = hrvEntries
        self.lastSyncedBlockTimestamp = lastSyncedBlockTimestamp
    }
}

// MARK: - Sleep Data

/// Sleep stage type
public enum SleepStageType: String, Sendable {
    case deep
    case light
    case rem
    case awake

    /// Convert from internal SleepStageValue
    init(from value: SleepStageValue) {
        switch value {
        case .deep: self = .deep
        case .light: self = .light
        case .rem: self = .rem
        case .awake: self = .awake
        }
    }
}

/// Single sleep stage period
public struct SleepStageData: Sendable {
    /// Start time of sleep stage
    public let startTimestamp: Int
    /// End time of sleep stage
    public let endTimestamp: Int
    /// Type of sleep stage
    public let stageType: SleepStageType

    public init(startTimestamp: Int, endTimestamp: Int, stageType: SleepStageType) {
        self.startTimestamp = startTimestamp
        self.endTimestamp = endTimestamp
        self.stageType = stageType
    }

    /// Convert from internal ConsolidatedSleepStage model
    init(stage: ConsolidatedSleepStage) {
        self.startTimestamp = stage.startTimestamp
        self.endTimestamp = stage.endTimestamp
        self.stageType = SleepStageType(from: stage.value)
    }
}

/// Result of sleep sync operation
public struct SleepSyncResult: Sendable {
    /// Array of sleep stages
    public let sleepStages: [SleepStageData]
    /// Cursor for next sync (block timestamp)
    public let lastSyncedBlockTimestamp: Int
    /// Cursor for next sync (entry timestamp)
    public let lastSyncedEntryTimestamp: Int

    public init(sleepStages: [SleepStageData], lastSyncedBlockTimestamp: Int, lastSyncedEntryTimestamp: Int) {
        self.sleepStages = sleepStages
        self.lastSyncedBlockTimestamp = lastSyncedBlockTimestamp
        self.lastSyncedEntryTimestamp = lastSyncedEntryTimestamp
    }
}

// MARK: - Motion Data (for workout recovery)

/// Single motion data point (HR + SPM)
public struct MotionData: Sendable {
    /// Unix timestamp when motion was recorded
    public let timestamp: Int
    /// Heart rate in BPM
    public let heartRate: Int
    /// Steps per minute (cadence)
    public let spm: Int

    public init(timestamp: Int, heartRate: Int, spm: Int) {
        self.timestamp = timestamp
        self.heartRate = heartRate
        self.spm = spm
    }

    /// Convert from internal MotionPoint model
    init(point: MotionPoint) {
        self.timestamp = point.timestamp
        self.heartRate = point.heartRate
        self.spm = point.spm
    }
}

/// Result of motion data sync operation
public struct MotionSyncResult: Sendable {
    /// Array of motion data points
    public let motionPoints: [MotionData]

    public init(motionPoints: [MotionData]) {
        self.motionPoints = motionPoints
    }
}



// MARK: - Internal Helpers

extension BandDevice {
    /// Internal initializer from DeviceState
    init(from deviceState: DeviceState) {
        switch deviceState {
        case .discovered(let discovered):
            self.init(
                macAddress: discovered.macAddress ?? discovered.id.uuidString,
                name: discovered.name,
                signalStrength: discovered.rssi,
                connectionState: .discovered,
                lastSeen: discovered.timestamp
            )

        case .connecting(let discovered):
            self.init(
                macAddress: discovered.macAddress ?? discovered.id.uuidString,
                name: discovered.name,
                signalStrength: discovered.rssi,
                connectionState: .connecting,
                lastSeen: discovered.timestamp
            )

        case .connected(let connected):
            self.init(
                macAddress: connected.macAddress ?? connected.id.uuidString,
                name: connected.name,
                signalStrength: nil,
                connectionState: .connected,
                lastSeen: Date()
            )

        case .disconnecting(let connected):
            self.init(
                macAddress: connected.macAddress ?? connected.id.uuidString,
                name: connected.name,
                signalStrength: nil,
                connectionState: .disconnecting,
                lastSeen: Date()
            )

        case .disconnected(let discovered):
            self.init(
                macAddress: discovered.macAddress ?? discovered.id.uuidString,
                name: discovered.name,
                signalStrength: discovered.rssi,
                connectionState: .disconnected,
                lastSeen: discovered.timestamp
            )
        }
    }
}

extension SleepStageValue {
    func toPublicType() -> SleepStageType {
        switch self {
        case .deep: return .deep
        case .light: return .light
        case .rem: return .rem
        case .awake: return .awake
        }
    }
}

