import Foundation

public struct DefaultActivityRestoreUseCase: ActivityRestoreUseCase {
    private let workoutManager: RollaBandWorkoutManaging

    public init(workoutManager: RollaBandWorkoutManaging) {
        self.workoutManager = workoutManager
    }

    public func setActivityRestorePending(_ pending: Bool) async {
        await workoutManager.setActivityRestorePending(pending)
    }

    public func markActivityAsActive() async {
        await workoutManager.markActivityAsActive()
    }

    public func getPendingRestoreDeviceId() async -> String? {
        await workoutManager.getPendingRestoreDeviceId()
    }
}

