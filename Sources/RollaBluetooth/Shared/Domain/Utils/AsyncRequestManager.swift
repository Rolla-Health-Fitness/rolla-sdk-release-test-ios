import Foundation

protocol DeviceScoped {
    var deviceUUID: BLEDeviceIdentifier { get }
}

actor AsyncRequestManager<RequestKey: Hashable & Sendable, ResponseType: Sendable> {

    private enum RequestState {
        case registered(timestamp: Date)
        case waiting(PendingRequest)
        case fulfilled(ResponseType, timestamp: Date)
        case failed(Error, timestamp: Date)

        var timestamp: Date {
            switch self {
            case .registered(let timestamp): return timestamp
            case .waiting(let request): return request.createdAt
            case .fulfilled(_, let timestamp): return timestamp
            case .failed(_, let timestamp): return timestamp
            }
        }
    }

    private struct PendingRequest: Sendable {
        let continuation: CheckedContinuation<ResponseType, Error>
        let expirationTask: Task<Void, Never>?
        let matcher: (@Sendable (ResponseType) throws -> Bool)?
        let createdAt: Date
        let timeout: TimeInterval?
        let requestId: UUID

        init(
            continuation: CheckedContinuation<ResponseType, Error>,
            expirationTask: Task<Void, Never>?,
            matcher: (@Sendable (ResponseType) throws -> Bool)?,
            timeout: TimeInterval?
        ) {
            self.continuation = continuation
            self.expirationTask = expirationTask
            self.matcher = matcher
            self.createdAt = Date()
            self.timeout = timeout
            self.requestId = UUID()
        }
    }

    private var requests: [RequestKey: RequestState] = [:]
    private var isShuttingDown = false
    private var lastCleanupTime = Date()
    private var cleanupTask: Task<Void, Never>?

    private let maxRetainedCompletedRequests = 100
    private let completedRequestRetentionTime: TimeInterval = 300
    private let cleanupInterval: TimeInterval = 180

    init() {

    }

    func startCleanupTask() {
        cleanupTask = Task { [weak self] in
            await self?.startPeriodicCleanup()
        }
    }

    func registerRequest(key: RequestKey) async throws {
        guard !isShuttingDown else {
            throw AsyncRequestError.managerDeallocated
        }

        if let existingState = requests[key] {
            switch existingState {
            case .registered, .waiting:
                await fulfillRequestWithError(key: key, error: AsyncRequestError.superseded)
            case .fulfilled, .failed:
                requests.removeValue(forKey: key)
            }
        }

        requests[key] = .registered(timestamp: Date())
        await cleanupIfNeeded()
    }

    func waitForRequest(
        key: RequestKey,
        timeout: TimeInterval? = nil,
        matcher: (@Sendable (ResponseType) throws -> Bool)? = nil
    ) async throws -> ResponseType {
        guard !isShuttingDown else { throw AsyncRequestError.managerDeallocated }
        guard let state = requests[key] else { throw AsyncRequestError.notRegistered }

        switch state {
        case .registered: break
        case .waiting: throw AsyncRequestError.alreadyWaiting
        case .fulfilled(let value, _):
            requests.removeValue(forKey: key)
            return value
        case .failed(let error, _):
            requests.removeValue(forKey: key)
            throw error
        }

        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { (cont: CheckedContinuation<ResponseType, Error>) in
                let expirationTask: Task<Void, Never>? = timeout.map { t in
                    Task { [weak self, key] in
                        do {
                            try await Task.sleep(nanoseconds: UInt64(t * 1_000_000_000))
                            if !Task.isCancelled {
                                await self?.handleTimeout(for: key)
                            }
                        } catch is CancellationError {
                            // Expected - ignore
                        } catch {
                            // Unexpected - ignore
                        }
                    }
                }

                let pending = PendingRequest(
                    continuation: cont,
                    expirationTask: expirationTask,
                    matcher: matcher,
                    timeout: timeout
                )
                requests[key] = .waiting(pending)

                if Task.isCancelled {
                    expirationTask?.cancel()
                    requests.removeValue(forKey: key)
                    cont.resume(throwing: AsyncRequestError.cancelled)
                    return
                }
            }
        } onCancel: { [weak self] in
            Task { await self?.handleCancellation(for: key) }
        }
    }

    func fulfillRequest(key: RequestKey, value: ResponseType) async {
        guard !isShuttingDown else { return }
        guard let state = requests[key] else { return }

        switch state {
        case .waiting(let pending):
            if let matcher = pending.matcher {
                do {
                    let matches = try matcher(value)
                    if matches {
                        await completePendingRequest(key: key, pending: pending, result: .success(value))
                    } else {
                        return
                    }
                } catch {
                    let matcherError = AsyncRequestError.matcherFailed(error.localizedDescription)
                    await completePendingRequest(key: key, pending: pending, result: .failure(matcherError))
                }
            } else {
                await completePendingRequest(key: key, pending: pending, result: .success(value))
            }

        case .registered:
            requests[key] = .fulfilled(value, timestamp: Date())

        case .fulfilled, .failed:
            break
        }
    }

    func fulfillRequestWithError(key: RequestKey, error: Error) async {
        guard !isShuttingDown else { return }
        guard let state = requests[key] else { return }

        switch state {
        case .waiting(let pending):
            await completePendingRequest(key: key, pending: pending, result: .failure(error))

        case .registered:
            requests[key] = .failed(error, timestamp: Date())

        case .fulfilled, .failed:
            break
        }
    }

    func cancelRequest(key: RequestKey) async {
        await fulfillRequestWithError(key: key, error: AsyncRequestError.cancelled)
    }

    func cancelPendingRequestsForDevice(deviceUUID: BLEDeviceIdentifier) async where RequestKey: DeviceScoped {
        let deviceKeys = requests.keys.filter { $0.deviceUUID == deviceUUID }
        for key in deviceKeys {
            await fulfillRequestWithError(key: key, error: AsyncRequestError.deviceDisconnected(deviceUUID))
        }
    }

    func cancelAllRequests() async {
        let keys = Array(requests.keys)
        for key in keys {
            await cancelRequest(key: key)
        }
    }

    func hasRequest(for key: RequestKey) -> Bool {
        return requests[key] != nil
    }

    func isWaiting(for key: RequestKey) -> Bool {
        if case .waiting = requests[key] {
            return true
        }
        return false
    }

    func allRequestKeys() -> [RequestKey] {
        return Array(requests.keys)
    }

    func pendingRequestKeys() -> [RequestKey] {
        return requests.compactMap { key, state in
            if case .waiting = state { return key } else { return nil }
        }
    }

    func getRequestsForDevice(deviceUUID: BLEDeviceIdentifier) -> [RequestKey] where RequestKey: DeviceScoped {
        return requests.keys.filter { $0.deviceUUID == deviceUUID }
    }

    func resetTimeout(for key: RequestKey, timeout: TimeInterval) async throws {
        guard !isShuttingDown else {
            throw AsyncRequestError.managerDeallocated
        }

        guard let state = requests[key] else {
            throw AsyncRequestError.notRegistered
        }

        guard case .waiting(let pending) = state else {
            throw AsyncRequestError.invalidState
        }

        pending.expirationTask?.cancel()

        let newExpirationTask = Task { [weak self, key] in
            do {
                try await Task.sleep(nanoseconds: UInt64(timeout * 1_000_000_000))
                if !Task.isCancelled, let strongSelf = self {
                    await strongSelf.handleTimeout(for: key)
                }
            } catch {
                // Ignore
            }
        }

        let updatedPending = PendingRequest(
            continuation: pending.continuation,
            expirationTask: newExpirationTask,
            matcher: pending.matcher,
            timeout: timeout
        )

        requests[key] = .waiting(updatedPending)
    }

    func shutdown() async {
        isShuttingDown = true
        cleanupTask?.cancel()
        await cancelAllRequests()
        requests.removeAll()
    }

    private func completePendingRequest(
        key: RequestKey,
        pending: PendingRequest,
        result: Result<ResponseType, Error>
    ) async {
        pending.expirationTask?.cancel()
        requests.removeValue(forKey: key)

        switch result {
        case .success(let value):
            pending.continuation.resume(returning: value)
        case .failure(let error):
            pending.continuation.resume(throwing: error)
        }
    }

    private func handleTimeout(for key: RequestKey) async {
        await fulfillRequestWithError(key: key, error: AsyncRequestError.timeout)
    }

    private func handleCancellation(for key: RequestKey) async {
        await fulfillRequestWithError(key: key, error: AsyncRequestError.cancelled)
    }

    private func startPeriodicCleanup() async {
        while !isShuttingDown {
            do {
                try await Task.sleep(nanoseconds: UInt64(cleanupInterval * 1_000_000_000))
                if !isShuttingDown {
                    await performCleanup()
                }
            } catch {
                break
            }
        }
    }

    private func cleanupIfNeeded() async {
        let now = Date()
        if now.timeIntervalSince(lastCleanupTime) > cleanupInterval {
            await performCleanup()
        }
    }

    private func performCleanup() async {
        let now = Date()
        let cutoffTime = now.addingTimeInterval(-completedRequestRetentionTime)

        var completedRequests: [(RequestKey, Date)] = []

        for (key, state) in requests {
            switch state {
            case .fulfilled(_, let timestamp), .failed(_, let timestamp):
                completedRequests.append((key, timestamp))
            default:
                break
            }
        }

        completedRequests.sort { $0.1 < $1.1 }

        for (key, timestamp) in completedRequests {
            if timestamp < cutoffTime {
                requests.removeValue(forKey: key)
            }
        }

        if completedRequests.count > maxRetainedCompletedRequests {
            let excessCount = completedRequests.count - maxRetainedCompletedRequests
            for i in 0..<excessCount {
                let (key, _) = completedRequests[i]
                if requests[key] != nil {
                    requests.removeValue(forKey: key)
                }
            }
        }

        lastCleanupTime = now
    }

    deinit {
        for (_, state) in requests {
            switch state {
            case .waiting(let pending):
                pending.expirationTask?.cancel()
                pending.continuation.resume(throwing: AsyncRequestError.managerDeallocated)
            default:
                break
            }
        }
    }
}
