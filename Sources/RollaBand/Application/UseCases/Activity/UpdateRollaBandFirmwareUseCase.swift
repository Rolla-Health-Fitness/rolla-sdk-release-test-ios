import Foundation

public final class UpdateRollaBandFirmwareUseCase: Sendable {
    private let commandExecutor: CommandExecutor
    private let rollaBandCommandExecutor: RollaBandCommandExecutor
    private let firmwareUpdater: FirmwareUpdater
    private let deviceIdentityManager: DeviceIdentityManaging
    private let deviceManager: DeviceManager
    private let logger: Logging

    public init(
        commandExecutor: CommandExecutor,
        rollaBandCommandExecutor: RollaBandCommandExecutor,
        firmwareUpdater: FirmwareUpdater,
        deviceIdentityManager: DeviceIdentityManaging,
        deviceManager: DeviceManager,
        logger: Logging
    ) {
        self.commandExecutor = commandExecutor
        self.rollaBandCommandExecutor = rollaBandCommandExecutor
        self.firmwareUpdater = firmwareUpdater
        self.deviceIdentityManager = deviceIdentityManager
        self.deviceManager = deviceManager
        self.logger = logger
    }

    public func startFirmwareUpdate(
        firmwareUrl: String,
        deviceId: String
    ) async throws {
        logger.progress("Starting RollaBand firmware update process", category: .firmwareUpdate)

        guard let deviceUUID = await deviceIdentityManager.resolveDeviceIdentifier(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId)
        }

        guard await deviceManager.isDeviceConnected(deviceUUID: deviceUUID) else {
            throw BLEConnectionError.deviceNotConnected(deviceUUID)
        }

        try await prepareDeviceForOtaUpdate(deviceUUID: deviceUUID)

        try await firmwareUpdater.startUpdate(
            firmwareUrl: firmwareUrl,
            deviceUUID: deviceUUID
        )

        logger.success("RollaBand firmware update process initiated successfully", category: .firmwareUpdate)
    }

    public func abortUpdate() async {
        logger.warning("Aborting RollaBand firmware update", category: .firmwareUpdate)
        await firmwareUpdater.abortUpdate()
    }

    public func getEventsStream() async -> AsyncStream<BandFirmwareUpdateEvent> {
        let stream = await firmwareUpdater.observeUpdateEvents()

        return AsyncStream { continuation in
            Task {
                for await event in stream {
                    let deviceUUID: BLEDeviceIdentifier
                    switch event {
                    case .preparationStarted(let uuid), .preparationCompleted(let uuid),
                         .preparationFailed(let uuid, _), .updateStarted(let uuid),
                         .progressChanged(let uuid, _, _), .updateCompleted(let uuid),
                         .updateFailed(let uuid, _), .updateAborted(let uuid):
                        deviceUUID = uuid
                    }

                    guard let macAddress = await deviceIdentityManager.getMAC(for: deviceUUID.value) else {
                        continue
                    }

                    if let bandEvent = BandFirmwareUpdateEvent(event, macAddress: macAddress) {
                        continuation.yield(bandEvent)
                    }
                }
                continuation.finish()
            }
        }
    }
    
    private func prepareDeviceForOtaUpdate(deviceUUID: BLEDeviceIdentifier) async throws {
        logger.progress(
            "Preparing RollaBand device for OTA update",
            category: .firmwareUpdate
        )
        
        let command = PrepareOtaUpdateCommand(
            deviceUUID: deviceUUID,
            timeout: 10.0
        )
        
        do {
            try await rollaBandCommandExecutor.execute(command, retryPolicy: .immediate)
            logger.success(
                "RollaBand device successfully prepared for OTA update",
                category: .firmwareUpdate
            )
        } catch {
            logger.error(
                "Failed to prepare RollaBand for OTA update: \(error)",
                category: .firmwareUpdate
            )
            throw error
        }
    }
}

