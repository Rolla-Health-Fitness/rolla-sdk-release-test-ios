import Foundation

final class RollaBandConnectionObservationHandler {
    private let batteryObservationUseCase: BatteryObservationUseCase
    private let chargingStateObservationUseCase: ChargingStateObservationUseCase
    private let observeAllDeviceStateChangesUseCase: ObserveAllDeviceStateChangesUseCase
    private let logger: Logging

    private var connectionStreamTask: Task<Void, Never>?
    private var batteryStreamTasks: [String: Task<Void, Never>] = [:]
    private var chargingStateStreamTasks: [String: Task<Void, Never>] = [:]

    let batteryEvents: AsyncStream<BatteryLevelData>
    let chargingStateEvents: AsyncStream<ChargingStateData>

    private let batteryEventsContinuation: AsyncStream<BatteryLevelData>.Continuation
    private let chargingStateEventsContinuation: AsyncStream<ChargingStateData>.Continuation

    init(
        batteryObservationUseCase: BatteryObservationUseCase,
        chargingStateObservationUseCase: ChargingStateObservationUseCase,
        observeAllDeviceStateChangesUseCase: ObserveAllDeviceStateChangesUseCase,
        logger: Logging
    ) {
        self.batteryObservationUseCase = batteryObservationUseCase
        self.chargingStateObservationUseCase = chargingStateObservationUseCase
        self.observeAllDeviceStateChangesUseCase = observeAllDeviceStateChangesUseCase
        self.logger = logger

        var batteryContinuation: AsyncStream<BatteryLevelData>.Continuation!
        self.batteryEvents = AsyncStream { continuation in
            batteryContinuation = continuation
        }
        self.batteryEventsContinuation = batteryContinuation

        var chargingContinuation: AsyncStream<ChargingStateData>.Continuation!
        self.chargingStateEvents = AsyncStream { continuation in
            chargingContinuation = continuation
        }
        self.chargingStateEventsContinuation = chargingContinuation

        startConnectionEventObservation()
    }

    deinit {
        connectionStreamTask?.cancel()
        for task in batteryStreamTasks.values { task.cancel() }
        for task in chargingStateStreamTasks.values { task.cancel() }
        batteryEventsContinuation.finish()
        chargingStateEventsContinuation.finish()
    }
}

private extension RollaBandConnectionObservationHandler {
    func startConnectionEventObservation() {
        connectionStreamTask = Task { [weak self] in
            guard let self else { return }
            let stream = await observeAllDeviceStateChangesUseCase.execute()
            for await stateChanges in stream {
                for change in stateChanges {
                    await handleDeviceStateChange(stateChange: change)
                }
            }
        }
    }

    func handleDeviceStateChange(stateChange: DeviceStateChange) async {
        let deviceName = stateChange.currentState.name ?? "Unknown Device"
        let deviceId = stateChange.deviceUUID.uuidString

        guard isRollaBandDevice(stateChange.currentState) else { return }

        switch stateChange.currentState {
        case .connecting:
            guard shouldStartObservation(previousState: stateChange.previousState) else { return }
            await startAllObservations(deviceId: deviceId, deviceName: deviceName)

        case .disconnected:
            guard shouldStopObservation(previousState: stateChange.previousState) else { return }
            await stopAllObservations(deviceId: deviceId, deviceName: deviceName)

        case .connected, .disconnecting, .discovered:
            break
        }
    }

    func startAllObservations(deviceId: String, deviceName: String) async {
        logger.info("RollaBand connecting, starting all observations: \(deviceName)", category: .deviceInfo)
        await startBatteryObservation(deviceId: deviceId, deviceName: deviceName)
        await startChargingStateObservation(deviceId: deviceId, deviceName: deviceName)
        logger.success("Successfully started all observations for \(deviceName)", category: .deviceInfo)
    }

    func stopAllObservations(deviceId: String, deviceName: String) async {
        logger.info("RollaBand disconnected, stopping all observations: \(deviceName)", category: .deviceInfo)
        await stopBatteryObservation(deviceId: deviceId, deviceName: deviceName)
        await stopChargingStateObservation(deviceId: deviceId, deviceName: deviceName)
        logger.success("Stopped all observations for \(deviceName)", category: .deviceInfo)
    }
}

