import Foundation

final class DefaultGetBluetoothStateUseCase: GetBluetoothStateUseCase {
    private let coreCentralManager: CoreBLECentralManaging
    
    init(coreCentralManager: CoreBLECentralManaging) {
        self.coreCentralManager = coreCentralManager
    }
    
    func execute() async -> CBBluetoothState {
        await coreCentralManager.getBluetoothState()
    }
    
    func isBluetoothPoweredOn() async -> Bool {
        let state = await coreCentralManager.getBluetoothState()
        return state == .poweredOn
    }
}

