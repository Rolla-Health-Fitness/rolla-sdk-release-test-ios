import Foundation

public actor EventStreamSource<Value: Sendable> {
    public enum BufferingPolicy {
        case unbounded
        case bufferingNewest(Int)
        case bufferingOldest(Int)
    }
    
    private var continuations: [UUID: AsyncStream<Value>.Continuation] = [:]
    private let maxContinuations: Int
    private let bufferingPolicy: BufferingPolicy
    
    public init(
        maxContinuations: Int = 50,
        bufferingPolicy: BufferingPolicy = .unbounded
    ) {
        self.maxContinuations = max(1, min(maxContinuations, 1000))
        self.bufferingPolicy = bufferingPolicy
    }
    
    public func makeStream() -> (stream: AsyncStream<Value>, id: UUID) {
        guard continuations.count < maxContinuations else {
            let emptyStream = AsyncStream<Value> { $0.finish() }
            return (emptyStream, UUID())
        }
        
        let streamId = UUID()
        let policy = makeAsyncStreamBufferingPolicy()
        
        let stream = AsyncStream(bufferingPolicy: policy) { [weak self] continuation in
            guard let self else {
                continuation.finish()
                return
            }
            
            Task {
                await self.addContinuation(continuation, for: streamId)
            }
            
            continuation.onTermination = { @Sendable [weak self] _ in
                guard let self else { return }
                Task {
                    await self.removeContinuation(for: streamId)
                }
            }
        }
        
        return (stream, streamId)
    }
    
    public func finishStream(id: UUID) {
        guard let continuation = continuations[id] else {
            return
        }
        continuations.removeValue(forKey: id)
        continuation.finish()
    }
    
    public func yield(_ value: Value) {
        guard !continuations.isEmpty else {
            return
        }
        
        var terminatedIds: [UUID] = []
        var enqueuedCount = 0
        var droppedCount = 0
        
        for (id, continuation) in continuations {
            switch continuation.yield(value) {
            case .enqueued:
                enqueuedCount += 1
            case .dropped:
                droppedCount += 1
            case .terminated:
                terminatedIds.append(id)
            @unknown default:
                break
            }
        }
        
        if !terminatedIds.isEmpty {
            for id in terminatedIds {
                continuations.removeValue(forKey: id)
            }
        }
    }
    
    public func finishAll() {
        for continuation in continuations.values {
            continuation.finish()
        }
        continuations.removeAll()
    }
    
    public var streamCount: Int {
        continuations.count
    }
    
    public var isEmpty: Bool {
        continuations.isEmpty
    }
    
    private func addContinuation(_ continuation: AsyncStream<Value>.Continuation, for id: UUID) {
        guard continuations.count < maxContinuations else {
            continuation.finish()
            return
        }
        
        continuations[id] = continuation
    }
    
    private func removeContinuation(for id: UUID) {
        continuations.removeValue(forKey: id)
    }
    
    private func makeAsyncStreamBufferingPolicy() -> AsyncStream<Value>.Continuation.BufferingPolicy {
        switch bufferingPolicy {
        case .unbounded:
            return .unbounded
        case .bufferingNewest(let count):
            return .bufferingNewest(max(1, count))
        case .bufferingOldest(let count):
            return .bufferingOldest(max(1, count))
        }
    }
    
    deinit {
        for continuation in continuations.values {
            continuation.finish()
        }
    }
}
