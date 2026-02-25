import Foundation

public final class BLEScanner: Sendable {
    private let scanningUseCase: ScanningUseCase

    init(scanningUseCase: ScanningUseCase) {
        self.scanningUseCase = scanningUseCase
    }

    public convenience init() {
        let deps = RollaBluetoothDependencies.shared
        self.init(
            scanningUseCase: deps.scanningUseCase
        )
    }

    public func start() async throws {
        try await scanningUseCase.startScanning()
    }

    public func start(filters: ScanFilters, duration: TimeInterval? = nil) async throws {
        try await scanningUseCase.startScanning(filters: filters, duration: duration)
    }

    public func stop() async {
        await scanningUseCase.stopScanning()
    }

    public func isScanning() async -> Bool {
        return await scanningUseCase.isScanning()
    }
}
