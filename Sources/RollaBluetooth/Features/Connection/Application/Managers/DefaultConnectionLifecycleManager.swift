import Foundation

final class DefaultConnectionLifecycleManager: ConnectionLifecycleManaging {
    private let connectUseCase: ConnectUseCase
    private let disconnectUseCase: DisconnectUseCase
    private let reconnectUseCase: ReconnectionUseCase
    private let getDeviceStateUseCase: GetDeviceStateUseCase
    private let getAllDevicesUseCase: GetAllDevicesUseCase
    private let observeDevicesUseCase: StartObservingDeviceStatesUseCase
    private let getBluetoothStateUseCase: GetBluetoothStateUseCase
    private let observeBluetoothStateUseCase: StartObservingBluetoothStateUseCase
    private let logger: Logging

    private let stateChangesStream: EventStreamSource<[DeviceStateChange]>

    private actor ConnectionManagementState {
        private var deviceStateTask: Task<Void, Never>?
        private var bluetoothStateTask: Task<Void, Never>?
        private var monitoredDevices: Set<BLEDeviceIdentifier> = []
        private var monitorAllDevices: Bool = false

        var isMonitoringActive: Bool {
            return deviceStateTask != nil || bluetoothStateTask != nil
        }

        func setDeviceStateTask(_ task: Task<Void, Never>) {
            deviceStateTask?.cancel()
            deviceStateTask = task
        }

        func setBluetoothStateTask(_ task: Task<Void, Never>) {
            bluetoothStateTask?.cancel()
            bluetoothStateTask = task
        }

        func cancelAllTasks() {
            deviceStateTask?.cancel()
            bluetoothStateTask?.cancel()
            deviceStateTask = nil
            bluetoothStateTask = nil
        }

        func addMonitoredDevice(_ deviceUUID: BLEDeviceIdentifier) {
            monitoredDevices.insert(deviceUUID)
            monitorAllDevices = false
        }

        func removeMonitoredDevice(_ deviceUUID: BLEDeviceIdentifier) {
            monitoredDevices.remove(deviceUUID)
        }

        func setMonitorAllDevices(_ monitor: Bool) {
            monitorAllDevices = monitor
            if monitor {
                monitoredDevices.removeAll()
            }
        }

        func shouldMonitorDevice(_ deviceUUID: BLEDeviceIdentifier) -> Bool {
            return monitorAllDevices || monitoredDevices.contains(deviceUUID)
        }
    }

    private let connectionState = ConnectionManagementState()

    init(
        connectUseCase: ConnectUseCase,
        disconnectUseCase: DisconnectUseCase,
        reconnectUseCase: ReconnectionUseCase,
        getDeviceStateUseCase: GetDeviceStateUseCase,
        getAllDevicesUseCase: GetAllDevicesUseCase,
        observeDevicesUseCase: StartObservingDeviceStatesUseCase,
        getBluetoothStateUseCase: GetBluetoothStateUseCase,
        observeBluetoothStateUseCase: StartObservingBluetoothStateUseCase,
        logger: Logging
    ) {
        self.connectUseCase = connectUseCase
        self.disconnectUseCase = disconnectUseCase
        self.reconnectUseCase = reconnectUseCase
        self.getDeviceStateUseCase = getDeviceStateUseCase
        self.getAllDevicesUseCase = getAllDevicesUseCase
        self.observeDevicesUseCase = observeDevicesUseCase
        self.getBluetoothStateUseCase = getBluetoothStateUseCase
        self.observeBluetoothStateUseCase = observeBluetoothStateUseCase
        self.logger = logger
        self.stateChangesStream = EventStreamSource<[DeviceStateChange]>()
    }

    deinit {
        Task { [connectionState] in
            await connectionState.cancelAllTasks()
        }
    }
}

extension DefaultConnectionLifecycleManager {
    func connect(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval,
        brand: DeviceBrand? = nil,
        type: BLEDeviceType? = nil,
        macAddress: String? = nil
    ) async throws {
        try await connectUseCase.connect(
            deviceUUID: deviceUUID,
            timeout: timeout,
            brand: brand,
            type: type,
            macAddress: macAddress
        )

        Task {
            await handleDeviceStateChanges(for: deviceUUID)
        }
    }

