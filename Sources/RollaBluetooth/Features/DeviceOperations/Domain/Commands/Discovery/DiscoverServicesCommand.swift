import Foundation

public struct DiscoverServicesCommand: BLEPeripheralCommand {
    public typealias Output = [BLEService]

    private let deviceID: BLEDeviceIdentifier
    private let timeout: TimeInterval

    public init(
        deviceID: BLEDeviceIdentifier,
        timeout: TimeInterval
    ) {
        self.deviceID = deviceID
        self.timeout = timeout
    }

    func execute(using peripheralManager: BLEPeripheralManaging) async throws -> [BLEService] {
        try await peripheralManager.discoverServices(
            for: deviceID,
            serviceUUIDs: nil,
            timeout: timeout
        )
    }
}
