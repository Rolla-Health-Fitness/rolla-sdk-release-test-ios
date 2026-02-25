import Foundation

protocol StartFirmwareUpdateUseCase: Sendable {
    func execute(firmwareUrl: String, deviceUUID: BLEDeviceIdentifier) async throws
}

final class DefaultStartFirmwareUpdateUseCase: StartFirmwareUpdateUseCase {
    private let firmwareUpdateManager: FirmwareUpdateManaging
    private let logger: Logging

    init(
        firmwareUpdateManager: FirmwareUpdateManaging,
        logger: Logging
    ) {
        self.firmwareUpdateManager = firmwareUpdateManager
        self.logger = logger
    }

    func execute(firmwareUrl: String, deviceUUID: BLEDeviceIdentifier) async throws {
        logger.progress("Starting firmware update process for: \(deviceUUID.uuidString)", category: .firmwareUpdate)

        if await firmwareUpdateManager.isUpdateInProgress() {
            throw UpdateFirmwareError.updateAlreadyInProgress
        }

        await firmwareUpdateManager.startFirmwareUpdate(
            firmwareUrlString: firmwareUrl,
            deviceUUID: deviceUUID
        )

        logger.success("Firmware update process initiated successfully", category: .firmwareUpdate)
    }
}

