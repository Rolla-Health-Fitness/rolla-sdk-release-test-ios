import Foundation

extension HrmFlutterApi: @unchecked Sendable { }

/// Native Heart Rate Monitor (HRM) host handler.
///
/// Deliberately independent of `RollaBluetoothHostApiHandler` and the Rolla Band
/// path: it drives the generic `RollaBluetooth` facades (`BLEScanner`,
/// `Connector`, `CommandExecutor`, `CharacteristicObserver`, `DeviceManager`)
/// directly — scanning filtered to the Heart Rate Service (0x180D) and, on
/// connect, subscribing to the Heart Rate Measurement characteristic (0x2A37).
/// Results are delivered on the dedicated `HrmFlutterApi` channel.
///
/// The generic BLE stack shares a single `CBCentralManager`, so device and
/// connection events are filtered down to heart-rate devices (tracked from the
/// discovery stream and on connect) before being forwarded, keeping the HRM
/// channel free of Rolla Band traffic.
final class HrmHostApiHandler {
    private let flutterApi: HrmFlutterApi
    private let scanner: BLEScanner
    private let connector: Connector
    private let commandExecutor: CommandExecutor
    private let characteristicObserver: CharacteristicObserver
    private let deviceManager: DeviceManager
    private let registry = HrmSubscriptionRegistry()

    private let deviceStreamingTask: Task<Void, Never>
    private let connectionStateTask: Task<Void, Never>

    init(flutterApi: HrmFlutterApi) {
        self.flutterApi = flutterApi
        self.scanner = BLEScanner()
        self.connector = Connector()
        self.commandExecutor = CommandExecutor()
        self.characteristicObserver = CharacteristicObserver()
        self.deviceManager = DeviceManager()

        let registry = self.registry

        // Discovered heart-rate devices → onHrmDevicesFound.
        self.deviceStreamingTask = Task { [deviceManager, flutterApi, registry] in
            let stream = await deviceManager.allDevicesStream()
            for await states in stream {
                let hrmDevices = states.compactMap { state -> BluetoothDevice? in
                    guard HrmDeviceMapper.isHeartRateDevice(state) else { return nil }
                    registry.addDevice(state.deviceId.uuidString)
                    return HrmDeviceMapper.parse(state)
                }
                await MainActor.run {
                    flutterApi.onHrmDevicesFound(devices: hrmDevices) { _ in }
                }
            }
        }

        // Connection-state changes, filtered to heart-rate devices.
        self.connectionStateTask = Task { [connector, flutterApi, registry] in
            for await changes in await connector.getAllDeviceStateChangesStream() {
                for change in changes {
                    let uuid = change.deviceUUID.uuidString
                    guard HrmDeviceMapper.isHeartRateDevice(change.currentState) || registry.contains(uuid) else {
                        continue
                    }
                    let connectionState = HrmDeviceMapper.connectionState(change.currentState)
                    await MainActor.run {
                        flutterApi.onHrmConnectionStateChanged(uuid: uuid, state: connectionState) { _ in }
                    }
                }
            }
        }
    }

    deinit {
        deviceStreamingTask.cancel()
        connectionStateTask.cancel()
        registry.cancelAll()
    }
}

extension HrmHostApiHandler: HrmHostApi {
    func startHrmScan(scanDuration: Int64, completion: @escaping (Result<Void, Error>) -> Void) {
        let resolver = CompletionResolver(completion)
        let duration = TimeInterval(scanDuration) / 1000.0

        Task { [scanner] in
            do {
                try await scanner.start(filters: .services([.heartRate]), duration: duration)
                await MainActor.run { resolver.resolve(.success(())) }
            } catch {
                await MainActor.run { resolver.resolve(.failure(error)) }
            }
        }
    }

    func stopHrmScan(completion: @escaping (Result<Void, Error>) -> Void) {
        let resolver = CompletionResolver(completion)

        Task { [scanner] in
            await scanner.stop()
            await MainActor.run { resolver.resolve(.success(())) }
        }
    }

