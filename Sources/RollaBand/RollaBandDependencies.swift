import Foundation

final class RollaBandDependencies: @unchecked Sendable {

    private static var _shared: RollaBandDependencies?

    public static var shared: RollaBandDependencies {
        guard let instance = _shared else {
            fatalError("RollaBandDependencies.shared accessed before configuration. Create a RollaBandManager instance first.")
        }
        return instance
    }

    static func configure(with dependencies: RollaBandDependencies) {
        _shared = dependencies
    }
    // MARK: - Health Data Use Cases
    public let getStepsDataUseCase: GetStepsDataUseCase
    public let getHeartRateDataUseCase: GetHeartRateDataUseCase
    public let getHRVDataUseCase: GetHRVDataUseCase
    public let getSleepDataUseCase: GetSleepDataUseCase
    public let getMotionDataUseCase: GetMotionDataUseCase
    public let getRawLogsUseCase: RollaBandGetRawLogsUseCase

    // MARK: - Device Info Use Cases
    public let getDeviceFirmwareUseCase: GetDeviceFirmwareUseCase
    public let getDeviceSerialNumberUseCase: GetDeviceSerialNumberUseCase
    public let getDeviceBatteryUseCase: GetDeviceBatteryUseCase
    public let getUserInfoUseCase: GetUserInfoUseCase
    public let setUserInfoUseCase: SetUserInfoUseCase

    // MARK: - Workout & Observation Use Cases
    public let workoutManager: RollaBandWorkoutManaging
    public let workoutSessionUseCase: WorkoutSessionUseCase
    public let activityRestoreUseCase: ActivityRestoreUseCase
    public let heartRateObservationUseCase: HeartRateObservationUseCase
    public let activityEndObservationUseCase: ActivityEndObservationUseCase
    public let rscObservationUseCase: RunningSpeedCadenceObservationUseCase
    public let batteryObservationUseCase: BatteryObservationUseCase
    public let chargingStateObservationUseCase: ChargingStateObservationUseCase

    // MARK: - Firmware Update Use Cases
    public let updateFirmwareUseCase: UpdateRollaBandFirmwareUseCase

    // MARK: - Connection Use Cases (from RollaBluetooth)
    public let factoryResetUseCase: FactoryResetUseCase
    public let unpairDeviceUseCase: UnpairRollaBandUseCase
    public let connectToRollaBandUseCase: ConnectRollaBandUseCase
    public let disconnectFromRollaBandUseCase: DisconnectRollaBandUseCase
    public let getPairedDeviceConnectionStateUseCase: GetPairedDeviceConnectionStateUseCase
    public let observeAllDeviceStateChangesUseCase: ObserveAllDeviceStateChangesUseCase
    public let startScanningForRollaBandsUseCase: StartScanningForRollaBandsUseCase
    public let stopScanningForRollaBandsUseCase: StopScanningForRollaBandsUseCase
    public let observeRollaBandDevicesUseCase: ObserveRollaBandDevicesUseCase
    public let getCurrentBluetoothStateUseCase: GetCurrentBluetoothStateUseCase
    public let observeBluetoothStateChangesUseCase: ObserveBluetoothStateChangesUseCase

    // MARK: - Internal Handlers
    let connectionObservationHandler: RollaBandConnectionObservationHandler
    let deviceIdentityManager: DeviceIdentityManaging

