import Foundation

public protocol GetCurrentBluetoothStateUseCase: Sendable {
    func execute() async -> CBBluetoothState
}