    func connectHrmDevice(uuid: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let resolver = CompletionResolver(completion)
        guard let deviceId = BLEDeviceIdentifier(uuid) else {
            resolver.resolve(.failure(HrmError.invalidDeviceIdentifier(uuid)))
            return
        }
        registry.addDevice(uuid)

        Task { [connector, commandExecutor, characteristicObserver, flutterApi, registry] in
            do {
                try await connector.connect(deviceUUID: deviceId, timeout: Constants.connectionTimeout)
            } catch {
                await MainActor.run { resolver.resolve(.failure(error)) }
                return
            }

            do {
                // Discover happens as part of the standard connection strategy;
                // enabling notifications on 0x2A37 is an explicit step.
                try await commandExecutor.execute(
                    EnableNotificationCommand(
                        deviceID: deviceId,
                        serviceUUID: BLEServiceType.heartRate.uuid,
                        characteristicUUID: BLECharacteristicType.heartRateMeasurement.uuid,
                        timeout: Constants.notificationTimeout
                    )
                )
            } catch {
                // Drop the link rather than leave it up without a subscription.
                // Flutter reads an established connection as a successful
                // connect (the "already connected" case), so a surviving link
                // would show as a working monitor that never reports a single
                // measurement and that nothing would ever retry.
                await connector.cancelReconnection(for: deviceId)
                await connector.stopMonitoring(for: deviceId)
                await characteristicObserver.stopObservingNotifications(for: deviceId)
                try? await connector.disconnect(deviceUUID: deviceId, timeout: Constants.disconnectionTimeout)
                await MainActor.run { resolver.resolve(.failure(error)) }
                return
            }

            // If the device also exposes the RSC service (0x1814), enable its
            // measurement characteristic (0x2A53). Best-effort — absence of RSC
            // must not fail the connect (Stage 2, no quality gating).
            var rscEnabled = false
            do {
                try await commandExecutor.execute(
                    EnableNotificationCommand(
                        deviceID: deviceId,
                        serviceUUID: BLEServiceType.runningSpeedAndCadence.uuid,
                        characteristicUUID: BLECharacteristicType.rscMeasurement.uuid,
                        timeout: Constants.notificationTimeout
                    )
                )
                rscEnabled = true
            } catch {
                rscEnabled = false
            }

            // Stream 0x2A37 (and 0x2A53 if present) notifications → parse →
            // Flutter. Held in the registry so disconnect / teardown cancels it.
            let observationTask = Task { [characteristicObserver, flutterApi] in
                await withTaskGroup(of: Void.self) { group in
                    group.addTask {
                        let (stream, _) = await characteristicObserver.observeNotifications(
                            deviceID: deviceId,
                            serviceUUID: BLEServiceType.heartRate.uuid,
                            characteristicUUID: BLECharacteristicType.heartRateMeasurement.uuid
                        )
                        for await data in stream {
                            guard let bpm = HeartRateMeasurementParser.parse(data) else { continue }
                            await MainActor.run {
                                flutterApi.onHrmHeartRateReceived(heartRate: Int64(bpm)) { _ in }
                            }
                        }
                    }
                    if rscEnabled {
                        group.addTask {
                            let (stream, _) = await characteristicObserver.observeNotifications(
                                deviceID: deviceId,
                                serviceUUID: BLEServiceType.runningSpeedAndCadence.uuid,
                                characteristicUUID: BLECharacteristicType.rscMeasurement.uuid
                            )
                            for await data in stream {
                                guard let rsc = RscMeasurementParser.parse(data) else { continue }
                                await MainActor.run {
                                    flutterApi.onHrmRunningSpeedCadenceReceived(
                                        speedMps: rsc.speedMps,
                                        cadenceSpm: Int64(rsc.cadenceSpm)
                                    ) { _ in }
                                }
                            }
                        }
                    }
                }
            }
            registry.setTask(observationTask, for: deviceId.uuidString)

            await MainActor.run { resolver.resolve(.success(true)) }
        }
    }

    func disconnectHrmDevice(uuid: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let resolver = CompletionResolver(completion)
        guard let deviceId = BLEDeviceIdentifier(uuid) else {
            resolver.resolve(.failure(HrmError.invalidDeviceIdentifier(uuid)))
            return
        }
        registry.cancelTask(for: uuid)

        Task { [connector, characteristicObserver] in
            // Cancel the native auto-reconnect/monitoring that connect() set up,
            // so a user-initiated disconnect sticks. Without this the generic BLE
            // stack silently reconnects the device on its own.
            await connector.cancelReconnection(for: deviceId)
            await connector.stopMonitoring(for: deviceId)
            await characteristicObserver.stopObservingNotifications(for: deviceId)
            do {
                try await connector.disconnect(deviceUUID: deviceId, timeout: Constants.disconnectionTimeout)
                await MainActor.run { resolver.resolve(.success(true)) }
            } catch {
                await MainActor.run { resolver.resolve(.failure(error)) }
            }
        }
    }

    func checkHrmConnectionState(uuid: String, completion: @escaping (Result<ConnectionState, Error>) -> Void) {
        let resolver = CompletionResolver(completion)
        guard let deviceId = BLEDeviceIdentifier(uuid) else {
            resolver.resolve(.failure(HrmError.invalidDeviceIdentifier(uuid)))
            return
        }

        Task { [connector] in
            do {
                let state = try await connector.getConnectionState(deviceId: deviceId)
                await MainActor.run { resolver.resolve(.success(HrmDeviceMapper.connectionState(state))) }
            } catch {
                await MainActor.run { resolver.resolve(.failure(error)) }
            }
        }
    }
}

private enum Constants {
    static let connectionTimeout: TimeInterval = 15.0
    static let disconnectionTimeout: TimeInterval = 15.0
    static let notificationTimeout: TimeInterval = 10.0
}

private enum HrmError: Error {
    case invalidDeviceIdentifier(String)
}

/// Thread-safe registry of per-device HR notification tasks and the set of
/// known heart-rate device ids (used to filter the shared connection stream).
private final class HrmSubscriptionRegistry: @unchecked Sendable {
    private let lock = NSLock()
    private var heartRateTasks: [String: Task<Void, Never>] = [:]
    private var hrmDeviceIds: Set<String> = []

