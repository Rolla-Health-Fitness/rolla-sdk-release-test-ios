import Foundation

public protocol ObserveBluetoothStateChangesUseCase: Sendable {
    func execute() async -> AsyncStream<CBBluetoothState>
}

