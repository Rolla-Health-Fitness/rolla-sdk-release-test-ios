import Foundation

public final class DefaultRunningSpeedCadenceObservationUseCase: RunningSpeedCadenceObservationUseCase {
    private let observationManager: ObservationSessionsManager<RunningSpeedCadenceData>
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager
    private let rscParser: RSCDataParser
    private let commandExecutor: CommandExecutor
    private let logger: Logging

    public init(
        observationManager: ObservationSessionsManager<RunningSpeedCadenceData>,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager,
        rscParser: RSCDataParser,
        commandExecutor: CommandExecutor,
        logger: Logging
    ) {
        self.observationManager = observationManager
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
        self.rscParser = rscParser
        self.commandExecutor = commandExecutor
        self.logger = logger
    }
}

extension DefaultRunningSpeedCadenceObservationUseCase {
    public func observeRSC(for deviceId: String) async throws -> AsyncStream<RunningSpeedCadenceData> {

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        let deviceName = await deviceManager.getDeviceName(deviceId: deviceUUID)

        try await commandExecutor.execute(EnableNotificationCommand(
            deviceID: deviceUUID,
            serviceUUID: BLEServiceType.runningSpeedAndCadence.uuid,
            characteristicUUID: BLECharacteristicType.rscMeasurement.uuid,
            timeout: 10.0
        ))

        let stream = await observationManager.startObservation(
            for: deviceUUID,
            serviceUUID: BLEServiceType.runningSpeedAndCadence.uuid,
            characteristicUUID: BLECharacteristicType.rscMeasurement.uuid,
            parser: { [weak self] data, deviceUUID in
                self?.rscParser.parseRSCData(from: data, deviceUUID: deviceUUID)
            }
        )

        logger.success("Started RSC observation for \(deviceName ?? "Unknown Device")", category: .workout)

        return stream
    }

    public func stopObservingRSC(for deviceId: String) async throws {
        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        await observationManager.stopObservation(for: deviceUUID)

        do {
            try await commandExecutor.execute(DisableNotificationCommand(
                deviceID: deviceUUID,
                serviceUUID: BLEServiceType.runningSpeedAndCadence.uuid,
                characteristicUUID: BLECharacteristicType.rscMeasurement.uuid,
                timeout: 10.0
            ))
        } catch {
            logger.error("Failed to disable RSC notifications: \(error)", category: .workout)
        }

        logger.success("Stopped RSC observation for device \(deviceId)", category: .workout)
    }
}
