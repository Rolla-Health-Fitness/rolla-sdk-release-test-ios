import Foundation

protocol FirmwareUpdateManaging: Sendable {
    func getEventsStream() async -> AsyncStream<FirmwareUpdateEvent>
    func startFirmwareUpdate(firmwareUrlString: String, deviceUUID: BLEDeviceIdentifier) async
    func abortFirmwareUpdate()
    func isUpdateInProgress() async -> Bool
}
