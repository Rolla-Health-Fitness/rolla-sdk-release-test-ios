import Foundation

public protocol StopScanningForRollaBandsUseCase: Sendable {
    func execute() async
}

