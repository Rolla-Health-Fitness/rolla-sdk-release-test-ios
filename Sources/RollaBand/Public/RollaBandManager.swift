import Foundation

public final class RollaBandManager: Sendable {
    private let dependencies: RollaBandDependencies

    public convenience init() {
        self.init(bluetoothQueueLabel: nil, logger: nil)
    }

    public convenience init(
        bluetoothQueueLabel: String? = nil,
        logger: Logging? = nil
    ) {
        let config: SDKConfiguration

        if let label = bluetoothQueueLabel {
            config = SDKConfiguration(
                bluetoothQueueLabel: label,
                recognitionPlugins: [RollaBandRecognitionPlugin()],
                isDebugLoggingEnabled: false,
                logLevel: .info
            )
        } else {
            config = SDKConfiguration(
                bluetoothQueueLabel: "com.rolla.band.bluetooth",
                recognitionPlugins: [RollaBandRecognitionPlugin()],
                isDebugLoggingEnabled: false,
                logLevel: .info
            )
        }

        RollaBluetoothSDK.configure(with: config)

        let dependencies = RollaBandDependenciesFactory.create(logger: logger)
        RollaBandDependencies.configure(with: dependencies)

        self.init(dependencies: RollaBandDependencies.shared)
    }

    init(dependencies: RollaBandDependencies) {
        self.dependencies = dependencies
    }

    public func startScanningForRollaBands(duration: TimeInterval? = nil) async throws {
        try await dependencies.startScanningForRollaBandsUseCase.execute(
            duration: duration
        )
    }

    public func observeDevices() async -> AsyncStream<[RollaBandDevice]> {
        return await dependencies.observeRollaBandDevicesUseCase.execute()
    }

    public func stopScanning() async {
        await dependencies.stopScanningForRollaBandsUseCase.execute()
    }

    public func connect(to identifier: String, timeout: TimeInterval = 30) async throws {
        try await dependencies.connectToRollaBandUseCase.execute(
            identifier: identifier,
            timeout: timeout
        )
    }

    public func disconnect(from identifier: String, timeout: TimeInterval = 10) async throws {
        _ = try await dependencies.disconnectFromRollaBandUseCase.execute(
            identifier: identifier,
            timeout: timeout
        )
    }
    
    public func isConnected(identifier: String) async -> Bool {
        do {
            let state = try await dependencies.getPairedDeviceConnectionStateUseCase.execute(
                identifier: identifier
            )
            if case .connected = state {
                return true
            }
            return false
        } catch {
            return false
        }
    }

    public func getConnectionState(identifier: String) async throws -> BandConnectionState {
        let state = try await dependencies.getPairedDeviceConnectionStateUseCase.execute(identifier: identifier)
        return BandConnectionState(from: state)
    }

    public func observeDeviceStateChanges() async -> AsyncStream<[BandDeviceStateChange]> {
        let stream = await dependencies.observeAllDeviceStateChangesUseCase.execute()

        return AsyncStream { continuation in
            Task {
                for await changes in stream {
                    let bandChanges = changes.compactMap { BandDeviceStateChange(from: $0) }

                    guard !bandChanges.isEmpty else { continue }

                    continuation.yield(bandChanges)
                }
                continuation.finish()
            }
        }
    }

    public func observeBatteryEvents() async -> AsyncStream<BatteryLevelData> {
        dependencies.connectionObservationHandler.batteryEvents
    }

    public func observeChargingStateEvents() async -> AsyncStream<ChargingStateData> {
        dependencies.connectionObservationHandler.chargingStateEvents
    }

    // MARK: - Health Data Sync

    public func syncSteps(
        identifier: String,
        lastSyncedBlockTimestamp: Int = 0,
        lastSyncedEntryTimestamp: Int = 0
    ) async throws -> StepsSyncResult {
        let response = try await dependencies.getStepsDataUseCase.execute(
            for: identifier,
            lastSyncEntryBaseTimestamp: lastSyncedBlockTimestamp,
            lastSyncEntryTimestamp: lastSyncedEntryTimestamp
        )

        return StepsSyncResult(
            steps: response.steps.map { StepData(step: $0) },
            lastSyncedBlockTimestamp: response.lastSyncedBaseTimestamp,
            lastSyncedEntryTimestamp: response.lastSyncedEntryTimestamp
        )
    }

