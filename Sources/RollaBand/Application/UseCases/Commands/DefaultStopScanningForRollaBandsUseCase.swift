import Foundation

public final class DefaultStopScanningForRollaBandsUseCase: StopScanningForRollaBandsUseCase {
    private let scanner: BLEScanner

    public init(scanner: BLEScanner) {
        self.scanner = scanner
    }

    public func execute() async {
        await scanner.stop()
    }
}

