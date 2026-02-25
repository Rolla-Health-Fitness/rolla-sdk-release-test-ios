import Foundation

public actor RollaBandWorkoutSessionUseCase: WorkoutSessionUseCase {
    private let rollaBandWorkoutManager: RollaBandWorkoutManaging
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager
    private let logger: Logging

    private var currentState: WorkoutSessionState = .inactive
    private let workoutSessionStateStreamSource = EventStreamSource<WorkoutSessionState>()

    private var deviceStateObservationTask: Task<Void, Never>?
    private var hasStartedObservation = false

    public init(
        rollaBandWorkoutManager: RollaBandWorkoutManaging,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager,
        logger: Logging
    ) {
        self.rollaBandWorkoutManager = rollaBandWorkoutManager
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
        self.logger = logger
    }

    deinit {
        deviceStateObservationTask?.cancel()
    }

    private func ensureObservationStarted() {
        guard !hasStartedObservation else { return }
        hasStartedObservation = true
        startDeviceStateObservation()
    }

    public func startWorkoutSession(for deviceId: String, activityType: RollaBandWorkoutType) async throws {
        ensureObservationStarted()
        logger.info("Starting workout session for device: \(deviceId), activity: \(activityType)", category: .workout)

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        guard currentState == .inactive else {
            logger.warning("Attempted to start workout session but one is already active", category: .workout)
            throw WorkoutSessionError.sessionAlreadyActive
        }

        do {
            _ = try await rollaBandWorkoutManager.startWorkout(
                deviceUUID: deviceUUID,
                activityType: activityType,
                timeout: 15
            )

            logger.success("Workout started successfully on Rolla band", category: .workout)

            let newState = WorkoutSessionState.active(
                macAddress: deviceId,
                activityType: activityType,
                startTime: Date()
            )

            currentState = newState
            await workoutSessionStateStreamSource.yield(newState)

        } catch {
            logger.error("Failed to start workout session: \(error)", category: .workout)
            await cleanup()
            throw error
        }
    }

    public func stopWorkoutSession(for deviceId: String, activityType: RollaBandWorkoutType) async throws {
        logger.info("Stopping workout session", category: .workout)

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let stopType: RollaBandWorkoutType

        switch currentState {
        case .inactive:
            stopType = activityType

        case .active(let macAddress, let activeType, _), .suspended(let macAddress, let activeType, _):
            guard deviceId == macAddress else {
                throw WorkoutSessionError.deviceNotFound(deviceId)
            }
            stopType = activeType
        }

        do {
            _ = try await rollaBandWorkoutManager.stopWorkout(
                deviceUUID: deviceUUID,
                activityType: stopType,
                timeout: 15
            )
            logger.success("Workout stopped on band", category: .workout)

            currentState = .inactive
            await workoutSessionStateStreamSource.yield(.inactive)

            logger.success("Workout session stopped successfully", category: .workout)

        } catch {
            logger.error("Failed to stop workout session: \(error)", category: .workout)
            await cleanup()
            throw error
        }
    }

    public func workoutSessionStateStream() async -> AsyncStream<WorkoutSessionState> {
        let (stream, _) = await workoutSessionStateStreamSource.makeStream()
        return stream
    }
}

extension RollaBandWorkoutSessionUseCase {
    private func startDeviceStateObservation() {
        deviceStateObservationTask = Task {
            for await deviceStates in await self.deviceManager.allDevicesStream() {
                guard !Task.isCancelled else { break }
                await self.handleDeviceStateChanges(deviceStates)
            }
        }
    }
    
    private func handleDeviceStateChanges(_ deviceStates: [DeviceState]) async {
        switch currentState {
        case .inactive:
            return

        case .active(let macAddress, let activityType, let startTime):
            logger.info("Active workout session for device: \(macAddress)", category: .workout)
            await handleActiveSessionDeviceChanges(deviceStates, macAddress: macAddress, activityType: activityType, startTime: startTime)

        case .suspended(let macAddress, let activityType, let startTime):
            logger.info("Suspended workout session for device: \(macAddress)", category: .workout)
            await handleSuspendedSessionDeviceChanges(deviceStates, macAddress: macAddress, activityType: activityType, startTime: startTime)
        }
    }

