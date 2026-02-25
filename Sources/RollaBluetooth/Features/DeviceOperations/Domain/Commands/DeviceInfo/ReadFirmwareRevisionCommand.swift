import Foundation

public struct ReadFirmwareRevisionCommand: BLEPeripheralCommand {
    public typealias Output = String?
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    
    public init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
    }
    
    func execute(using peripheralManager: BLEPeripheralManaging) async throws -> String? {
        let deviceInfoServiceUUID = BLEServiceType.deviceInformation.uuid
        let firmwareRevisionUUID = BLECharacteristicType.firmwareRevision.uuid
        
        let data = try await peripheralManager.readValue(
            for: deviceUUID,
            serviceUUID: deviceInfoServiceUUID,
            characteristicUUID: firmwareRevisionUUID,
            timeout: timeout
        )
        
        return decodeString(from: data)
    }
    
    private func decodeString(from data: Data?) -> String? {
        guard let data, !data.isEmpty else { return nil }
        
        let decoded = String(data: data, encoding: .utf8)
        ?? String(data: data, encoding: .ascii)
        ?? String(data: data, encoding: .utf16LittleEndian)
        ?? String(data: data, encoding: .utf16BigEndian)
        
        return decoded?
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .trimmingCharacters(in: .init(charactersIn: "\0"))
    }
}