    func disconnect(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws {
        try await disconnectUseCase.disconnect(deviceUUID: deviceUUID, timeout: timeout)
    }

    func getAllDeviceStateChangesStream() async -> AsyncStream<[DeviceStateChange]> {
        await startInternalMonitoring()
        await connectionState.setMonitorAllDevices(true)
        let (stream, _) = await stateChangesStream.makeStream()
        return stream
    }

    func stopHandlingDeviceStateChanges(for deviceUUID: BLEDeviceIdentifier) async {
        logger.info("Stopping device state handling for: \(deviceUUID.uuidString)")
        await connectionState.removeMonitoredDevice(deviceUUID)
    }

    func cancelReconnection(for deviceUUID: BLEDeviceIdentifier) async {
        logger.info("Cancelling reconnection for: \(deviceUUID.uuidString)")
        await reconnectUseCase.cancelReconnection(for: deviceUUID)
    }
}

private extension DefaultConnectionLifecycleManager {
    func handleDeviceStateChanges(for deviceUUID: BLEDeviceIdentifier) async {
        logger.info("Starting device state handling for: \(deviceUUID.uuidString)")

        await startInternalMonitoring()

        await connectionState.addMonitoredDevice(deviceUUID)

        let (stream, _) = await stateChangesStream.makeStream()
        for await changes in stream {
            guard await connectionState.shouldMonitorDevice(deviceUUID) else {
                logger.info("Stopping device state handling for: \(deviceUUID.uuidString) - device no longer monitored")
                break
            }

            for change in changes where change.deviceUUID == deviceUUID {
                await handleDeviceStateChange(change)
            }
        }
    }

    func startInternalMonitoring() async {
        guard !(await connectionState.isMonitoringActive) else {
            return
        }

        let deviceStateTask = Task<Void, Never> { [weak self] in
            await self?.monitorDeviceStateChangesInternal()
        }
        await connectionState.setDeviceStateTask(deviceStateTask)

        let bluetoothStateTask = Task<Void, Never> { [weak self] in
            await self?.monitorBluetoothStateChanges()
        }
        await connectionState.setBluetoothStateTask(bluetoothStateTask)
    }

    func monitorBluetoothStateChanges() async {
        var lastBluetoothState: CBBluetoothState?

        for await bluetoothState in await observeBluetoothStateUseCase.execute() {
            guard await connectionState.isMonitoringActive else {
                break
            }

            if lastBluetoothState != bluetoothState {
                lastBluetoothState = bluetoothState

                switch bluetoothState {
                case .poweredOn:
                    // Auto-reconnect disabled on iOS - Flutter handles reconnection
                    break
                case .poweredOff:
                    await cancelAllActiveReconnections(reason: "Bluetooth powered off")
                case .unauthorized:
                    await cancelAllActiveReconnections(reason: "Bluetooth unauthorized")
                case .unsupported:
                    await cancelAllActiveReconnections(reason: "Bluetooth unsupported")
                case .resetting:
                    logger.warning("Bluetooth is resetting - connections may be interrupted")
                case .unknown:
                    logger.warning("Bluetooth state unknown - connections may not work properly")
                @unknown default:
                    logger.warning("Unknown Bluetooth state: \(bluetoothState)")
                    break
                }
            }
        }
    }

    func cancelAllActiveReconnections(reason: String) async {
        let allDevices = await getAllDevicesUseCase.execute()
        for deviceState in allDevices {
            await reconnectUseCase.cancelReconnection(for: deviceState.deviceId)
        }
    }

    func monitorDeviceStateChangesInternal() async {
        var previousStates: [BLEDeviceIdentifier: DeviceState] = [:]
        let monitoringStartTime = Date()

        let initialDevices = await getAllDevicesUseCase.execute()
        let filteredInitialDevices = await filterDevices(initialDevices)

        for deviceState in filteredInitialDevices {
            previousStates[deviceState.deviceId] = deviceState
        }

        logger.info("Initialized state monitoring for \(filteredInitialDevices.count) devices")

        for await deviceStates in await observeDevicesUseCase.execute() {
            guard await connectionState.isMonitoringActive else {
                let monitoringDuration = Date().timeIntervalSince(monitoringStartTime)
                logger.info("Device state monitoring stopped after \(String(format: "%.1f", monitoringDuration))s")
                break
            }

            let filteredDeviceStates = await filterDevices(deviceStates)

            let stateChanges = filteredDeviceStates.compactMap { deviceState -> DeviceStateChange? in
                let deviceId = deviceState.deviceId
                let previousState = previousStates[deviceId]

                if previousState != deviceState {
                    return DeviceStateChange(
                        deviceId: deviceId,
                        currentState: deviceState,
                        previousState: previousState
                    )
                }
                return nil
            }

            guard !stateChanges.isEmpty else {
                continue
            }

            for stateChange in stateChanges {
                previousStates[stateChange.deviceUUID] = stateChange.currentState
            }

            await stateChangesStream.yield(stateChanges)
        }
    }

    func filterDevices(_ devices: [DeviceState]) async -> [DeviceState] {
        var filteredDevices: [DeviceState] = []
        for device in devices {
            if await connectionState.shouldMonitorDevice(device.deviceId) {
                filteredDevices.append(device)
            }
        }
        return filteredDevices
    }

