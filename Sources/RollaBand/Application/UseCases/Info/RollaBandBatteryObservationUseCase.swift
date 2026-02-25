import Foundation

public final class RollaBandBatteryObservationUseCase: BatteryObservationUseCase {
    private let deviceIdentityManager: DeviceIdentityManaging
    private let observationManager: ObservationSessionsManager<BatteryLevelData>
    private let batteryParser: RollaBandBatteryNotificationParser

    public init(
        deviceIdentityManager: DeviceIdentityManaging,
        observationManager: ObservationSessionsManager<BatteryLevelData>,
        batteryParser: RollaBandBatteryNotificationParser
    ) {
        self.deviceIdentityManager = deviceIdentityManager
        self.observationManager = observationManager
        self.batteryParser = batteryParser
    }

    public func startObservingBattery(for deviceId: String) async throws -> AsyncStream<BatteryLevelData> {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        return await observationManager.startObservation(
            for: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid,
            parser: { [batteryParser] data, deviceUUID in
                batteryParser.parseBatteryNotification(
                    from: data,
                    deviceUUID: deviceUUID
                )
            }
        )
    }

    public func stopObservingBattery(for deviceId: String) async throws {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        await observationManager.stopObservation(for: deviceUUID)
    }
}
