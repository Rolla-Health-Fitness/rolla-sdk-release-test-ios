import Foundation

public final class RollaBandHeartRateObservationUseCase: HeartRateObservationUseCase {
    private let observationManager: ObservationSessionsManager<HeartRateData>
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager
    private let heartRateParser: HeartRateDataParser
    private let commandExecutor: CommandExecutor
    private let logger: Logging

    public init(
        observationManager: ObservationSessionsManager<HeartRateData>,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager,
        heartRateParser: HeartRateDataParser,
        commandExecutor: CommandExecutor,
        logger: Logging
    ) {
        self.observationManager = observationManager
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
        self.heartRateParser = heartRateParser
        self.commandExecutor = commandExecutor
        self.logger = logger
    }
}

extension RollaBandHeartRateObservationUseCase {
    public func observeHeartRate(for deviceId: String) async throws -> AsyncStream<HeartRateData> {

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let deviceName = await deviceManager.getDeviceName(deviceId: deviceUUID)

        try await commandExecutor.execute(EnableNotificationCommand(
            deviceID: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid,
            timeout: 10.0
        ))

        let stream = await observationManager.startObservation(
            for: deviceUUID,
            serviceUUID: BLEServiceType.rollaBand.uuid,
            characteristicUUID: BLECharacteristicType.rollaBandNotification.uuid,
            parser: { [weak self] data, deviceUUID in
                self?.heartRateParser.parseRollaBandHeartRateData(
                    from: data,
                    deviceUUID: deviceUUID
                )
            }
        )

        logger.success("Started HR observation for \(deviceName ?? "Unknown Device")", category: .workout)

        return stream
    }

    public func stopObservingHeartRate(for deviceId: String) async throws {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        await observationManager.stopObservation(for: deviceUUID)

        logger.success("Stopped HR observation for device \(deviceId)", category: .workout)
    }
}
