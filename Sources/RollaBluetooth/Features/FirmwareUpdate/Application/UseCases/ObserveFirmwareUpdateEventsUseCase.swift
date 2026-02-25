import Foundation

protocol ObserveFirmwareUpdateEventsUseCase: Sendable {
    func execute() async -> AsyncStream<FirmwareUpdateEvent>
}

final class DefaultObserveFirmwareUpdateEventsUseCase: ObserveFirmwareUpdateEventsUseCase {
    private let firmwareUpdateManager: FirmwareUpdateManaging
    
    init(firmwareUpdateManager: FirmwareUpdateManaging) {
        self.firmwareUpdateManager = firmwareUpdateManager
    }
    
    func execute() async -> AsyncStream<FirmwareUpdateEvent> {
        return await firmwareUpdateManager.getEventsStream()
    }
}

