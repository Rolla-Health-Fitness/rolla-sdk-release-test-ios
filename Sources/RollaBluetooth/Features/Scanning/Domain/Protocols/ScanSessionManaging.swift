import Foundation

protocol ScanSessionManaging: Sendable {
    func startSession(_ session: ScanSession) async throws
    func stopSession(_ sessionId: UUID) async throws
    func stopAllSessions() async
    func isScanning() async -> Bool
    func hasSession(_ sessionId: UUID) async -> Bool
    func scanResultsStream() async -> AsyncStream<ScanResult>
}
