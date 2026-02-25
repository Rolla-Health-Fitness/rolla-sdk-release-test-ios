import Foundation

final class DefaultGetDeviceConnectionStateUseCase: GetDeviceConnectionStateUseCase {
    private let deviceRepository: DeviceRepository

    init(deviceRepository: DeviceRepository) {
        self.deviceRepository = deviceRepository
    }

    func getDeviceState(deviceId: BLEDeviceIdentifier) async throws -> DeviceState {
        guard let deviceState = await deviceRepository.getDevice(deviceId) else {
            throw BLEPeripheralError.deviceNotFound(deviceId.uuidString)
        }
        return deviceState
    }
}
