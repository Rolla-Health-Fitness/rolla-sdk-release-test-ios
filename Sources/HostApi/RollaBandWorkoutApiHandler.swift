import Foundation

extension RollaBandActivityApi: @unchecked Sendable { }

actor RollaBandWorkoutApiHandler {
    private let rollaBandManager: RollaBandManager
    private let flutterApi: RollaBandActivityApi

    private var heartRateStreamingTask: Task<Void, Never>?
    private var rscStreamingTask: Task<Void, Never>?
    private var workoutStateMonitoringTask: Task<Void, Never>?
    private var bandEndMonitoringTask: Task<Void, Never>?
    private var currentStreamingDeviceIdentifier: String?

    init(
        rollaBandManager: RollaBandManager,
        flutterApi: RollaBandActivityApi
    ) {
        self.rollaBandManager = rollaBandManager
        self.flutterApi = flutterApi
    }
}

extension RollaBandWorkoutApiHandler: RollaBandWorkoutHostApi {
    nonisolated func startWorkout(uuid: String, type: BandActivityType, completion: @escaping (Result<Void, Error>) -> Void) {
        let activityType = type.rollaBandActivityType

        Task {
            do {
                try await self.rollaBandManager.startWorkout(
                    identifier: uuid,
                    type: activityType
                )

                await self.startWorkoutStateMonitoring()
                await self.setCurrentStreamingDeviceIdentifier(from: uuid)
                await self.startDataStreaming(deviceId: uuid)
                await self.startBandEndMonitoring(deviceId: uuid)

                await MainActor.run { completion(.success(())) }
            } catch {
                await MainActor.run { completion(.failure(error)) }
            }
        }
    }

    nonisolated func stopWorkout(uuid: String, type: BandActivityType, completion: @escaping (Result<Void, Error>) -> Void) {
        let activityType = type.rollaBandActivityType

        Task {
            // Tear the band-end observer down BEFORE issuing the commanded stop.
            // A host stop makes the band emit the same 0x16 06 00 end frame the
            // observer watches for; stopping first means a commanded stop never
            // produces a false-positive onActivityEndedByBand. (The Dart _finishing
            // latch still guards re-entrancy, but we don't rely on it as the sole
            // line of defense — the native layer no longer emits on a host stop.)
            await self.stopBandEndMonitoring()
            do {
                try await self.rollaBandManager.stopWorkout(
                    identifier: uuid,
                    type: activityType
                )

                await self.stopWorkoutStateMonitoring()
                await self.stopDataStreaming(clearCurrentDevice: true)
                await self.stopObservations(deviceId: uuid)

                await MainActor.run { completion(.success(())) }
            } catch {
                await self.stopWorkoutStateMonitoring()
                await self.stopDataStreaming(clearCurrentDevice: true)
                await self.stopObservations(deviceId: uuid)

                await MainActor.run { completion(.failure(error)) }
            }
        }
    }

    nonisolated func setActivityRestorePending(pending: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        Task {
            if !pending {
                // Read the device ID BEFORE clearing the flag, because setActivityRestorePending(false)
                // wipes pendingRestoreDeviceId as a side effect inside ActivityStateTracker.
                let deviceId = await self.rollaBandManager.getPendingRestoreDeviceId()

                await self.rollaBandManager.setActivityRestorePending(pending)

                // User chose save/discard (or no activity was found). Execute the
                // deferred stop so the band exits activity mode now. Tear down the
                // band-end observer first so this commanded stop's 0x16 06 00 echo
                // cannot fire a false-positive onActivityEndedByBand.
                if let deviceId {
                    await self.stopBandEndMonitoring()
                    try? await self.rollaBandManager.stopWorkout(identifier: deviceId, type: .run)
                }
            } else {
                await self.rollaBandManager.setActivityRestorePending(pending)
            }

            await MainActor.run { completion(.success(())) }
        }
    }

    nonisolated func notifyActivityResumedFromRestore(uuid: String, type: BandActivityType, completion: @escaping (Result<Void, Error>) -> Void) {
        Task {
            // Sync native state to "in activity" without sending a start command.
            await self.rollaBandManager.markActivityAsActive()

            // Restore data streaming (HR + RSC) so the session receives live band data.
            // On iOS streaming is only active after startWorkout; this brings it back.
            await self.setCurrentStreamingDeviceIdentifier(from: uuid)
            await self.startDataStreaming(deviceId: uuid)
            await self.startBandEndMonitoring(deviceId: uuid)

            await MainActor.run { completion(.success(())) }
        }
    }

    nonisolated func getMotionData(
        uuid: String,
        fromTimestamp: Int64,
        completion: @escaping (Result<RollaBandMotionSyncResponse, Error>) -> Void
    ) {
        Task {
            do {
                let result = try await self.rollaBandManager.syncMotionData(
                    identifier: uuid,
                    fromTimestamp: Int(fromTimestamp)
                )

                let syncResponse = result.toPigeonResponse()
                await MainActor.run { completion(.success(syncResponse)) }
            } catch {
                await MainActor.run { completion(.failure(error)) }
            }
        }
    }
}

private extension RollaBandWorkoutApiHandler {
    func startWorkoutStateMonitoring() {
        workoutStateMonitoringTask?.cancel()
        workoutStateMonitoringTask = Task {
            for await workoutState in await self.rollaBandManager.observeWorkoutSessionState() {
                guard !Task.isCancelled else { break }
                await self.handleWorkoutStateChange(workoutState)
            }
        }
    }