// MARK: - Battery observation
private extension RollaBandConnectionObservationHandler {
    func startBatteryObservation(deviceId: String, deviceName: String) async {
        do {
            let stream = try await batteryObservationUseCase.startObservingBattery(for: deviceId)
            startBatteryStreaming(deviceId: deviceId, stream: stream, deviceName: deviceName)
            logger.success("Started battery observation for \(deviceName)", category: .deviceInfo)
        } catch {
            logger.error("Failed to start battery observation for \(deviceName): \(error)", category: .deviceInfo)
        }
    }

    func stopBatteryObservation(deviceId: String, deviceName: String) async {
        stopBatteryStreaming(for: deviceId)
        do {
            try await batteryObservationUseCase.stopObservingBattery(for: deviceId)
            logger.success("Stopped battery observation for \(deviceName)", category: .deviceInfo)
        } catch {
            logger.info("Battery observation cleanup completed for \(deviceName)", category: .deviceInfo)
        }
    }

    func startBatteryStreaming(
        deviceId: String,
        stream: AsyncStream<BatteryLevelData>,
        deviceName: String
    ) {
        batteryStreamTasks[deviceId] = Task { [weak self] in
            guard let self else { return }
            for await data in stream {
                if Task.isCancelled { break }
                logger.info("Battery level: \(data.batteryLevel)% for \(deviceName)", category: .deviceInfo)
                self.batteryEventsContinuation.yield(data)
            }
        }
    }

    func stopBatteryStreaming(for deviceId: String) {
        batteryStreamTasks[deviceId]?.cancel()
        batteryStreamTasks.removeValue(forKey: deviceId)
    }
}

// MARK: - Charging state observation
private extension RollaBandConnectionObservationHandler {
    func startChargingStateObservation(deviceId: String, deviceName: String) async {
        do {
            let stream = try await chargingStateObservationUseCase.observeChargingState(for: deviceId)
            startChargingStateStreaming(deviceId: deviceId, stream: stream, deviceName: deviceName)
            logger.success("Started charging state observation for \(deviceName)", category: .deviceInfo)
        } catch {
            logger.error("Failed to start charging state observation for \(deviceName): \(error)", category: .deviceInfo)
        }
    }

    func stopChargingStateObservation(deviceId: String, deviceName: String) async {
        stopChargingStateStreaming(for: deviceId)
        do {
            try await chargingStateObservationUseCase.stopObservingChargingState(for: deviceId)
            logger.success("Stopped charging state observation for \(deviceName)", category: .deviceInfo)
        } catch {
            logger.info("Charging state observation cleanup completed for \(deviceName)", category: .deviceInfo)
        }
    }

    func startChargingStateStreaming(
        deviceId: String,
        stream: AsyncStream<ChargingStateData>,
        deviceName: String
    ) {
        chargingStateStreamTasks[deviceId] = Task { [weak self] in
            guard let self else { return }
            for await data in stream {
                if Task.isCancelled { break }
                let state = data.state == .charging ? "charging" : "not charging"
                logger.info("Charging state: \(state) for \(deviceName)", category: .deviceInfo)
                self.chargingStateEventsContinuation.yield(data)
            }
        }
    }

    func stopChargingStateStreaming(for deviceId: String) {
        chargingStateStreamTasks[deviceId]?.cancel()
        chargingStateStreamTasks.removeValue(forKey: deviceId)
    }
}

// MARK: - Helpers
private extension RollaBandConnectionObservationHandler {
    func isRollaBandDevice(_ deviceState: DeviceState) -> Bool {
        switch deviceState {
        case .discovered(let d), .connecting(let d), .disconnected(let d):
            return d.brand == .rolla && d.type == .band
        case .connected(let d), .disconnecting(let d):
            return d.brand == .rolla && d.deviceType == .band
        }
    }

    func shouldStartObservation(previousState: DeviceState?) -> Bool {
        guard let previous = previousState else { return true }
        switch previous {
        case .connecting, .connected:
            return false
        default:
            return true
        }
    }

    func shouldStopObservation(previousState: DeviceState?) -> Bool {
        guard let previous = previousState else { return false }
        switch previous {
        case .connecting, .connected, .disconnecting:
            return true
        default:
            return false
        }
    }
}

