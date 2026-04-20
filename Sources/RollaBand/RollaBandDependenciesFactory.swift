import Foundation

final class RollaBandDependenciesFactory {

    static func create(logger: Logging? = nil) -> RollaBandDependencies {
        let logger = logger ?? RollaLogger(
            subsystem: "com.rolla.band",
            minimumLevel: .debug,
            enabled: true
        )
        
        let scanner = BLEScanner()
        let connector = Connector()
        let deviceManager = DeviceManager()
        let commandExecutor = CommandExecutor()
        let characteristicObserver = CharacteristicObserver()
        let bluetoothStateMonitor = BluetoothStateMonitor()
        
        let deviceIdentityManager = DeviceIdentityManager(logger: logger)
        
        let rollaBandCommandExecutor = RollaBandCommandExecutor(
            commandExecutor: commandExecutor,
            observer: characteristicObserver
        )
        
        let dataProcessor = RollaBandDataProcessor(
            commandExecutor: commandExecutor,
            characteristicObserver: characteristicObserver,
            logger: logger
        )
        
        let stepsUseCase = RollaBandGetStepsDataUseCase(
            processor: dataProcessor,
            parser: RollaBandStepsDataParser(logger: logger),
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager
        )
        
        let heartRateUseCase = RollaBandGetHeartRateDataUseCase(
            processor: dataProcessor,
            parser: RollaBandHeartRateDataParser(logger: logger),
            activityParser: RollaBandActivityHeartRateDataParser(logger: logger),
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager
        )
        
        let hrvUseCase = RollaBandGetHRVDataUseCase(
            processor: dataProcessor,
            parser: RollaBandHRVDataParser(logger: logger),
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager
        )
        
        let sleepUseCase = RollaBandGetSleepDataUseCase(
            processor: dataProcessor,
            parser: RollaBandSleepDataParser(logger: logger),
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager
        )

        let firmwareUseCase = DefaultGetDeviceFirmwareUseCase(
            commandExecutor: commandExecutor,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            logger: logger
        )

        let motionUseCase = RollaBandGetMotionDataUseCase(
            processor: dataProcessor,
            legacyParser: RollaBandMotionDataParser(logger: logger),
            secondLevelParser: RollaBandMotionSecondLevelDataParser(logger: logger),
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager
        )

        let rawLogsUseCase = RollaBandGetRawLogsUseCase(
            processor: dataProcessor,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager
        )

        let serialNumberUseCase = DefaultGetDeviceSerialNumberUseCase(
            commandExecutor: commandExecutor,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            logger: logger
        )

        let batteryUseCase = DefaultGetDeviceBatteryUseCase(
            commandExecutor: commandExecutor,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            logger: logger
        )

        let getUserInfoUseCase = DefaultGetUserInfoUseCase(
            commandExecutor: commandExecutor,
            rollaBandCommandExecutor: rollaBandCommandExecutor,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            logger: logger
        )

        let setUserInfoUseCase = DefaultSetUserInfoUseCase(
            commandExecutor: commandExecutor,
            rollaBandCommandExecutor: rollaBandCommandExecutor,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            logger: logger
        )
        
        let workoutManager = RollaBandWorkoutManager(
            commandExecutor: commandExecutor,
            rollaBandCommandExecutor: rollaBandCommandExecutor,
            deviceManager: deviceManager,
            deviceIdentityManager: deviceIdentityManager,
            logger: logger
        )
        
        let workoutSessionUseCase = RollaBandWorkoutSessionUseCase(
            rollaBandWorkoutManager: workoutManager,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            logger: logger
        )

        let activityRestoreUseCase = DefaultActivityRestoreUseCase(
            workoutManager: workoutManager
        )
        
        // Observation managers
        let heartRateObservationManager = ObservationSessionsManager<HeartRateData>(
            characteristicObserver: characteristicObserver
        )

        let rscObservationManager = ObservationSessionsManager<RunningSpeedCadenceData>(
            characteristicObserver: characteristicObserver
        )

        let batteryObservationManager = ObservationSessionsManager<BatteryLevelData>(
            characteristicObserver: characteristicObserver
        )

        let chargingStateObservationManager = ObservationSessionsManager<ChargingStateData>(
            characteristicObserver: characteristicObserver
        )

        // Observation use cases
        let heartRateObservationUseCase = RollaBandHeartRateObservationUseCase(
            observationManager: heartRateObservationManager,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            heartRateParser: RollaBandHeartRateInActivityDataParser(),
            commandExecutor: commandExecutor,
            logger: logger
        )

        let rscObservationUseCase = DefaultRunningSpeedCadenceObservationUseCase(
            observationManager: rscObservationManager,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            rscParser: DefaultRSCDataParser(),
            commandExecutor: commandExecutor,
            logger: logger
        )

        let batteryParser = RollaBandBatteryNotificationParser(logger: logger)
        let chargingStateParser = RollaBandChargingStateParser(logger: logger)

        let batteryObservationUseCase = RollaBandBatteryObservationUseCase(
            deviceIdentityManager: deviceIdentityManager,
            observationManager: batteryObservationManager,
            batteryParser: batteryParser
        )

        let chargingStateObservationUseCase = RollaBandChargingStateObservationUseCase(
            deviceIdentityManager: deviceIdentityManager,
            observationManager: chargingStateObservationManager,
            chargingStateParser: chargingStateParser
        )

        let firmwareUpdater = FirmwareUpdater()

        let updateFirmwareUseCase = UpdateRollaBandFirmwareUseCase(
            commandExecutor: commandExecutor,
            rollaBandCommandExecutor: rollaBandCommandExecutor,
            firmwareUpdater: firmwareUpdater,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            logger: logger
        )

        let factoryResetUseCase = RollaBandFactoryResetUseCase(
            commandExecutor: commandExecutor,
            rollaBandCommandExecutor: rollaBandCommandExecutor,
            deviceIdentityManager: deviceIdentityManager,
            deviceManager: deviceManager,
            logger: logger
        )

        let unpairDeviceUseCase = DefaultUnpairRollaBandUseCase(
            deviceIdentityManager: deviceIdentityManager,
            connector: connector,
            deviceManager: deviceManager,
            logger: logger
        )

        // Register RollaBand connection strategy
        let rollaBandConnectionStrategy = RollaBandConnectionStrategy(
            commandExecutor: commandExecutor,
            rollaBandCommandExecutor: rollaBandCommandExecutor,
            deviceIdentityManager: deviceIdentityManager,
            logger: logger
        )

        connector.registerStrategy(
            rollaBandConnectionStrategy,
            for: .rolla,
            deviceType: .band
        )

        let connectToRollaBandUseCase = DefaultConnectRollaBandUseCase(
            deviceIdentityManager: deviceIdentityManager,
            rollaBandCommandExecutor: rollaBandCommandExecutor,
            deviceManager: deviceManager,
            connector: connector,
            scanner: scanner,
            workoutManager: workoutManager,
            logger: logger
        )

        let disconnectFromRollaBandUseCase = DefaultDisconnectRollaBandUseCase(
            deviceIdentityManager: deviceIdentityManager,
            connector: connector,
            logger: logger
        )

        let getPairedDeviceConnectionStateUseCase = DefaultGetPairedDeviceConnectionStateUseCase(
            deviceIdentityManager: deviceIdentityManager,
            connector: connector,
            logger: logger
        )

        let observeAllDeviceStateChangesUseCase = DefaultObserveAllDeviceStateChangesUseCase(
            connector: connector
        )

        let startScanningForRollaBandsUseCase = DefaultStartScanningForRollaBandsUseCase(
            scanner: scanner
        )

        let stopScanningForRollaBandsUseCase = DefaultStopScanningForRollaBandsUseCase(
            scanner: scanner
        )

        let observeRollaBandDevicesUseCase = DefaultObserveRollaBandDevicesUseCase(
            deviceManager: deviceManager
        )

        let getCurrentBluetoothStateUseCase = DefaultGetCurrentBluetoothStateUseCase(
            bluetoothStateMonitor: bluetoothStateMonitor
        )

        let observeBluetoothStateChangesUseCase = DefaultObserveBluetoothStateChangesUseCase(
            bluetoothStateMonitor: bluetoothStateMonitor
        )

        let connectionObservationHandler = RollaBandConnectionObservationHandler(
            batteryObservationUseCase: batteryObservationUseCase,
            chargingStateObservationUseCase: chargingStateObservationUseCase,
            observeAllDeviceStateChangesUseCase: observeAllDeviceStateChangesUseCase,
            logger: logger
        )

        return RollaBandDependencies(
            getStepsDataUseCase: stepsUseCase,
            getHeartRateDataUseCase: heartRateUseCase,
            getHRVDataUseCase: hrvUseCase,
            getSleepDataUseCase: sleepUseCase,
            getMotionDataUseCase: motionUseCase,
            getRawLogsUseCase: rawLogsUseCase,
            getDeviceFirmwareUseCase: firmwareUseCase,
            getDeviceSerialNumberUseCase: serialNumberUseCase,
            getDeviceBatteryUseCase: batteryUseCase,
            getUserInfoUseCase: getUserInfoUseCase,
            setUserInfoUseCase: setUserInfoUseCase,
            workoutManager: workoutManager,
            workoutSessionUseCase: workoutSessionUseCase,
            activityRestoreUseCase: activityRestoreUseCase,
            heartRateObservationUseCase: heartRateObservationUseCase,
            rscObservationUseCase: rscObservationUseCase,
            batteryObservationUseCase: batteryObservationUseCase,
            chargingStateObservationUseCase: chargingStateObservationUseCase,
            updateFirmwareUseCase: updateFirmwareUseCase,
            factoryResetUseCase: factoryResetUseCase,
            unpairDeviceUseCase: unpairDeviceUseCase,
            connectToRollaBandUseCase: connectToRollaBandUseCase,
            disconnectFromRollaBandUseCase: disconnectFromRollaBandUseCase,
            getPairedDeviceConnectionStateUseCase: getPairedDeviceConnectionStateUseCase,
            observeAllDeviceStateChangesUseCase: observeAllDeviceStateChangesUseCase,
            startScanningForRollaBandsUseCase: startScanningForRollaBandsUseCase,
            stopScanningForRollaBandsUseCase: stopScanningForRollaBandsUseCase,
            observeRollaBandDevicesUseCase: observeRollaBandDevicesUseCase,
            getCurrentBluetoothStateUseCase: getCurrentBluetoothStateUseCase,
            observeBluetoothStateChangesUseCase: observeBluetoothStateChangesUseCase,
            connectionObservationHandler: connectionObservationHandler,
            deviceIdentityManager: deviceIdentityManager
        )
    }
}

