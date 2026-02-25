import Foundation

public struct DiscoverCharacteristicsCommand: BLEPeripheralCommand {
    public typealias Output = [BLECharacteristic]

    private let deviceID: BLEDeviceIdentifier
    private let serviceUUID: NormalizedUUID
    private let timeout: TimeInterval

    public init(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        timeout: TimeInterval
    ) {
        self.deviceID = deviceID
        self.serviceUUID = serviceUUID
        self.timeout = timeout
    }

    func execute(using peripheralManager: BLEPeripheralManaging) async throws -> [BLECharacteristic] {
        try await peripheralManager.discoverCharacteristics(
            for: deviceID,
            serviceUUID: serviceUUID,
            characteristicUUIDs: nil,
            timeout: timeout
        )
    }
}
