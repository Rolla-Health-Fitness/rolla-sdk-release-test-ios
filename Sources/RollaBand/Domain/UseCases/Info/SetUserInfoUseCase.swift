import Foundation

public protocol SetUserInfoUseCase: Sendable {
    func execute(for deviceId: String, userInfo: UserInfo) async throws
}
