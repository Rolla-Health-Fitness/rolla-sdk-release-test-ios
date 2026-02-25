import Foundation

public struct ReadBatteryLevelCommand: BLEPeripheralCommand {
    public typealias Output = Int

    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval

    public init(
        deviceUUID: BLEDeviceIdentifier,
        timeout: TimeInterval
    ) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
    }

    func execute(using peripheralManager: BLEPeripheralManaging) async throws -> Int {
        let batteryServiceUUID = BLEServiceType.battery.uuid
        let batteryLevelCharacteristicUUID = BLECharacteristicType.batteryLevel.uuid

        let data = try await peripheralManager.readValue(
            for: deviceUUID,
            serviceUUID: batteryServiceUUID,
            characteristicUUID: batteryLevelCharacteristicUUID,
            timeout: timeout
        )

        guard let data, !data.isEmpty else {
            throw BLEPeripheralError.noData
        }

        let batteryLevel = Int(data[0])

        guard batteryLevel >= 0 && batteryLevel <= 100 else {
            throw BLEPeripheralError.invalidData(deviceUUID.uuidString, "Invalid battery level: \(batteryLevel)")
        }

        return batteryLevel
    }
}
