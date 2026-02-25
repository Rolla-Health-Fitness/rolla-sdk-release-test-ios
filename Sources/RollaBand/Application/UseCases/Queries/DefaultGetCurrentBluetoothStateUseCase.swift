import Foundation

public final class DefaultGetCurrentBluetoothStateUseCase: GetCurrentBluetoothStateUseCase {
    private let bluetoothStateMonitor: BluetoothStateMonitor
    
    public init(bluetoothStateMonitor: BluetoothStateMonitor) {
        self.bluetoothStateMonitor = bluetoothStateMonitor
    }
    
    public func execute() async -> CBBluetoothState {
        return await bluetoothStateMonitor.getCurrentBluetoothState()
    }
}

