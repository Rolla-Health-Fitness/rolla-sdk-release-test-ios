import Foundation

public final class DefaultObserveBluetoothStateChangesUseCase: ObserveBluetoothStateChangesUseCase {
    private let bluetoothStateMonitor: BluetoothStateMonitor
    
    public init(bluetoothStateMonitor: BluetoothStateMonitor) {
        self.bluetoothStateMonitor = bluetoothStateMonitor
    }
    
    public func execute() async -> AsyncStream<CBBluetoothState> {
        return await bluetoothStateMonitor.monitorBluetoothState()
    }
}

