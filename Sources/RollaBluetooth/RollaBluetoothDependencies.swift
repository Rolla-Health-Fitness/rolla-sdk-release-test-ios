import Foundation

final class RollaBluetoothDependencies: @unchecked Sendable {

    static var shared = RollaBluetoothDependencies(configuration: .default)

    public static func configure(with configuration: SDKConfiguration) {
        shared = RollaBluetoothDependencies(configuration: configuration)
    }

    private let configuration: SDKConfiguration
    let logger: RollaLogger

    init(configuration: SDKConfiguration) {
        self.configuration = configuration
        self.logger = RollaLogger(
            subsystem: "com.rolla.bluetooth",
            minimumLevel: configuration.isDebugLoggingEnabled ? configuration.logLevel : .critical,
            enabled: configuration.isDebugLoggingEnabled
        )
    }

    private lazy var bluetoothQueue: DispatchQueue = {
        DispatchQueue(label: configuration.bluetoothQueueLabel, qos: .userInitiated)
    }()

    private lazy var deviceRepository: DeviceRepository = {
        DefaultDeviceRepository()
    }()

    lazy var internalCommandProcessor: InternalCommandExecutor = {
        InternalCommandExecutor(
            peripheralManager: peripheralManager,
            connectionManager: connectionManager,
            notificationManager: notificationStreamManager
        )
    }()

    // MARK: - Streams & Request Managers
    private lazy var scanResultsStream: EventStreamSource<ScanResult> = {
        EventStreamSource<ScanResult>(maxContinuations: 50)
    }()

    private lazy var bluetoothStateStream: EventStreamSource<CBBluetoothState> = {
        EventStreamSource<CBBluetoothState>(maxContinuations: 5)
    }()

    private lazy var centralRequestManager: AsyncRequestManager<CentralManagerRequestKey, Void> = {
        AsyncRequestManager<CentralManagerRequestKey, Void>()
    }()

    private lazy var peripheralRequestManager: AsyncRequestManager<PeripheralManagerRequestKey, PeripheralOperationResult> = {
        AsyncRequestManager<PeripheralManagerRequestKey, PeripheralOperationResult>()
    }()

    // MARK: - Device Recognition
    private lazy var deviceRecognitionRegistry: DeviceRecognitionRegistry = {
        var allPlugins = configuration.recognitionPlugins
        allPlugins.append(StandardDeviceRecognitionPlugin())
        return DeviceRecognitionRegistry(plugins: allPlugins, logger: logger)
    }()

    private lazy var deviceRecognizer: DeviceRecognizing = {
        DefaultDeviceRecognizer(registry: deviceRecognitionRegistry)
    }()
    
    // MARK: - Public Components (Exposed via SDK)
    lazy var notificationStreamManager: BLENotificationStreamManaging = {
        BLENotificationStreamManager()
    }()

    lazy var characteristicObserver: CharacteristicObserver = {
        CharacteristicObserver(notificationStreamManager: notificationStreamManager)
    }()

    lazy var connectionLifecycleManager: ConnectionLifecycleManaging = {
        DefaultConnectionLifecycleManager(
            connectUseCase: connectUseCase,
            disconnectUseCase: disconnectUseCase,
            reconnectUseCase: reconnectionUseCase,
            getDeviceStateUseCase: getDeviceStateUseCase,
            getAllDevicesUseCase: getAllDevicesUseCase,
            observeDevicesUseCase: observeDevicesUseCase,
            getBluetoothStateUseCase: getBluetoothStateUseCase,
            observeBluetoothStateUseCase: observeBluetoothStateUseCase,
            logger: logger
        )
    }()

    // MARK: - Private Helpers
    
    private lazy var peripheralEventsHandler: BLEPeripheralEventsHandler = {
        BLEPeripheralEventsHandler(asyncRequestManager: peripheralRequestManager)
    }()
    
    private lazy var peripheralDelegate: BLEPeripheralManagerDelegate = {
        BLEPeripheralManagerDelegateImpl(
            peripheralHandler: peripheralEventsHandler,
            notificationStreamManager: notificationStreamManager
        )
    }()
    
    private lazy var connectionEventsHandler: BLEConnectionEventsHandler = {
        BLEConnectionEventsHandler(
            asyncRequestManager: centralRequestManager,
            deviceRepository: deviceRepository,
            notificationStreamManaging: notificationStreamManager
        )
    }()
    
    private lazy var centralManagerDelegate: CoreBLECentralManagerDelegate = {
        CoreBLECentralManagerDelegateImpl(
            connectionHandler: connectionEventsHandler,
            peripheralDelegate: peripheralDelegate,
            queue: bluetoothQueue,
            scanResultsStream: scanResultsStream,
            bluetoothStateStream: bluetoothStateStream
        )
    }()
    
    // MARK: - Core BLE Managers
    private lazy var coreCentralManager: CoreBLECentralManaging = {
        CoreBLECentralManager(
            queue: bluetoothQueue,
            delegate: centralManagerDelegate,
            scanResultsStream: scanResultsStream,
            bluetoothStateStream: bluetoothStateStream
        )
    }()

    private lazy var corePeripheralManager: CoreBLEPeripheralManaging = {
        CoreBLEPeripheralManager(
            centralManager: coreCentralManager,
            bluetoothQueue: bluetoothQueue
        )
    }()

