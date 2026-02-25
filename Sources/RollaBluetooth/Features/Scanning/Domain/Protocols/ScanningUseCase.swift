import Foundation

public protocol ScanningUseCase: Sendable {
    func startScanning() async throws
    func startScanning(filters: ScanFilters, duration: TimeInterval?) async throws
    func isScanning() async -> Bool
    func stopScanning() async
}
