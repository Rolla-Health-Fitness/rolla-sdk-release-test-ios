import Foundation

public final class BluetoothStateMonitor: Sendable {
    private let getBluetoothStateUseCase: GetBluetoothStateUseCase
    private let observeBluetoothStateUseCase: StartObservingBluetoothStateUseCase

    internal init(
        getBluetoothStateUseCase: GetBluetoothStateUseCase,
        observeBluetoothStateUseCase: StartObservingBluetoothStateUseCase
    ) {
        self.getBluetoothStateUseCase = getBluetoothStateUseCase
        self.observeBluetoothStateUseCase = observeBluetoothStateUseCase
    }

    public convenience init() {
        let deps = RollaBluetoothDependencies.shared
        self.init(
            getBluetoothStateUseCase: deps.getBluetoothStateUseCase,
            observeBluetoothStateUseCase: deps.observeBluetoothStateUseCase
        )
    }

    public func getCurrentBluetoothState() async -> CBBluetoothState {
        return await getBluetoothStateUseCase.execute()
    }

    public func monitorBluetoothState() async -> AsyncStream<CBBluetoothState> {
        return await observeBluetoothStateUseCase.execute()
    }

    public func isBluetoothPoweredOn() async -> Bool {
        return await getBluetoothStateUseCase.isBluetoothPoweredOn()
    }
}
