import Foundation

protocol AbortFirmwareUpdateUseCase: Sendable {
    func execute() async
}

final class DefaultAbortFirmwareUpdateUseCase: AbortFirmwareUpdateUseCase {
    private let firmwareUpdateManager: FirmwareUpdateManaging
    private let logger: Logging
    
    init(
        firmwareUpdateManager: FirmwareUpdateManaging,
        logger: Logging
    ) {
        self.firmwareUpdateManager = firmwareUpdateManager
        self.logger = logger
    }
    
    func execute() async {
        logger.warning("Aborting firmware update", category: .firmwareUpdate)
        firmwareUpdateManager.abortFirmwareUpdate()
    }
}

