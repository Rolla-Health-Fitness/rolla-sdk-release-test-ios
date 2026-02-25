import Foundation

public protocol ConnectRollaBandUseCase: Sendable {
    func execute(identifier: String, timeout: TimeInterval) async throws
}
