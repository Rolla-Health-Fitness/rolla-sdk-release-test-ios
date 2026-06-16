import Foundation
import Flutter

final class AppDependencies {
    let binaryMessenger: FlutterBinaryMessenger
    let bluetoothFlutterApi: RollaBluetoothFlutterApi
    let workoutFlutterApi: RollaBandActivityApi
    let locationFlutterApi: RollaBandGpsApi
    let firmwareProgressFlutterApi: FirmwareProgressAPIProtocol
    let batteryFlutterApi: BandBatteryFlutterApiProtocol
    let chargingStateFlutterApi: BandChargingStateFlutterApiProtocol
    let devicePowerModeFlutterApi: DevicePowerModeFlutterApiProtocol
    let phonePedometerFlutterApi: PhonePedometerFlutterApiProtocol
    let locationDependencies: LocationDependencies

    let logger: RollaLogger

    let rollaBandManager: RollaBandManager
    let bluetoothStateMonitor: RollaBandBluetoothStateMonitor

    lazy var rollaBandHandler: RollaBluetoothHostApiHandler = {
        RollaBluetoothHostApiHandler(
            flutterApi: bluetoothFlutterApi,
            rollaBandManager: rollaBandManager,
            bluetoothStateMonitor: bluetoothStateMonitor
        )
    }()
    
    lazy var rollaBandCommandApiHandler: RollaBandCommandApiHandler = {
        RollaBandCommandApiHandler(
            rollaBandManager: rollaBandManager
        )
    }()
    
    lazy var rollaBandWorkoutApiHandler: RollaBandWorkoutApiHandler = {
        RollaBandWorkoutApiHandler(
            rollaBandManager: rollaBandManager,
            flutterApi: workoutFlutterApi
        )
    }()
    
    lazy var locationHostApiHandler: LocationHostApiHandler = {
        LocationHostApiHandler(
            flutterApi: locationFlutterApi,
            dependencies: locationDependencies
        )
    }()
    
    lazy var firmwareProgressAPIHandler: FirmwareProgressAPIHandler = {
        FirmwareProgressAPIHandler(
            rollaBandManager: rollaBandManager,
            flutterApi: firmwareProgressFlutterApi
        )
    }()
    
    lazy var rollaBandHealthDataHostApiHandler: RollaBandHealthDataHostApiHandler = {
        RollaBandHealthDataHostApiHandler(
            rollaBandManager: rollaBandManager
        )
    }()
    
    // MARK: - Battery, Charging & Workout Status Observation Bridge
    lazy var rollaBandObservationsHandler: RollaBandObservationsHandler = {
        RollaBandObservationsHandler(
            rollaBandManager: rollaBandManager,
            batteryFlutterApi: batteryFlutterApi,
            chargingStateFlutterApi: chargingStateFlutterApi,
            logger: logger
        )
    }()

    lazy var devicePowerModeHandler: DevicePowerModeHandler = {
        MainActor.assumeIsolated {
            DevicePowerModeHandler(flutterApi: devicePowerModeFlutterApi)
        }
    }()
    
    /// Handles iOS permission requests for Bluetooth and Location
    /// This is registered automatically - host apps don't need any AppDelegate code
    lazy var rollaPermissionsHandler: RollaPermissionsHandler = {
        RollaPermissionsHandler()
    }()

    lazy var phonePedometerHandler: PhonePedometerHandler = {
        PhonePedometerHandler(flutterApi: phonePedometerFlutterApi)
    }()

    /// Handles Apple Health (HealthKit) queries.
    ///
    /// Formerly the standalone `apple_health` Flutter plugin, which registered
    /// itself automatically. Now that its sources are vendored into the SDK it
    /// is no longer an auto-registered plugin, so the SDK owns its Pigeon
    /// registration here (see `setupFlutterBindings`). Held as a stored
    /// property so the instance survives for the engine's lifetime.
    lazy var appleHealthPlugin: AppleHealthPlugin = {
        AppleHealthPlugin()
    }()