    private func handleActiveSessionDeviceChanges(
        _ deviceStates: [DeviceState],
        macAddress: String,
        activityType: RollaBandWorkoutType,
        startTime: Date
    ) async {
        logger.info("Handling active session device changes for device: \(macAddress)", category: .workout)

        guard let bleDeviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(macAddress) else {
            logger.warning("Could not resolve UUID for MAC: \(macAddress)", category: .workout)
            return
        }

        let deviceState = deviceStates.first { state in
            return state.deviceId == bleDeviceUUID
        }

        guard let deviceState else {
            logger.warning("Device not found in device states: \(macAddress)", category: .workout)
            return
        }

        logger.success("Found device \(macAddress) with state: \(deviceState)", category: .workout)

        switch deviceState {
        case .disconnected, .disconnecting:
            logger.warning("Device disconnected during active workout, suspending session for device: \(macAddress)", category: .workout)

            let suspendedState = WorkoutSessionState.suspended(
                macAddress: macAddress,
                activityType: activityType,
                startTime: startTime
            )
            currentState = suspendedState
            await workoutSessionStateStreamSource.yield(suspendedState)

        case .discovered, .connecting:
            logger.info("Device is reconnecting, staying in active state", category: .workout)
            break

        case .connected:
            logger.success("Device is connected and session is active", category: .workout)
            break
        }
    }

    private func handleSuspendedSessionDeviceChanges(
        _ deviceStates: [DeviceState],
        macAddress: String,
        activityType: RollaBandWorkoutType,
        startTime: Date
    ) async {
        logger.info("Handling suspended session device changes for device: \(macAddress)", category: .workout)

        guard let bleDeviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(macAddress) else {
            logger.warning("Could not resolve UUID for MAC: \(macAddress)", category: .workout)
            return
        }

        let deviceState = deviceStates.first { state in
            return state.deviceId == bleDeviceUUID
        }

        guard let deviceState else {
            logger.warning("Suspended device not found in device states: \(macAddress)", category: .workout)
            return
        }

        switch deviceState {
        case .connected(let connectedDevice):
            logger.progress("Device reconnected during suspended workout! Device: \(macAddress), attempting to resume...", category: .workout)
            await attemptSessionResume(
                connectedDevice: connectedDevice,
                macAddress: macAddress,
                activityType: activityType,
                startTime: startTime
            )

        case .disconnected, .disconnecting:
            logger.info("Device still disconnected, staying in suspended state", category: .workout)
            break

        case .discovered, .connecting:
            logger.info("Device is reconnecting, staying in suspended state until fully connected", category: .workout)
            break
        }
    }

    private func attemptSessionResume(
        connectedDevice: ConnectedDevice,
        macAddress: String,
        activityType: RollaBandWorkoutType,
        startTime: Date
    ) async {
        do {
            logger.info("Attempting to resume workout session after reconnection", category: .workout)
            
            _ = try await rollaBandWorkoutManager.startWorkout(
                deviceUUID: connectedDevice.id,
                activityType: activityType,
                timeout: 15
            )
            logger.success("Workout restarted on band after reconnection", category: .workout)
            
            let activeState = WorkoutSessionState.active(
                macAddress: macAddress,
                activityType: activityType,
                startTime: startTime
            )
            currentState = activeState
            await workoutSessionStateStreamSource.yield(activeState)
            
            logger.success("Workout session resumed successfully after reconnection", category: .workout)
            
        } catch {
            logger.error("Failed to resume workout session after reconnection: \(error)", category: .workout)
        }
    }
    
    private func cleanup() async {
        logger.info("Cleaning up workout session", category: .workout)
        currentState = .inactive
        await workoutSessionStateStreamSource.yield(.inactive)
    }
}
