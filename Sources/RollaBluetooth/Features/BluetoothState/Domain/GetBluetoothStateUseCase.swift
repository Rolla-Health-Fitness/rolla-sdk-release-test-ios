import Foundation

protocol GetBluetoothStateUseCase: Sendable {
    func execute() async -> CBBluetoothState
    func isBluetoothPoweredOn() async -> Bool
}

