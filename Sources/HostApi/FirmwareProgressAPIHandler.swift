import Foundation

extension FirmwareProgressAPI: @unchecked Sendable { }

final class FirmwareProgressAPIHandler: @unchecked Sendable {
    private let rollaBandManager: RollaBandManager
    private let flutterApi: FirmwareProgressAPIProtocol

    private var progressStreamingTask: Task<Void, Never>?

    init(
        rollaBandManager: RollaBandManager,
        flutterApi: FirmwareProgressAPIProtocol
    ) {
        self.rollaBandManager = rollaBandManager
        self.flutterApi = flutterApi
    }

    deinit {
        progressStreamingTask?.cancel()
    }
}

extension FirmwareProgressAPIHandler: FirmwareHostAPI {
    func startFirmwareUpdate(url: String, uuid: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [weak self, rollaBandManager] in
            guard let self = self else { return }

            do {
                await self.startProgressMonitoring()

                try await rollaBandManager.startFirmwareUpdate(
                    identifier: uuid,
                    firmwareUrl: url
                )

                await MainActor.run {
                    completionResolver.resolve(.success(()))
                }

            } catch {
                self.stopProgressMonitoring()
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
}

extension FirmwareProgressAPIHandler {
    func abortFirmwareUpdate() async {
        await rollaBandManager.abortFirmwareUpdate()
        stopProgressMonitoring()
    }
}

private extension FirmwareProgressAPIHandler {
    func startProgressMonitoring() async {
        stopProgressMonitoring()

        progressStreamingTask = Task { [weak self] in
            guard let self = self else { return }

            let eventsStream = await self.rollaBandManager.observeFirmwareUpdateEvents()

            for await event in eventsStream {
                if Task.isCancelled { break }
                await self.handleFirmwareUpdateEvent(event)
            }
        }
    }

    func stopProgressMonitoring() {
        progressStreamingTask?.cancel()
        progressStreamingTask = nil
    }
    
    func handleFirmwareUpdateEvent(_ event: BandFirmwareUpdateEvent) async {
        switch event {
        case .preparationFailed:
            await sendErrorToFlutter()
            stopProgressMonitoring()
            
        case .progressChanged(_, let progress, _):
            await sendProgressToFlutter(
                progress: Int64(progress)
            )
            
        case .updateCompleted:
            await sendCompletedToFlutter()
            stopProgressMonitoring()
            
        case .updateFailed:
            await sendErrorToFlutter()
            stopProgressMonitoring()
            
        case .updateAborted:
            await sendErrorToFlutter()
            stopProgressMonitoring()
        default:
            break
        }
    }
    
    func sendProgressToFlutter(progress: Int64) async {
        await MainActor.run {
            self.flutterApi.onFirmwareProgress(progress: progress) { _ in }
        }
    }
    
    func sendErrorToFlutter() async {
        await MainActor.run {
            self.flutterApi.onFirmwareUpdateError { _ in }
        }
    }

    func sendCompletedToFlutter() async {
        await MainActor.run {
            self.flutterApi.onFirmwareUpdateCompleted { _ in }
        }
    }
}
