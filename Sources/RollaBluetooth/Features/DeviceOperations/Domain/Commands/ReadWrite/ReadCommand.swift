import Foundation

public struct ReadCommand: BLEPeripheralCommand {
    public typealias Output = Data?

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

    func execute(using peripheralManager: BLEPeripheralManaging) async throws -> Data? {
        try await peripheralManager.readValue(
            for: deviceID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID,
            timeout: timeout
        )
    }
}