    lazy var firmwareUpdateManager: FirmwareUpdateManaging = {
        FirmwareUpdateManager(
            centralManager: coreCentralManager,
            deviceRepository: deviceRepository,
            logger: logger
        )
    }()

    lazy var peripheralManager: BLEPeripheralManaging = {
        BLEPeripheralManager(
            coreManager: corePeripheralManager,
            eventsHandler: peripheralEventsHandler,
            asyncRequestManager: peripheralRequestManager
        )
    }()

    private lazy var connectionManager: BLEConnectionManaging = {
        BLEConnectionManager(
            centralManager: coreCentralManager,
            asyncRequestManager: centralRequestManager
        )
    }()

    // MARK: - Session & Strategy Management
    private lazy var scanSessionManager: ScanSessionManager = {
        ScanSessionManager(
            centralManager: coreCentralManager,
            logger: logger
        )
    }()

    lazy var connectionStrategyRegistry: BLEConnectionStrategyRegistry = {
        let defaultStrategy = StandardBLEConnectionStrategy(
            commandExecutor: internalCommandProcessor,
            logger: logger
        )

        return BLEConnectionStrategyRegistry(
            specificStrategies: [:],
            defaultStrategy: defaultStrategy
        )
    }()
    
    // MARK: - Use Cases
    lazy var scanningUseCase: ScanningUseCase = {
        DefaultScanningUseCase(
            scanSessionManager: scanSessionManager,
            deviceRepository: deviceRepository,
            deviceRecognizer: deviceRecognizer,
            logger: logger
        )
    }()

    private lazy var connectUseCase: ConnectUseCase = {
        DefaultConnectUseCase(
            deviceRepository: deviceRepository,
            centralManager: coreCentralManager,
            strategyRegistry: connectionStrategyRegistry,
            logger: logger
        )
    }()

    private lazy var disconnectUseCase: DisconnectUseCase = {
        DefaultDisconnectUseCase(
            deviceRepository: deviceRepository,
            centralManager: coreCentralManager,
            strategyRegistry: connectionStrategyRegistry,
            logger: logger
        )
    }()

    private lazy var reconnectionUseCase: ReconnectionUseCase = {
        DefaultReconnectUseCase(
            config: ReconnectionConfig(
                maxAttempts: 15,
                initialDelay: 2.0,
                maxDelay: 60.0,
                multiplier: 1.5,
                autoReconnectEnabled: false
            ),
            logger: logger
        )
    }()

    lazy var getBluetoothStateUseCase: GetBluetoothStateUseCase = {
        DefaultGetBluetoothStateUseCase(coreCentralManager: coreCentralManager)
    }()

    lazy var observeBluetoothStateUseCase: StartObservingBluetoothStateUseCase = {
        DefaultStartObservingBluetoothStateUseCase(coreCentralManager: coreCentralManager)
    }()

    lazy var getDeviceConnectionStateUseCase: GetDeviceConnectionStateUseCase = {
        DefaultGetDeviceConnectionStateUseCase(
            deviceRepository: deviceRepository
        )
    }()

    // MARK: - Device Query Use Cases
    lazy var getDeviceStateUseCase: GetDeviceStateUseCase = {
        DefaultGetDeviceStateUseCase(
            deviceRepository: deviceRepository,
            logger: logger
        )
    }()

    lazy var getAllDevicesUseCase: GetAllDevicesUseCase = {
        DefaultGetAllDevicesUseCase(
            deviceRepository: deviceRepository,
            logger: logger
        )
    }()

    lazy var observeDevicesUseCase: StartObservingDeviceStatesUseCase = {
        DefaultObserveDevicesUseCase(
            deviceRepository: deviceRepository,
            logger: logger
        )
    }()

    lazy var checkDeviceConnectionUseCase: CheckDeviceConnectionUseCase = {
        DefaultCheckDeviceConnectionUseCase(
            deviceRepository: deviceRepository,
            logger: logger
        )
    }()

    lazy var getDiscoveredDeviceByMacAddressUseCase: GetDiscoveredDeviceByMacAddressUseCase = {
        DefaultGetDiscoveredDeviceByMacAddressUseCase(
            deviceRepository: deviceRepository,
            logger: logger
        )
    }()

    lazy var removeDeviceUseCase: RemoveDeviceUseCase = {
        DefaultRemoveDeviceUseCase(
            deviceRepository: deviceRepository,
            logger: logger
        )
    }()

    // MARK: - Firmware Update Use Cases
    lazy var startFirmwareUpdateUseCase: StartFirmwareUpdateUseCase = {
        DefaultStartFirmwareUpdateUseCase(
            firmwareUpdateManager: firmwareUpdateManager,
            logger: logger
        )
    }()

    lazy var abortFirmwareUpdateUseCase: AbortFirmwareUpdateUseCase = {
        DefaultAbortFirmwareUpdateUseCase(
            firmwareUpdateManager: firmwareUpdateManager,
            logger: logger
        )
    }()

    lazy var observeFirmwareUpdateEventsUseCase: ObserveFirmwareUpdateEventsUseCase = {
        DefaultObserveFirmwareUpdateEventsUseCase(
            firmwareUpdateManager: firmwareUpdateManager
        )
    }()
}

