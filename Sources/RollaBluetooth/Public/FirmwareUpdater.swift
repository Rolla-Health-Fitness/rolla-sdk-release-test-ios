import Foundation

public final class FirmwareUpdater: Sendable {
    private let startUpdateUseCase: StartFirmwareUpdateUseCase
    private let abortUpdateUseCase: AbortFirmwareUpdateUseCase
    private let observeEventsUseCase: ObserveFirmwareUpdateEventsUseCase
    
    init(
        startUpdateUseCase: StartFirmwareUpdateUseCase,
        abortUpdateUseCase: AbortFirmwareUpdateUseCase,
        observeEventsUseCase: ObserveFirmwareUpdateEventsUseCase
    ) {
        self.startUpdateUseCase = startUpdateUseCase
        self.abortUpdateUseCase = abortUpdateUseCase
        self.observeEventsUseCase = observeEventsUseCase
    }
    
    public convenience init() {
        let deps = RollaBluetoothDependencies.shared
        self.init(
            startUpdateUseCase: deps.startFirmwareUpdateUseCase,
            abortUpdateUseCase: deps.abortFirmwareUpdateUseCase,
            observeEventsUseCase: deps.observeFirmwareUpdateEventsUseCase
        )
    }
    
    public func startUpdate(firmwareUrl: String, deviceUUID: BLEDeviceIdentifier) async throws {
        try await startUpdateUseCase.execute(firmwareUrl: firmwareUrl, deviceUUID: deviceUUID)
    }
    
    public func abortUpdate() async {
        await abortUpdateUseCase.execute()
    }
    
    public func observeUpdateEvents() async -> AsyncStream<FirmwareUpdateEvent> {
        return await observeEventsUseCase.execute()
    }
}

