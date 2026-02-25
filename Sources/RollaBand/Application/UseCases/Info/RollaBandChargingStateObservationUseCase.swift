import Foundation

public actor RollaBandChargingStateObservationUseCase: ChargingStateObservationUseCase {
    private let deviceIdentityManager: DeviceIdentityManaging
    private let observationManager: ObservationSessionsManager<ChargingStateData>
    private let chargingStateParser: RollaBandChargingStateParser

    public init(
        deviceIdentityManager: DeviceIdentityManaging,
        observationManager: ObservationSessionsManager<ChargingStateData>,
        chargingStateParser: RollaBandChargingStateParser
    ) {
        self.deviceIdentityManager = deviceIdentityManager
        self.observationManager = observationManager
        self.chargingStateParser = chargingStateParser
    }

    public func observeChargingState(for deviceId: String) async throws -> AsyncStream<ChargingStateData> {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        return await observationManager.startObservation(
            for: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid,
            parser: { [chargingStateParser] data, deviceUUID in
                chargingStateParser.parseChargingStateNotification(
                    from: data,
                    deviceUUID: deviceUUID
                )
            }
        )
    }

    public func stopObservingChargingState(for deviceId: String) async throws {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        await observationManager.stopObservation(for: deviceUUID)
    }
}

