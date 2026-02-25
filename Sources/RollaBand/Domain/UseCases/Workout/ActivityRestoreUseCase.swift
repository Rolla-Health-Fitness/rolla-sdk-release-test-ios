import Foundation

public protocol ActivityRestoreUseCase: Sendable {
    func setActivityRestorePending(_ pending: Bool) async
    func markActivityAsActive() async
    func getPendingRestoreDeviceId() async -> String?
}