    /// Handles iOS Live Activities for workout tracking (iOS 16.1+)
    /// This is registered automatically - host apps don't need any AppCoordinator code
    /// Type is Any? to avoid availability checks at compile time (deployment target is iOS 14.0)
    lazy var liveWorkoutBridge: Any? = {
        if #available(iOS 16.1, *) {
            return LiveWorkoutBridge(binaryMessenger: binaryMessenger)
        }
        return nil
    }()
    
    init(binaryMessenger: FlutterBinaryMessenger) {
        self.binaryMessenger = binaryMessenger

        // Enable logging for debug builds
        self.logger = RollaLogger(
            subsystem: "app.rolla.rollaV2",
            minimumLevel: .info,
            enabled: true
        )

        self.rollaBandManager = RollaBandManager(
            bluetoothQueueLabel: "app.rolla.bluetooth",
            logger: logger
        )

        self.bluetoothStateMonitor = RollaBandBluetoothStateMonitor()

        self.bluetoothFlutterApi = RollaBluetoothFlutterApi(
            binaryMessenger: binaryMessenger
        )
        
        self.workoutFlutterApi = RollaBandActivityApi(
            binaryMessenger: binaryMessenger
        )
        
        self.locationFlutterApi = RollaBandGpsApi(
            binaryMessenger: binaryMessenger
        )
        
        self.firmwareProgressFlutterApi = FirmwareProgressAPI(
            binaryMessenger: binaryMessenger
        )
        
        self.batteryFlutterApi = BandBatteryFlutterApi(
            binaryMessenger: binaryMessenger
        )
        
        self.chargingStateFlutterApi = BandChargingStateFlutterApi(
            binaryMessenger: binaryMessenger
        )

        self.devicePowerModeFlutterApi = DevicePowerModeFlutterApi(
            binaryMessenger: binaryMessenger
        )

        self.phonePedometerFlutterApi = PhonePedometerFlutterApi(
            binaryMessenger: binaryMessenger
        )

        self.locationDependencies = LocationDependencies(logger: logger)
    }
    
    func setupFlutterBindings() {
        RollaBluetoothHostApiSetup.setUp(
            binaryMessenger: binaryMessenger,
            api: rollaBandHandler
        )
        
        RollaBandWorkoutHostApiSetup.setUp(
            binaryMessenger: binaryMessenger,
            api: rollaBandWorkoutApiHandler
        )
        
        BandCommandHostAPISetup.setUp(
            binaryMessenger: binaryMessenger,
            api: rollaBandCommandApiHandler
        )
        
        LocationHostApiSetup.setUp(
            binaryMessenger: binaryMessenger,
            api: locationHostApiHandler
        )
        
        FirmwareHostAPISetup.setUp(
            binaryMessenger: binaryMessenger,
            api: firmwareProgressAPIHandler
        )
        
        RollaBandHealthDataHostApiSetup.setUp(
            binaryMessenger: binaryMessenger,
            api: rollaBandHealthDataHostApiHandler
        )

        DevicePowerModeHostApiSetup.setUp(
            binaryMessenger: binaryMessenger,
            api: devicePowerModeHandler
        )
        
        // Permissions handler - automatically handles Bluetooth and Location permissions
        // Host apps don't need to configure anything in their AppDelegate
        RollaPermissionsHostApiSetup.setUp(
            binaryMessenger: binaryMessenger,
            api: rollaPermissionsHandler
        )

        PhonePedometerHostApiSetup.setUp(
            binaryMessenger: binaryMessenger,
            api: phonePedometerHandler
        )

        // Apple Health (HealthKit) handler. Formerly auto-registered by the
        // standalone apple_health plugin; now vendored, so the SDK registers it.
        AppleHealthHostApiSetup.setUp(
            binaryMessenger: binaryMessenger,
            api: appleHealthPlugin
        )

        // Live Activities handler - automatically handles workout Live Activities (iOS 16.1+)
        // Host apps don't need to configure anything - just create the Widget Extension
        _ = liveWorkoutBridge

        _ = rollaBandObservationsHandler
    }
}
