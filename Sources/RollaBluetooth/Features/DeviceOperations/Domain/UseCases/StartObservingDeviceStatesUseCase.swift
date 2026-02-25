import Foundation

protocol StartObservingDeviceStatesUseCase: Sendable {
    func execute() async -> AsyncStream<[DeviceState]>
}