    func addDevice(_ id: String) {
        lock.lock(); defer { lock.unlock() }
        hrmDeviceIds.insert(id)
    }

    func contains(_ id: String) -> Bool {
        lock.lock(); defer { lock.unlock() }
        return hrmDeviceIds.contains(id)
    }

    func setTask(_ task: Task<Void, Never>, for id: String) {
        lock.lock(); defer { lock.unlock() }
        heartRateTasks[id]?.cancel()
        heartRateTasks[id] = task
    }

    func cancelTask(for id: String) {
        lock.lock(); defer { lock.unlock() }
        heartRateTasks[id]?.cancel()
        heartRateTasks[id] = nil
    }

    func cancelAll() {
        lock.lock(); defer { lock.unlock() }
        heartRateTasks.values.forEach { $0.cancel() }
        heartRateTasks.removeAll()
    }
}

/// Maps generic `DeviceState` values into the Pigeon `BluetoothDevice` /
/// `ConnectionState` models for the HRM channel.
enum HrmDeviceMapper {
    static func isHeartRateDevice(_ state: DeviceState) -> Bool {
        guard let device = state.discoveredDevice else { return false }
        // The Rolla Band also advertises 0x180D but is not a generic HRM (its HR
        // is proprietary, connecting via the HRM path fails) and has its own
        // pairing flow — exclude it from the HRM picker.
        if isRollaBand(device) { return false }
        return device.type == .heartRateSensor
            || device.advertisedServices.contains { $0.normalizedShortForm == "180D" }
    }

    static func isRollaBand(_ device: DiscoveredDevice) -> Bool {
        if device.brand == .rolla || device.type == .band { return true }
        if device.advertisedServices.contains(where: { $0.normalizedShortForm == "FFF0" }) { return true }
        if let name = device.name?.lowercased(), name.contains("rolla") { return true }
        return false
    }

    static func parse(_ state: DeviceState) -> BluetoothDevice? {
        guard let device = state.discoveredDevice, isHeartRateDevice(state) else { return nil }
        return BluetoothDevice(
            name: device.name ?? "",
            rssi: Int64(device.rssi),
            uuid: device.id.uuidString,
            capabilities: [.hr],
            connectionState: connectionState(state),
            deviceType: .other
        )
    }

    static func connectionState(_ state: DeviceState) -> ConnectionState {
        switch state {
        case .discovered, .disconnected, .disconnecting:
            return .disconnected
        case .connecting:
            return .connecting
        case .connected:
            return .connected
        }
    }
}

/// Parses a standard BLE Heart Rate Measurement (0x2A37) value.
///
/// Byte 0 is a flags field; bit 0 selects the HR value format
/// (0 = UINT8, 1 = UINT16, little-endian) and bits 1-2 carry the sensor contact
/// status — bit 2 whether the monitor reports contact at all, bit 1 whether it
/// has contact now. Energy expended and RR-intervals are ignored for Stage 1.
enum HeartRateMeasurementParser {
    private static let valueFormatIsUInt16: UInt8 = 0x01
    private static let sensorContactDetected: UInt8 = 0x02
    private static let sensorContactSupported: UInt8 = 0x04

    /// The measured BPM, or nil when the value carries no measurement.
    ///
    /// A strap taken off the body keeps notifying at its usual rate, repeating
    /// its last value with contact flagged as lost. Those readings are reported
    /// heart rates in name only — forwarding them freezes a number on screen for
    /// as long as the strap stays powered on, and nothing downstream could tell
    /// them apart from a live measurement.
    static func parse(_ data: Data) -> Int? {
        let bytes = [UInt8](data)
        guard let flags = bytes.first else { return nil }

        let contactSupported = (flags & sensorContactSupported) != 0
        let contactDetected = (flags & sensorContactDetected) != 0
        if contactSupported && !contactDetected { return nil }

        if (flags & valueFormatIsUInt16) != 0 {
            guard bytes.count >= 3 else { return nil }
            return Int(bytes[1]) | (Int(bytes[2]) << 8)
        } else {
            guard bytes.count >= 2 else { return nil }
            return Int(bytes[1])
        }
    }
}

/// Parses a standard BLE RSC Measurement (0x2A53) value.
///
/// Byte 0 is a flags field. Bytes 1-2 are the instantaneous speed as a UINT16
/// in units of 1/256 m/s (little-endian); byte 3 is the instantaneous cadence
/// in steps per minute. Stride length / total distance (optional, per flags)
/// are ignored for Stage 2.
enum RscMeasurementParser {
    static func parse(_ data: Data) -> (speedMps: Double, cadenceSpm: Int)? {
        let bytes = [UInt8](data)
        guard bytes.count >= 4 else { return nil }
        let speedRaw = Int(bytes[1]) | (Int(bytes[2]) << 8)
        let speedMps = Double(speedRaw) / 256.0
        let cadence = Int(bytes[3])
        return (speedMps: speedMps, cadenceSpm: cadence)
    }
}
