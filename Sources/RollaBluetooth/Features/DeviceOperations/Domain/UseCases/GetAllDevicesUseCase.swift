import Foundation

protocol GetAllDevicesUseCase: Sendable {
    func execute() async -> [DeviceState]
}

