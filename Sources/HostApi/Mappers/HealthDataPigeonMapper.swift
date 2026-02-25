import Foundation

// MARK: - Legacy Response Types (for backward compatibility)

extension StepsDataResponse {
    func toPigeonResponse() -> RollaBandStepsSyncResponse {
        return RollaBandStepsSyncResponse(
            steps: steps.map { $0.toPigeonStep() },
            lastSyncedBlockTimestamp: Int64(lastSyncedBaseTimestamp),
            lastSyncedEntryTimestamp: Int64(lastSyncedEntryTimestamp)
        )
    }
}

extension Step {
    func toPigeonStep() -> RollaBandStep {
        return RollaBandStep(
            timestamp: Int64(timestamp),
            steps: Int64(steps),
            calories: calories
        )
    }
}

extension MotionDataResponse {
    func toPigeonResponse() -> RollaBandMotionSyncResponse {
        return RollaBandMotionSyncResponse(
            motionPoints: motionPoints.map { $0.toPigeonMotionPoint() }
        )
    }
}

extension MotionPoint {
    func toPigeonMotionPoint() -> RollaBandMotionPoint {
        return RollaBandMotionPoint(
            timestamp: Int64(timestamp),
            heartRate: Int64(heartRate),
            spm: Int64(spm)
        )
    }
}

extension HeartRateDataResponse {
    func toPigeonResponse() -> RollaBandHeartRateSyncResponse {
        return RollaBandHeartRateSyncResponse(
            heartRates: entries.map { $0.toPigeonHeartRate() },
            activityLastSyncedBlockTimestamp: Int64(activityLastSyncedBaseTimestamp),
            activityLastSyncedEntryTimestamp: Int64(activityLastSyncedEntryTimestamp),
            passiveLastSyncedTimestamp: Int64(passiveLastSyncedBaseTimestamp)
        )
    }
}

extension HeartRate {
    func toPigeonHeartRate() -> RollaBandHeartRate {
        return RollaBandHeartRate(
            timestamp: Int64(timestamp),
            hr: Int64(value)
        )
    }
}

extension HRVDataResponse {
    func toPigeonResponse() -> RollaBandHRVSyncResponse {
        return RollaBandHRVSyncResponse(
            hrvs: entries.map { $0.toPigeonHRV() },
            lastSyncedBlockTimestamp: Int64(lastSyncedBaseTimestamp)
        )
    }
}

extension HRVDataEntry {
    func toPigeonHRV() -> RollaBandHRV {
        return RollaBandHRV(
            timestamp: Int64(baseTimestamp),
            hrv: Int64(hrvValue)
        )
    }
}

extension SleepDataResponse {
    func toPigeonResponse() -> RollaBandSleepSyncResponse {
        return RollaBandSleepSyncResponse(
            sleepStages: entries.map { $0.toPigeonSleepStage() },
            lastSyncedBlockTimestamp: Int64(lastSyncedBaseTimestamp),
            lastSyncedEntryTimestamp: Int64(lastSyncedEntryTimestamp)
        )
    }
}

extension ConsolidatedSleepStage {
    func toPigeonSleepStage() -> RollaBandSleepStage {
        return RollaBandSleepStage(
            startTime: Int64(startTimestamp),
            endTime: Int64(endTimestamp),
            value: value.toPigeonSleepStageValue()
        )
    }
}

extension SleepStageValue {
    func toPigeonSleepStageValue() -> RollaBandSleepStageValue {
        switch self {
        case .deep:
            return .deep
        case .light:
            return .light
        case .rem:
            return .rem
        case .awake:
            return .awake
        }
    }
}

// MARK: - New RollaBandManager Result Types

extension StepsSyncResult {
    func toPigeonResponse() -> RollaBandStepsSyncResponse {
        return RollaBandStepsSyncResponse(
            steps: steps.map { $0.toPigeonStep() },
            lastSyncedBlockTimestamp: Int64(lastSyncedBlockTimestamp),
            lastSyncedEntryTimestamp: Int64(lastSyncedEntryTimestamp)
        )
    }
}

extension StepData {
    func toPigeonStep() -> RollaBandStep {
        return RollaBandStep(
            timestamp: Int64(timestamp),
            steps: Int64(steps),
            calories: calories
        )
    }
}

extension HeartRateSyncResult {
    func toPigeonResponse() -> RollaBandHeartRateSyncResponse {
        return RollaBandHeartRateSyncResponse(
            heartRates: heartRates.map { $0.toPigeonHeartRate() },
            activityLastSyncedBlockTimestamp: Int64(activityLastSyncedBlockTimestamp),
            activityLastSyncedEntryTimestamp: Int64(activityLastSyncedEntryTimestamp),
            passiveLastSyncedTimestamp: Int64(passiveLastSyncedTimestamp)
        )
    }
}

extension HeartRateSyncData {
    func toPigeonHeartRate() -> RollaBandHeartRate {
        return RollaBandHeartRate(
            timestamp: Int64(timestamp),
            hr: Int64(bpm)
        )
    }
}

extension HRVSyncResult {
    func toPigeonResponse() -> RollaBandHRVSyncResponse {
        return RollaBandHRVSyncResponse(
            hrvs: hrvEntries.map { $0.toPigeonHRV() },
            lastSyncedBlockTimestamp: Int64(lastSyncedBlockTimestamp)
        )
    }
}

extension HRVData {
    func toPigeonHRV() -> RollaBandHRV {
        return RollaBandHRV(
            timestamp: Int64(timestamp),
            hrv: Int64(hrv)
        )
    }
}

extension SleepSyncResult {
    func toPigeonResponse() -> RollaBandSleepSyncResponse {
        return RollaBandSleepSyncResponse(
            sleepStages: sleepStages.map { $0.toPigeonSleepStage() },
            lastSyncedBlockTimestamp: Int64(lastSyncedBlockTimestamp),
            lastSyncedEntryTimestamp: Int64(lastSyncedEntryTimestamp)
        )
    }
}

extension SleepStageData {
    func toPigeonSleepStage() -> RollaBandSleepStage {
        return RollaBandSleepStage(
            startTime: Int64(startTimestamp),
            endTime: Int64(endTimestamp),
            value: stageType.toPigeonSleepStageValue()
        )
    }
}

extension SleepStageType {
    func toPigeonSleepStageValue() -> RollaBandSleepStageValue {
        switch self {
        case .deep:
            return .deep
        case .light:
            return .light
        case .rem:
            return .rem
        case .awake:
            return .awake
        }
    }
}

extension MotionSyncResult {
    func toPigeonResponse() -> RollaBandMotionSyncResponse {
        return RollaBandMotionSyncResponse(
            motionPoints: motionPoints.map { $0.toPigeonMotionPoint() }
        )
    }
}

extension MotionData {
    func toPigeonMotionPoint() -> RollaBandMotionPoint {
        return RollaBandMotionPoint(
            timestamp: Int64(timestamp),
            heartRate: Int64(heartRate),
            spm: Int64(spm)
        )
    }
}