    func stopWorkoutStateMonitoring() {
        workoutStateMonitoringTask?.cancel()
        workoutStateMonitoringTask = nil
    }

    func handleWorkoutStateChange(_ workoutState: WorkoutSessionState) async {
        switch workoutState {
        case .inactive:
            stopWorkoutStateMonitoring()
            stopBandEndMonitoring()
            stopDataStreaming(clearCurrentDevice: true)

        case .active(let macAddress, _, _):
            if currentStreamingDeviceIdentifier != macAddress {
                currentStreamingDeviceIdentifier = macAddress
                startDataStreaming(deviceId: macAddress)
                startBandEndMonitoring(deviceId: macAddress)
            }

        case .suspended:
            stopBandEndMonitoring()
            stopDataStreaming(clearCurrentDevice: true)
        }
    }

    func startDataStreaming(deviceId: String) {
        stopDataStreaming(clearCurrentDevice: false)
        startHeartRateStreaming(deviceId: deviceId)
        startRSCStreaming(deviceId: deviceId)
    }

    func stopDataStreaming(clearCurrentDevice: Bool) {
        heartRateStreamingTask?.cancel()
        rscStreamingTask?.cancel()
        heartRateStreamingTask = nil
        rscStreamingTask = nil
        if clearCurrentDevice {
            currentStreamingDeviceIdentifier = nil
        }
    }

    func startHeartRateStreaming(deviceId: String) {
        heartRateStreamingTask?.cancel()
        heartRateStreamingTask = Task {
            do {
                for await heartRateData in try await self.rollaBandManager.observeHeartRate(identifier: deviceId) {
                    guard !Task.isCancelled else { break }
                    await MainActor.run {
                        self.flutterApi.onHeartRateReceived(heartRate: Int64(heartRateData.heartRate)) { _ in }
                    }
                }
            } catch {
                // Observation failed or stopped
            }
        }
    }

    func startRSCStreaming(deviceId: String) {
        rscStreamingTask?.cancel()
        rscStreamingTask = Task {
            do {
                for await rscData in try await self.rollaBandManager.observeRunningMetrics(identifier: deviceId) {
                    guard !Task.isCancelled else { break }
                    await MainActor.run {
                        self.flutterApi.onRunningSpeedAndCadenceReceived(
                            speed: rscData.instantaneousSpeed,
                            cadence: Int64(rscData.instantaneousCadence),
                            steps: Double(rscData.instantaneousCadence) / 60.0
                        ) { _ in }
                    }
                }
            } catch {
                // Observation failed or stopped
            }
        }
    }

    // Standing router for the band-initiated end frame (0x16 06 00 / 0x18 0xFF).
    // The live HR parser drops these frames and the workout-state stream only
    // yields .inactive on a HOST-commanded stop, so neither existing path detects
    // a SPONTANEOUS band end. We subscribe to a dedicated end-frame stream backed
    // by a second observer on the same FFF7 characteristic (safe: the manager fans
    // out per stream id). Fire once, then stop local data streaming so the iOS HR
    // stream does not freeze, and tell Flutter to auto-finalize the activity.
    func startBandEndMonitoring(deviceId: String) {
        bandEndMonitoringTask?.cancel()
        bandEndMonitoringTask = Task {
            do {
                for await _ in try await self.rollaBandManager.observeActivityEndedByBand(identifier: deviceId) {
                    guard !Task.isCancelled else { break }
                    // Stop streaming (NOT stopBandEndMonitoring — that would
                    // self-cancel this task before the callback fires).
                    await self.stopDataStreaming(clearCurrentDevice: false)
                    await MainActor.run {
                        self.flutterApi.onActivityEndedByBand(reason: .endedOnBand) { _ in }
                    }
                    break
                }
            } catch {
                // Observation failed or stopped
            }
        }
    }

    func stopBandEndMonitoring() {
        bandEndMonitoringTask?.cancel()
        bandEndMonitoringTask = nil
    }

    func stopObservations(deviceId: String) async {
        try? await rollaBandManager.stopObservingHeartRate(identifier: deviceId)
        try? await rollaBandManager.stopObservingRunningMetrics(identifier: deviceId)
        try? await rollaBandManager.stopObservingActivityEnd(identifier: deviceId)
    }

    func setCurrentStreamingDeviceIdentifier(from deviceId: String) {
        currentStreamingDeviceIdentifier = deviceId
    }
}

private extension BandActivityType {
    var rollaBandActivityType: RollaBandWorkoutType {
        switch self {
        case .run:
            return .run
        case .cycling:
            return .cycling
        case .badminton:
            return .badminton
        case .football:
            return .football
        case .tennis:
            return .tennis
        case .yoga:
            return .yoga
        case .meditation:
            return .meditation
        case .dance:
            return .dance
        case .basketball:
            return .basketball
        case .walk:
            return .walk
        case .workout:
            return .workout
        case .cricket:
            return .cricket
        case .hiking:
            return .hiking
        case .aerobics:
            return .aerobics
        case .pingPong:
            return .pingPong
        case .ropeJump:
            return .ropeJump
        case .sitUps:
            return .sitUps
        case .volleyball:
            return .volleyball
        @unknown default:
            return .workout
        }
    }
}
