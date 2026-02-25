import Foundation

public protocol ObserveAllDeviceStateChangesUseCase: Sendable {
    func execute() async -> AsyncStream<[DeviceStateChange]>
}

