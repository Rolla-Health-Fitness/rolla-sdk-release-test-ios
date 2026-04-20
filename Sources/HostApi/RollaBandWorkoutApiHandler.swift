import Foundation

extension RollaBandActivityApi: @unchecked Sendable { }

actor RollaBandWorkoutApiHandler {
    private let rollaBandManager: RollaBandManager
    private let flutterApi: RollaBandActivityApi

    private var heartRateStreamingTask: Task<Void, Never>?
    private var rscStreamingTask: Task<Void, Never>?
    private var workoutStateMonitoringTask: Task<Void, Never>?
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

                await MainActor.run { completion(.success(())) }
            } catch {
                await MainActor.run { completion(.failure(error)) }
            }
        }
    }

    nonisolated func stopWorkout(uuid: String, type: BandActivityType, completion: @escaping (Result<Void, Error>) -> Void) {
        let activityType = type.rollaBandActivityType

        Task {
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
                // deferred stop so the band exits activity mode now.
                if let deviceId {
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
            stopDataStreaming(clearCurrentDevice: true)

        case .active(let macAddress, _, _):
            if currentStreamingDeviceIdentifier != macAddress {
                currentStreamingDeviceIdentifier = macAddress
                startDataStreaming(deviceId: macAddress)
            }

        case .suspended:
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

    func stopObservations(deviceId: String) async {
        try? await rollaBandManager.stopObservingHeartRate(identifier: deviceId)
        try? await rollaBandManager.stopObservingRunningMetrics(identifier: deviceId)
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
