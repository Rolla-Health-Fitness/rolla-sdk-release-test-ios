final class CompletionResolver<T>: @unchecked Sendable {
    let resolve: (T) -> Void
    init(_ resolve: @escaping (T) -> Void) {
        self.resolve = resolve
    }
}
