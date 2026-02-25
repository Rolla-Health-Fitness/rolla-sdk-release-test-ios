import Foundation

protocol StartObservingBluetoothStateUseCase: Sendable {
    func execute() async -> AsyncStream<CBBluetoothState>
}
