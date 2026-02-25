import Foundation

protocol BLECommandExecuting: Sendable {
    @discardableResult
    func execute<C: BLEConnectionCommand>(_ command: C) async throws -> C.Output

    @discardableResult
    func execute<C: BLEPeripheralCommand>(_ command: C) async throws -> C.Output

    @discardableResult
    func execute<C: BLEConnectionCommand>(_ command: C, retryPolicy: RetryPolicy) async throws -> C.Output

    @discardableResult
    func execute<C: BLEPeripheralCommand>(_ command: C, retryPolicy: RetryPolicy) async throws -> C.Output
}
