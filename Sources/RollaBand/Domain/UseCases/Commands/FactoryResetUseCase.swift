import Foundation

public protocol FactoryResetUseCase: Sendable {
    func execute(for deviceId: String) async throws
}
