import Foundation

public struct PrepareOtaUpdateCommand: RollaBandRequestCommand {
    public typealias Output = Void
    
    private let deviceUUID: BLEDeviceIdentifier
    private let timeout: TimeInterval
    
    public init(deviceUUID: BLEDeviceIdentifier, timeout: TimeInterval = 10.0) {
        self.deviceUUID = deviceUUID
        self.timeout = timeout
    }
    
    public func execute(
        using commandExecutor: CommandExecutor,
        observer: CharacteristicObserver
    ) async throws -> Void {
        let serviceUUID = BLEServiceType.rollaBand.uuid
        let writeUUID = BLECharacteristicType.rollaBandWriteCommand.uuid
        let command = buildCommand()
        
        try await commandExecutor.execute(
            WriteCommand(
                deviceID: deviceUUID,
                serviceUUID: serviceUUID,
                characteristicUUID: writeUUID,
                data: Data(command),
                writeType: .withoutResponse,
                timeout: timeout
            )
        )
    }
    
    private func buildCommand() -> [UInt8] {
        var bytes = Array(repeating: UInt8(0), count: 16)
        bytes[0] = RollaBandCommand.otaUpdate.rawValue
        bytes.withChecksum()
        return bytes
    }
}
