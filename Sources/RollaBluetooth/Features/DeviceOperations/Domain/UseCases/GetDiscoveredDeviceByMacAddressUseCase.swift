import Foundation

protocol GetDiscoveredDeviceByMacAddressUseCase: Sendable {
    func execute(macAddress: String) async -> DiscoveredDevice?
}

