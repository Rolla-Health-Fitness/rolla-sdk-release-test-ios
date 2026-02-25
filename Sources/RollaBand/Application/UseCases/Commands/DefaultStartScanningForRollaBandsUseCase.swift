import Foundation

public final class DefaultStartScanningForRollaBandsUseCase: StartScanningForRollaBandsUseCase {
    private let scanner: BLEScanner

    public init(scanner: BLEScanner) {
        self.scanner = scanner
    }

    public func execute(duration: TimeInterval?) async throws {
        try await scanner.start(
            filters: ScanFilters(brands: [.rolla], types: [.band]),
            duration: duration
        )
    }
}

