import Foundation

protocol ReconnectionUseCase: Sendable {
    var isAutoReconnectEnabled: Bool { get }

    func getReconnectionStrategy(
        deviceId: BLEDeviceIdentifier,
        disconnectionReason: DisconnectionReason
    ) async -> ReconnectionStrategy

    func getNextReconnectionStrategy(
        for deviceId: BLEDeviceIdentifier,
        previousAttempt: Int,
        error: Error
    ) async -> ReconnectionStrategy?

    func markReconnectionSuccessful(for deviceId: BLEDeviceIdentifier) async
    func cancelReconnection(for deviceId: BLEDeviceIdentifier) async
}
