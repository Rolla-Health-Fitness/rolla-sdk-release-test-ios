import Foundation

public protocol BLECommand: Sendable {
    associatedtype Output: Sendable
}

protocol BLEConnectionCommand: BLECommand {
    func execute(using connectionManager: BLEConnectionManaging) async throws -> Output
}

protocol BLEPeripheralCommand: BLECommand {
    func execute(using peripheralManager: BLEPeripheralManaging) async throws -> Output
}
