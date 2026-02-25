import Foundation

public final class DefaultObserveRollaBandDevicesUseCase: ObserveRollaBandDevicesUseCase {
    private let deviceManager: DeviceManager

    public init(deviceManager: DeviceManager) {
        self.deviceManager = deviceManager
    }

    public func execute() async -> AsyncStream<[RollaBandDevice]> {
        let allDevicesStream = await deviceManager.allDevicesStream()

        return AsyncStream { continuation in
            Task {
                for await devices in allDevicesStream {
                    let rollaBandDevices = devices
                        .filter { deviceState in
                            switch deviceState {
                            case .discovered(let discovered),
                                 .connecting(let discovered),
                                 .disconnected(let discovered):
                                return discovered.brand == .rolla
                            case .connected(let connected),
                                 .disconnecting(let connected):
                                return connected.brand == .rolla
                            }
                        }
                        .compactMap { RollaBandDevice($0) }

                    if !rollaBandDevices.isEmpty {
                        continuation.yield(rollaBandDevices)
                    }
                }

                continuation.finish()
            }
        }
    }
}

