import Foundation

public final class DefaultObserveAllDeviceStateChangesUseCase: ObserveAllDeviceStateChangesUseCase {
    private let connector: Connector

    public init(connector: Connector) {
        self.connector = connector
    }

    public func execute() async -> AsyncStream<[DeviceStateChange]> {
        let stream = await connector.getAllDeviceStateChangesStream()

        return AsyncStream { continuation in
            Task {
                for await changes in stream {
                    let rollaBandChanges = changes.filter { change in
                        switch change.currentState {
                        case .discovered(let device), .connecting(let device), .disconnected(let device):
                            return device.brand == .rolla && device.type == .band
                        case .connected(let device), .disconnecting(let device):
                            return device.brand == .rolla && device.deviceType == .band
                        }
                    }

                    guard !rollaBandChanges.isEmpty else { continue }

                    continuation.yield(rollaBandChanges)
                }
                continuation.finish()
            }
        }
    }
}

