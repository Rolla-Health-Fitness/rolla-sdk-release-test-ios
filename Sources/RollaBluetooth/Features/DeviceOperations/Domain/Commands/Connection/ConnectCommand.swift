import Foundation

public struct ConnectCommand: BLEConnectionCommand {
    public typealias Output = Void

    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval

    public init(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval
    ) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
    }

    func execute(using connectionManager: BLEConnectionManaging) async throws -> Void {
        try await connectionManager.connect(
            to: deviceUUID,
            timeout: timeout
        )
    }
}
