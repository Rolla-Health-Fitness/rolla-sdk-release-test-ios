import Foundation

public struct ReadSerialNumberCommand: BLEPeripheralCommand {
    public typealias Output = String?
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    
    public init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
    }
    
    func execute(using peripheralManager: BLEPeripheralManaging) async throws -> String? {
        let deviceInfoServiceUUID = BLEServiceType.deviceInformation.uuid
        let serialNumberUUID = BLECharacteristicType.serialNumber.uuid
        
        let data = try await peripheralManager.readValue(
            for: deviceUUID,
            serviceUUID: deviceInfoServiceUUID,
            characteristicUUID: serialNumberUUID,
            timeout: timeout
        )
        
        return decodeString(from: data)
    }
    
    private func decodeString(from data: Data?) -> String? {
        guard let data = data, !data.isEmpty else {
            return nil
        }
        
        if let utf8String = String(data: data, encoding: .utf8) {
            return utf8String.trimmingCharacters(in: .controlCharacters)
        }
        
        if let utf16String = String(data: data, encoding: .utf16LittleEndian) {
            return utf16String.trimmingCharacters(in: .controlCharacters)
        }
        
        if let utf16String = String(data: data, encoding: .utf16BigEndian) {
            return utf16String.trimmingCharacters(in: .controlCharacters)
        }
        
        return nil
    }
}
