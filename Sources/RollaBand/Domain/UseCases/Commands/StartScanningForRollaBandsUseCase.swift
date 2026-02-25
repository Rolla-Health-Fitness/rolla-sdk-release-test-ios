import Foundation

public protocol StartScanningForRollaBandsUseCase: Sendable {
    func execute(duration: TimeInterval?) async throws
}

