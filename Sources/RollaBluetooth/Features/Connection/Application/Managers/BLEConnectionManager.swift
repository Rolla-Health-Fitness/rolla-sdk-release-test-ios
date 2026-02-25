import Foundation
import CoreBluetooth

enum CentralManagerRequestKey: Hashable, Sendable, DeviceScoped {
    case connect(deviceUUID: BLEDeviceIdentifier)
    case disconnect(deviceUUID: BLEDeviceIdentifier)

    var deviceUUID: BLEDeviceIdentifier {
        switch self {
        case .connect(let deviceUUID): return deviceUUID
        case .disconnect(let deviceUUID): return deviceUUID
        }
    }
}

actor BLEConnectionManager: BLEConnectionManaging {
    private let centralManager: CoreBLECentralManaging
    private let asyncRequestManager: AsyncRequestManager<CentralManagerRequestKey, Void>

    init(
        centralManager: CoreBLECentralManaging,
        asyncRequestManager: AsyncRequestManager<CentralManagerRequestKey, Void>
    ) {
        self.centralManager = centralManager
        self.asyncRequestManager = asyncRequestManager
    }

    func connect(to deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws {
        let key = CentralManagerRequestKey.connect(deviceUUID: deviceUUID)

        do {
            try await asyncRequestManager.registerRequest(key: key)
            try await centralManager.initiateConnect(to: deviceUUID)
            try await asyncRequestManager.waitForRequest(key: key, timeout: timeout)
            
        } catch {
            try? await centralManager.initiateDisconnect(from: deviceUUID)
            await asyncRequestManager.cancelPendingRequestsForDevice(deviceUUID: deviceUUID)
            throw error
        }
    }

    func disconnect(from deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) async throws {
        let key = CentralManagerRequestKey.disconnect(deviceUUID: deviceUUID)

        do {
            try await asyncRequestManager.registerRequest(key: key)
            try await centralManager.initiateDisconnect(from: deviceUUID)
            try await asyncRequestManager.waitForRequest(key: key, timeout: timeout)
            await asyncRequestManager.cancelPendingRequestsForDevice(deviceUUID: deviceUUID)

        } catch {
            await asyncRequestManager.cancelPendingRequestsForDevice(deviceUUID: deviceUUID)
            throw error
        }
    }
}


