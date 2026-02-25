import Foundation

final class RollaBandHealthDataHostApiHandler {
    private let rollaBandManager: RollaBandManager

    init(
        rollaBandManager: RollaBandManager
    ) {
        self.rollaBandManager = rollaBandManager
    }
}

extension RollaBandHealthDataHostApiHandler: RollaBandHealthDataHostApi {
    func getStepsData(
        uuid: String,
        lastSyncedBlockTimestamp: Int64,
        lastSyncedEntryTimestamp: Int64,
        completion: @escaping (Result<RollaBandStepsSyncResponse, Error>) -> Void
    ) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let result = try await rollaBandManager.syncSteps(
                    identifier: uuid,
                    lastSyncedBlockTimestamp: Int(lastSyncedBlockTimestamp),
                    lastSyncedEntryTimestamp: Int(lastSyncedEntryTimestamp)
                )

                let syncResponse = result.toPigeonResponse()

                await MainActor.run {
                    completionResolver.resolve(.success(syncResponse))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }

    func getHeartRateData(
        uuid: String,
        activityLastSyncedBlockTimestamp: Int64,
        activityLastSyncedEntryTimestamp: Int64,
        passiveLastSyncedTimestamp: Int64,
        completion: @escaping (Result<RollaBandHeartRateSyncResponse, Error>) -> Void
    ) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let result = try await rollaBandManager.syncHeartRate(
                    identifier: uuid,
                    activityLastSyncedBlockTimestamp: Int(activityLastSyncedBlockTimestamp),
                    activityLastSyncedEntryTimestamp: Int(activityLastSyncedEntryTimestamp),
                    passiveLastSyncedTimestamp: Int(passiveLastSyncedTimestamp)
                )

                let syncResponse = result.toPigeonResponse()

                await MainActor.run {
                    completionResolver.resolve(.success(syncResponse))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }

    func getHRVData(
        uuid: String,
        lastSyncedBlockTimestamp: Int64,
        completion: @escaping (Result<RollaBandHRVSyncResponse, Error>) -> Void
    ) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let result = try await rollaBandManager.syncHRV(
                    identifier: uuid,
                    lastSyncedBlockTimestamp: Int(lastSyncedBlockTimestamp)
                )

                let syncResponse = result.toPigeonResponse()

                await MainActor.run {
                    completionResolver.resolve(.success(syncResponse))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }

    func getSleepData(
        uuid: String,
        lastSyncedBlockTimestamp: Int64,
        lastSyncedEntryTimestamp: Int64,
        completion: @escaping (Result<RollaBandSleepSyncResponse, Error>) -> Void
    ) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let result = try await rollaBandManager.syncSleep(
                    identifier: uuid,
                    lastSyncedBlockTimestamp: Int(lastSyncedBlockTimestamp),
                    lastSyncedEntryTimestamp: Int(lastSyncedEntryTimestamp)
                )

                let syncResponse = result.toPigeonResponse()

                await MainActor.run {
                    completionResolver.resolve(.success(syncResponse))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
    
    func getRawDataLogs(
        uuid: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        let completionResolver = CompletionResolver(completion)
        
        Task { [rollaBandManager] in
            do {
                let rawLogs = try await rollaBandManager.getAllRawLogs(identifier: uuid)
                
                await MainActor.run {
                    completionResolver.resolve(.success(rawLogs))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
}
