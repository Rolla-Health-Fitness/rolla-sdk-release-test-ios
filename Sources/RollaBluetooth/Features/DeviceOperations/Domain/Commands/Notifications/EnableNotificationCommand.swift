import Foundation

public struct EnableNotificationCommand: BLEPeripheralCommand {
    public typealias Output = Void

    private let deviceID: BLEDeviceIdentifier
    private let serviceUUID: NormalizedUUID
    private let characteristicUUID: NormalizedUUID
    private let timeout: TimeInterval

    public init(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        timeout: TimeInterval
    ) {
        self.deviceID = deviceID
        self.serviceUUID = serviceUUID
        self.characteristicUUID = characteristicUUID
        self.timeout = timeout
    }

    func execute(using peripheralManager: BLEPeripheralManaging) async throws -> Void {
        try await peripheralManager.enableNotifications(
            enabled: true,
            for: deviceID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID,
            timeout: timeout
        )
    }
}
