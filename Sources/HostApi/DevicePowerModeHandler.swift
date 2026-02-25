import Foundation

@MainActor
final class DevicePowerModeHandler: DevicePowerModeHostApi {
    private let flutterApi: DevicePowerModeFlutterApiProtocol
    private var observationTask: Task<Void, Never>?

    init(flutterApi: DevicePowerModeFlutterApiProtocol) {
        self.flutterApi = flutterApi
        startObservation()
    }

    func stop() {
        observationTask?.cancel()
        observationTask = nil
    }

    nonisolated func isLowPowerModeEnabled() throws -> Bool {
        ProcessInfo.processInfo.isLowPowerModeEnabled
    }

    private func startObservation() {
        observationTask = Task { [weak self] in
            for await isEnabled in Self.makePowerModeStream() {
                guard let self else { break }
                guard !Task.isCancelled else { break }

                self.flutterApi.onLowPowerModeChanged(
                    isLowPowerModeEnabled: isEnabled
                ) { _ in }
            }
        }
    }

    private nonisolated static func makePowerModeStream() -> AsyncStream<Bool> {
        AsyncStream { continuation in
            continuation.yield(ProcessInfo.processInfo.isLowPowerModeEnabled)

            let observer = NotificationCenter.default.addObserver(
                forName: .NSProcessInfoPowerStateDidChange,
                object: nil,
                queue: .main
            ) { _ in
                continuation.yield(ProcessInfo.processInfo.isLowPowerModeEnabled)
            }

            continuation.onTermination = { @Sendable _ in
                NotificationCenter.default.removeObserver(observer)
            }
        }
    }
}
