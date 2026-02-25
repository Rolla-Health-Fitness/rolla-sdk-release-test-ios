import Foundation

public struct WriteCommand: BLEPeripheralCommand {
    public typealias Output = Void

    private let deviceID: BLEDeviceIdentifier
    private let serviceUUID: NormalizedUUID
    private let characteristicUUID: NormalizedUUID
    private let data: Data
    private let writeType: BLECharacteristicWriteType
    private let timeout: TimeInterval

    public init(
        deviceID: BLEDeviceIdentifier,
        serviceUUID: NormalizedUUID,
        characteristicUUID: NormalizedUUID,
        data: Data,
        writeType: BLECharacteristicWriteType,
        timeout: TimeInterval
    ) {
        self.deviceID = deviceID
        self.serviceUUID = serviceUUID
        self.characteristicUUID = characteristicUUID
        self.data = data
        self.writeType = writeType
        self.timeout = timeout
    }

    func execute(using peripheralManager: BLEPeripheralManaging) async throws -> Void {
        try await peripheralManager.writeValue(
            data,
            for: deviceID,
            serviceUUID: serviceUUID,
            characteristicUUID: characteristicUUID,
            preferredTypes: [writeType],
            timeout: timeout
        )
    }
}