    init(
        getStepsDataUseCase: GetStepsDataUseCase,
        getHeartRateDataUseCase: GetHeartRateDataUseCase,
        getHRVDataUseCase: GetHRVDataUseCase,
        getSleepDataUseCase: GetSleepDataUseCase,
        getMotionDataUseCase: GetMotionDataUseCase,
        getRawLogsUseCase: RollaBandGetRawLogsUseCase,
        getDeviceFirmwareUseCase: GetDeviceFirmwareUseCase,
        getDeviceSerialNumberUseCase: GetDeviceSerialNumberUseCase,
        getDeviceBatteryUseCase: GetDeviceBatteryUseCase,
        getUserInfoUseCase: GetUserInfoUseCase,
        setUserInfoUseCase: SetUserInfoUseCase,
        workoutManager: RollaBandWorkoutManaging,
        workoutSessionUseCase: WorkoutSessionUseCase,
        activityRestoreUseCase: ActivityRestoreUseCase,
        heartRateObservationUseCase: HeartRateObservationUseCase,
        activityEndObservationUseCase: ActivityEndObservationUseCase,
        rscObservationUseCase: RunningSpeedCadenceObservationUseCase,
        batteryObservationUseCase: BatteryObservationUseCase,
        chargingStateObservationUseCase: ChargingStateObservationUseCase,
        updateFirmwareUseCase: UpdateRollaBandFirmwareUseCase,
        factoryResetUseCase: FactoryResetUseCase,
        unpairDeviceUseCase: UnpairRollaBandUseCase,
        connectToRollaBandUseCase: ConnectRollaBandUseCase,
        disconnectFromRollaBandUseCase: DisconnectRollaBandUseCase,
        getPairedDeviceConnectionStateUseCase: GetPairedDeviceConnectionStateUseCase,
        observeAllDeviceStateChangesUseCase: ObserveAllDeviceStateChangesUseCase,
        startScanningForRollaBandsUseCase: StartScanningForRollaBandsUseCase,
        stopScanningForRollaBandsUseCase: StopScanningForRollaBandsUseCase,
        observeRollaBandDevicesUseCase: ObserveRollaBandDevicesUseCase,
        getCurrentBluetoothStateUseCase: GetCurrentBluetoothStateUseCase,
        observeBluetoothStateChangesUseCase: ObserveBluetoothStateChangesUseCase,
        connectionObservationHandler: RollaBandConnectionObservationHandler,
        deviceIdentityManager: DeviceIdentityManaging
    ) {
        self.getStepsDataUseCase = getStepsDataUseCase
        self.getHeartRateDataUseCase = getHeartRateDataUseCase
        self.getHRVDataUseCase = getHRVDataUseCase
        self.getSleepDataUseCase = getSleepDataUseCase
        self.getMotionDataUseCase = getMotionDataUseCase
        self.getRawLogsUseCase = getRawLogsUseCase
        self.getDeviceFirmwareUseCase = getDeviceFirmwareUseCase
        self.getDeviceSerialNumberUseCase = getDeviceSerialNumberUseCase
        self.getDeviceBatteryUseCase = getDeviceBatteryUseCase
        self.getUserInfoUseCase = getUserInfoUseCase
        self.setUserInfoUseCase = setUserInfoUseCase
        self.workoutManager = workoutManager
        self.workoutSessionUseCase = workoutSessionUseCase
        self.activityRestoreUseCase = activityRestoreUseCase
        self.heartRateObservationUseCase = heartRateObservationUseCase
        self.activityEndObservationUseCase = activityEndObservationUseCase
        self.rscObservationUseCase = rscObservationUseCase
        self.batteryObservationUseCase = batteryObservationUseCase
        self.chargingStateObservationUseCase = chargingStateObservationUseCase
        self.updateFirmwareUseCase = updateFirmwareUseCase
        self.factoryResetUseCase = factoryResetUseCase
        self.unpairDeviceUseCase = unpairDeviceUseCase
        self.connectToRollaBandUseCase = connectToRollaBandUseCase
        self.disconnectFromRollaBandUseCase = disconnectFromRollaBandUseCase
        self.getPairedDeviceConnectionStateUseCase = getPairedDeviceConnectionStateUseCase
        self.observeAllDeviceStateChangesUseCase = observeAllDeviceStateChangesUseCase
        self.startScanningForRollaBandsUseCase = startScanningForRollaBandsUseCase
        self.stopScanningForRollaBandsUseCase = stopScanningForRollaBandsUseCase
        self.observeRollaBandDevicesUseCase = observeRollaBandDevicesUseCase
        self.getCurrentBluetoothStateUseCase = getCurrentBluetoothStateUseCase
        self.observeBluetoothStateChangesUseCase = observeBluetoothStateChangesUseCase
        self.connectionObservationHandler = connectionObservationHandler
        self.deviceIdentityManager = deviceIdentityManager
    }
}

