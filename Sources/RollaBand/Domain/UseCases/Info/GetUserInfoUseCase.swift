import Foundation

public protocol GetUserInfoUseCase: Sendable {
    func execute(for deviceId: String) async throws -> UserInfo
}