    public func syncHeartRate(
        identifier: String,
        activityLastSyncedBlockTimestamp: Int = 0,
        activityLastSyncedEntryTimestamp: Int = 0,
        passiveLastSyncedTimestamp: Int = 0
    ) async throws -> HeartRateSyncResult {
        let response = try await dependencies.getHeartRateDataUseCase.execute(
            for: identifier,
            lastSyncEntryBaseTimestamp: activityLastSyncedBlockTimestamp,
            lastSyncEntryTimestamp: activityLastSyncedEntryTimestamp,
            passiveLastSyncedBaseTimestamp: passiveLastSyncedTimestamp
        )

        return HeartRateSyncResult(
            heartRates: response.entries.map { HeartRateSyncData(heartRate: $0) },
            activityLastSyncedBlockTimestamp: response.activityLastSyncedBaseTimestamp,
            activityLastSyncedEntryTimestamp: response.activityLastSyncedEntryTimestamp,
            passiveLastSyncedTimestamp: response.passiveLastSyncedBaseTimestamp
        )
    }
    
    public func syncHRV(
        identifier: String,
        lastSyncedBlockTimestamp: Int = 0
    ) async throws -> HRVSyncResult {
        let response = try await dependencies.getHRVDataUseCase.execute(
            for: identifier,
            lastSyncEntryBaseTimestamp: lastSyncedBlockTimestamp
        )

        return HRVSyncResult(
            hrvEntries: response.entries.map { HRVData(entry: $0) },
            lastSyncedBlockTimestamp: response.lastSyncedBaseTimestamp
        )
    }

    public func syncSleep(
        identifier: String,
        lastSyncedBlockTimestamp: Int = 0,
        lastSyncedEntryTimestamp: Int = 0
    ) async throws -> SleepSyncResult {
        let response = try await dependencies.getSleepDataUseCase.execute(
            for: identifier,
            lastSyncEntryBaseTimestamp: lastSyncedBlockTimestamp,
            lastSyncEntryTimestamp: lastSyncedEntryTimestamp
        )

        return SleepSyncResult(
            sleepStages: response.entries.map { SleepStageData(stage: $0) },
            lastSyncedBlockTimestamp: response.lastSyncedBaseTimestamp,
            lastSyncedEntryTimestamp: response.lastSyncedEntryTimestamp
        )
    }

    public func syncMotionData(
        identifier: String,
        fromTimestamp: Int
    ) async throws -> MotionSyncResult {
        let firmwareVersion = try? await dependencies.getDeviceFirmwareUseCase.execute(
            for: identifier
        )
        let response = try await dependencies.getMotionDataUseCase.execute(
            for: identifier,
            lastSyncTimestamp: fromTimestamp,
            firmwareVersion: firmwareVersion
        )

        return MotionSyncResult(
            motionPoints: response.motionPoints.map { MotionData(point: $0) }
        )
    }

    // MARK: - Activity Restore Support

    /// Sets the restore-pending flag. While true, native auto-stop on reconnection is suppressed.
    public func setActivityRestorePending(_ pending: Bool) async {
        await dependencies.activityRestoreUseCase.setActivityRestorePending(pending)
    }

    /// Syncs native state to "in activity" after the user chooses to resume a
    /// crash-interrupted activity. Does NOT send any BLE command to the band.
    public func markActivityAsActive() async {
        await dependencies.activityRestoreUseCase.markActivityAsActive()
    }

    /// Returns the stored device identifier of the band that reconnected while
    /// a restore was pending (set by the connection use case). Used for the deferred stop.
    public func getPendingRestoreDeviceId() async -> String? {
        await dependencies.activityRestoreUseCase.getPendingRestoreDeviceId()
    }

