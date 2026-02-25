import Foundation

extension RollaBluetoothFlutterApi: @unchecked Sendable { }

final class RollaBluetoothHostApiHandler {
    private let flutterApi: RollaBluetoothFlutterApi
    private let rollaBandManager: RollaBandManager
    private let bluetoothStateMonitor: RollaBandBluetoothStateMonitor

    private let deviceStreamingTask: Task<Void, Never>
    private let connectionStateTask: Task<Void, Never>
    private let observeBluetoothStateTask: Task<Void, Never>

    init(
        flutterApi: RollaBluetoothFlutterApi,
        rollaBandManager: RollaBandManager,
        bluetoothStateMonitor: RollaBandBluetoothStateMonitor
    ) {
        self.flutterApi = flutterApi
        self.rollaBandManager = rollaBandManager
        self.bluetoothStateMonitor = bluetoothStateMonitor

        self.deviceStreamingTask = Task { [rollaBandManager, flutterApi] in
            let devicesStream = await rollaBandManager.observeDevices()

            for await devices in devicesStream {
                let flutterDevices = BluetoothDeviceMapper.parseDevices(devices)
                await MainActor.run {
                    flutterApi.onDevicesFound(devices: flutterDevices) { _ in }
                }
            }
        }

        self.connectionStateTask = Task { [rollaBandManager, flutterApi] in
            for await changes in await rollaBandManager.observeDeviceStateChanges() {
                for change in changes {
                    let identifier = change.deviceId
                    let connectionState = ConnectionState(change.state)

                    await MainActor.run {
                        flutterApi.onConnectionStateChanged(uuid: identifier, state: connectionState) { _ in }
                    }
                }
            }
        }

        self.observeBluetoothStateTask = Task { [bluetoothStateMonitor, flutterApi] in
            let initialState = await bluetoothStateMonitor.getCurrentState()
            await MainActor.run {
                flutterApi.onBluetoothStateChanged(state: BluetoothState.from(initialState)) { _ in }
            }

            let stateStream = await bluetoothStateMonitor.observeStateChanges()
            for await state in stateStream {
                await MainActor.run {
                    flutterApi.onBluetoothStateChanged(state: BluetoothState.from(state)) { _ in }
                }
            }
        }
    }

    deinit {
        deviceStreamingTask.cancel()
        connectionStateTask.cancel()
        observeBluetoothStateTask.cancel()
    }
}

extension RollaBluetoothHostApiHandler: RollaBluetoothHostApi {
    func scanForDevices(deviceTypes: [DeviceType], scanDuration: Int64, completion: @escaping (Result<Void, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let durationInSeconds = BluetoothDeviceMapper.parseScanDuration(scanDuration)

                try await rollaBandManager.startScanningForRollaBands(duration: durationInSeconds)
                await MainActor.run {
                    completionResolver.resolve(.success(()))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }

    func stopScanning(completion: @escaping (Result<Void, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            await rollaBandManager.stopScanning()
            await MainActor.run {
                completionResolver.resolve(.success(()))
            }
        }
    }

    func connectToDevice(uuid: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                try await rollaBandManager.connect(to: uuid, timeout: Constants.connectionTimeout)

                await MainActor.run {
                    completionResolver.resolve(.success(true))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }

    func disconnectFromDevice(uuid: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                try await rollaBandManager.disconnect(from: uuid, timeout: Constants.disconnectionTimeout)

                await MainActor.run {
                    completionResolver.resolve(.success(true))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }

    func disconnectAndRemoveBond(uuid: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let deviceUUID = uuid

                try await rollaBandManager.disconnect(from: deviceUUID, timeout: Constants.disconnectionTimeout)

                await MainActor.run {
                    completionResolver.resolve(.success(true))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }

    func checkBluetoothState(completion: @escaping (Result<BluetoothState, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [bluetoothStateMonitor] in
            let bluetoothState = await bluetoothStateMonitor.getCurrentState()

            await MainActor.run {
                completionResolver.resolve(.success(BluetoothState.from(bluetoothState)))
            }
        }
    }

    func checkConnectionState(uuid: String, completion: @escaping (Result<ConnectionState, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let bandState = try await rollaBandManager.getConnectionState(identifier: uuid)

                await MainActor.run {
                    completionResolver.resolve(.success(ConnectionState(bandState)))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }

    func factoryReset(uuid: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                try await rollaBandManager.factoryReset(identifier: uuid)

                await MainActor.run {
                    completionResolver.resolve(.success(()))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
}

private enum Constants {
    static let connectionTimeout: TimeInterval = 15.0
    static let disconnectionTimeout: TimeInterval = 15.0
}
