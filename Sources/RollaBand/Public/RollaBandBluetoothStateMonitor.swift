import Foundation

public final class RollaBandBluetoothStateMonitor: Sendable {
    private let monitor: BluetoothStateMonitor

    public init() {
        self.monitor = BluetoothStateMonitor()
    }

    public func getCurrentState() async -> BandBluetoothState {
        let bleState = await monitor.getCurrentBluetoothState()
        return BandBluetoothState(bleState)
    }

    public func observeStateChanges() async -> AsyncStream<BandBluetoothState> {
        let stream = await monitor.monitorBluetoothState()

        return AsyncStream { continuation in
            Task {
                for await bleState in stream {
                    continuation.yield(BandBluetoothState(bleState))
                }
                continuation.finish()
            }
        }
    }
    
    public func isBluetoothPoweredOn() async -> Bool {
        return await monitor.isBluetoothPoweredOn()
    }
}