    func handleDeviceStateChange(_ stateChange: DeviceStateChange) async {
        let deviceId = stateChange.deviceUUID
        let currentState = stateChange.currentState
        let previousState = stateChange.previousState

        switch currentState {
        case .connected:
            await handleDeviceConnected(deviceId, previousState: previousState)

        case .disconnected:
            await handleDeviceDisconnected(deviceId, previousState: previousState)

        case .connecting:
            await reconnectUseCase.cancelReconnection(for: deviceId)

        case .disconnecting:
            await reconnectUseCase.cancelReconnection(for: deviceId)

        case .discovered:
            if previousState == nil {
                logger.info("New device discovered: \(deviceId)")
            } else {
                logger.info("Device rediscovered: \(deviceId)")
            }
        }
    }

    func handleDeviceConnected(_ deviceId: BLEDeviceIdentifier, previousState: DeviceState?) async {
        logger.info("Device connected: \(deviceId.uuidString)")
        await reconnectUseCase.markReconnectionSuccessful(for: deviceId)
    }

    func handleDeviceDisconnected(_ deviceId: BLEDeviceIdentifier, previousState: DeviceState?) async {
        guard let previousState, case .connected = previousState else {
            return
        }

        guard reconnectUseCase.isAutoReconnectEnabled else {
            logger.info("Auto-reconnect disabled, skipping reconnection for: \(deviceId)")
            return
        }

        let bluetoothState = await getBluetoothStateUseCase.execute()

        guard bluetoothState == .poweredOn else {
            logger.warning("Bluetooth not powered on, skipping reconnection for: \(deviceId)")
            return
        }

        let strategy = await reconnectUseCase.getReconnectionStrategy(
            deviceId: deviceId,
            disconnectionReason: .connectionLost
        )

        if strategy.shouldReconnect {
            await performReconnection(deviceId: deviceId, strategy: strategy)
        }
    }

    func checkForPendingReconnections() async {
        guard reconnectUseCase.isAutoReconnectEnabled else { return }

        let bluetoothState = await getBluetoothStateUseCase.execute()
        guard bluetoothState == .poweredOn else { return }

        let allDevices = await getAllDevicesUseCase.execute()
        let disconnectedDevices = allDevices.filter { deviceState in
            if case .disconnected = deviceState {
                return true
            }
            return false
        }

        guard !disconnectedDevices.isEmpty else { return }

        for deviceState in disconnectedDevices {
            let strategy = await reconnectUseCase.getReconnectionStrategy(
                deviceId: deviceState.deviceId,
                disconnectionReason: .connectionLost
            )

            if strategy.shouldReconnect {
                await performReconnection(deviceId: deviceState.deviceId, strategy: strategy)
            }
        }
    }

    func performReconnection(deviceId: BLEDeviceIdentifier, strategy: ReconnectionStrategy) async {
        guard !Task.isCancelled else {
            logger.info("Reconnection cancelled for: \(deviceId.uuidString)")
            return
        }

        logger.info("Attempting reconnection (attempt \(strategy.attemptNumber)) for: \(deviceId.uuidString)")

        do {
            if strategy.delay > 0 {
                logger.debug("Waiting \(String(format: "%.1f", strategy.delay))s before reconnection attempt")
                try await Task.sleep(nanoseconds: UInt64(strategy.delay * 1_000_000_000))
            }

            guard let deviceState = await getDeviceStateUseCase.execute(deviceUUID: deviceId) else {
                logger.warning("Device not found in repository during reconnection: \(deviceId.uuidString)")
                return
            }

            switch deviceState {
            case .discovered(let device), .disconnected(let device):
                try await connectUseCase.connect(
                    deviceUUID: deviceId,
                    timeout: strategy.timeout,
                    brand: device.brand,
                    type: device.type,
                    macAddress: device.macAddress
                )

            case .connecting:
                logger.info("Device is already connecting, skipping reconnection: \(deviceId.uuidString)")
                return

            case .connected:
                logger.info("Device is already connected, skipping reconnection: \(deviceId.uuidString)")
                return

            case .disconnecting:
                logger.info("Device is actively disconnecting, cancelling reconnection: \(deviceId.uuidString)")
                await reconnectUseCase.cancelReconnection(for: deviceId)
                return
            }

            logger.success("Reconnection successful for: \(deviceId.uuidString)")

        } catch {
            logger.warning("Reconnection attempt \(strategy.attemptNumber) failed for: \(deviceId.uuidString) - \(error.localizedDescription)")

            if let nextStrategy = await reconnectUseCase.getNextReconnectionStrategy(
                for: deviceId,
                previousAttempt: strategy.attemptNumber,
                error: error
            ) {
                await performReconnection(deviceId: deviceId, strategy: nextStrategy)
            } else {
                logger.failure("All reconnection attempts exhausted for: \(deviceId.uuidString)")
            }
        }
    }
}