    // MARK: - Workout

    public func startWorkout(
        identifier: String,
        type: RollaBandWorkoutType
    ) async throws {
        try await dependencies.workoutSessionUseCase.startWorkoutSession(
            for: identifier,
            activityType: type
        )
    }

    public func stopWorkout(
        identifier: String,
        type: RollaBandWorkoutType
    ) async throws {
        try await dependencies.workoutSessionUseCase.stopWorkoutSession(
            for: identifier,
            activityType: type
        )
    }
    
    public func observeWorkoutSessionState() async -> AsyncStream<WorkoutSessionState> {
        await dependencies.workoutSessionUseCase.workoutSessionStateStream()
    }

    public func observeHeartRate(
        identifier: String
    ) async throws -> AsyncStream<HeartRateData> {
        try await dependencies.heartRateObservationUseCase.observeHeartRate(for: identifier)
    }

    public func stopObservingHeartRate(
        identifier: String
    ) async throws {
        try await dependencies.heartRateObservationUseCase.stopObservingHeartRate(for: identifier)
    }

    public func observeRunningMetrics(
        identifier: String
    ) async throws -> AsyncStream<RunningSpeedCadenceData> {
        try await dependencies.rscObservationUseCase.observeRSC(for: identifier)
    }

    public func stopObservingRunningMetrics(
        identifier: String
    ) async throws {
        try await dependencies.rscObservationUseCase.stopObservingRSC(for: identifier)
    }

    public func getFirmwareVersion(identifier: String) async throws -> String? {
        try await dependencies.getDeviceFirmwareUseCase.execute(for: identifier)
    }

    public func getSerialNumber(identifier: String) async throws -> String? {
        try await dependencies.getDeviceSerialNumberUseCase.execute(for: identifier)
    }

    public func getBatteryLevel(identifier: String) async throws -> Int {
        try await dependencies.getDeviceBatteryUseCase.execute(for: identifier)
    }

    public func getUserInfo(identifier: String) async throws -> UserInfo {
        try await dependencies.getUserInfoUseCase.execute(for: identifier)
    }

    public func setUserInfo(
        identifier: String,
        userInfo: UserInfo
    ) async throws {
        try await dependencies.setUserInfoUseCase.execute(
            for: identifier,
            userInfo: userInfo
        )
    }

    public func startFirmwareUpdate(
        identifier: String,
        firmwareUrl: String
    ) async throws {
        try await dependencies.updateFirmwareUseCase.startFirmwareUpdate(
            firmwareUrl: firmwareUrl,
            deviceId: identifier
        )
    }
    
    public func observeFirmwareUpdateEvents() async -> AsyncStream<BandFirmwareUpdateEvent> {
        return await dependencies.updateFirmwareUseCase.getEventsStream()
    }

    public func abortFirmwareUpdate() async {
        await dependencies.updateFirmwareUseCase.abortUpdate()
    }

    public func factoryReset(identifier: String) async throws {
        try await dependencies.factoryResetUseCase.execute(for: identifier)
    }

    public func disconnectAndUnpair(
        identifier: String,
        timeout: TimeInterval = 15
    ) async throws {
        let bleDeviceUUID = try await dependencies.disconnectFromRollaBandUseCase.execute(
            identifier: identifier,
            timeout: timeout
        )

        await dependencies.unpairDeviceUseCase.execute(deviceUUID: bleDeviceUUID)
    }
    
    public func getAllRawLogs(identifier: String) async throws -> String {
        let formatter = RawLogsFormatter()
        
        let userProfileSection: String
        do {
            let userInfo = try await getUserInfo(identifier: identifier)
            userProfileSection = formatter.formatUserProfile(userInfo)
        } catch {
            userProfileSection = formatter.formatUserProfileError(error)
        }
        
        let rawLogs = try await dependencies.getRawLogsUseCase.executeAll(for: identifier)
        
        return userProfileSection + rawLogs
    }
}
