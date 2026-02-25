import Foundation

public final class DeviceManager: Sendable {
    private let getDeviceStateUseCase: GetDeviceStateUseCase
    private let getAllDevicesUseCase: GetAllDevicesUseCase
    private let observeDevicesUseCase: StartObservingDeviceStatesUseCase
    private let checkDeviceConnectionUseCase: CheckDeviceConnectionUseCase
    private let removeDeviceUseCase: RemoveDeviceUseCase
    private let getDiscoveredDeviceByMacAddressUseCase: GetDiscoveredDeviceByMacAddressUseCase

    init(
        getDeviceStateUseCase: GetDeviceStateUseCase,
        getAllDevicesUseCase: GetAllDevicesUseCase,
        observeDevicesUseCase: StartObservingDeviceStatesUseCase,
        checkDeviceConnectionUseCase: CheckDeviceConnectionUseCase,
        removeDeviceUseCase: RemoveDeviceUseCase,
        getDiscoveredDeviceByMacAddressUseCase: GetDiscoveredDeviceByMacAddressUseCase
    ) {
        self.getDeviceStateUseCase = getDeviceStateUseCase
        self.getAllDevicesUseCase = getAllDevicesUseCase
        self.observeDevicesUseCase = observeDevicesUseCase
        self.checkDeviceConnectionUseCase = checkDeviceConnectionUseCase
        self.removeDeviceUseCase = removeDeviceUseCase
        self.getDiscoveredDeviceByMacAddressUseCase = getDiscoveredDeviceByMacAddressUseCase
    }

    public convenience init() {
        let deps = RollaBluetoothDependencies.shared
        self.init(
            getDeviceStateUseCase: deps.getDeviceStateUseCase,
            getAllDevicesUseCase: deps.getAllDevicesUseCase,
            observeDevicesUseCase: deps.observeDevicesUseCase,
            checkDeviceConnectionUseCase: deps.checkDeviceConnectionUseCase,
            removeDeviceUseCase: deps.removeDeviceUseCase,
            getDiscoveredDeviceByMacAddressUseCase: deps.getDiscoveredDeviceByMacAddressUseCase
        )
    }

    public func getAllDevices() async -> [DeviceState] {
        return await getAllDevicesUseCase.execute()
    }

    public func getDevice(deviceUUID: BLEDeviceIdentifier) async -> DeviceState? {
        return await getDeviceStateUseCase.execute(deviceUUID: deviceUUID)
    }

    public func getDeviceName(deviceId: BLEDeviceIdentifier) async -> String? {
        guard let deviceState = await getDeviceStateUseCase.execute(deviceUUID: deviceId) else {
            return nil
        }
        return deviceState.name
    }

    public func isDeviceConnected(deviceUUID: BLEDeviceIdentifier) async -> Bool {
        return await checkDeviceConnectionUseCase.execute(deviceUUID: deviceUUID)
    }
    
    public func allDevicesStream() async -> AsyncStream<[DeviceState]> {
        return await observeDevicesUseCase.execute()
    }

    public func removeDevice(deviceUUID: BLEDeviceIdentifier) async {
        await removeDeviceUseCase.execute(deviceUUID: deviceUUID)
    }

    public func getDiscoveredDevice(byMacAddress macAddress: String) async -> DiscoveredDevice? {
        return await getDiscoveredDeviceByMacAddressUseCase.execute(macAddress: macAddress)
    }
}
