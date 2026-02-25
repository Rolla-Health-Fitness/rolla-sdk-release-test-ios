import Foundation

final class DefaultStartObservingBluetoothStateUseCase: StartObservingBluetoothStateUseCase {
    private let coreCentralManager: CoreBLECentralManaging
    
    init(coreCentralManager: CoreBLECentralManaging) {
        self.coreCentralManager = coreCentralManager
    }
    
    func execute() async -> AsyncStream<CBBluetoothState> {
        await coreCentralManager.bluetoothStateStream()
    }
}

