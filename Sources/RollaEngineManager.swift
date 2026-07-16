import Foundation
import Flutter

#if canImport(FlutterPluginRegistrant)
import FlutterPluginRegistrant
#endif

final class RollaEngineManager {

    static let shared = RollaEngineManager()

    private(set) var engine: FlutterEngine?
    private(set) var isReady: Bool = false
    private(set) var isPresenting: Bool = false

    private var methodChannel: FlutterMethodChannel?
    private let channelName = "rolla_sdk/init"
    private var appDependencies: AppDependencies?

    var onClose: ((String?) -> Void)?
    var onError: ((String, String) -> Void)?
    var onTokenRefreshed: ((String, String?, TimeInterval?) -> Void)?
    var onTokenExpired: (() -> Void)?

    // Host-event closures. Unlike the presentation callbacks above (wired on
    // show, cleared on dismiss), these are wired for the engine's lifetime by
    // Rolla.wireHostEventCallbacks() and cleared only in destroy().
    var onActivityCompleted: ((RollaCompletedActivity) -> Void)?
    var onActivityStarted: ((RollaStartedActivity) -> Void)?
    var onActivityRemoved: ((RollaRemovedActivity) -> Void)?
    var onUiSyncCompleted: ((RollaSyncResult) -> Void)?
    var onBandPaired: ((RollaBandInfo) -> Void)?
    var onBandUnpaired: ((RollaBandInfo) -> Void)?
    var onBandConnected: ((RollaBandInfo) -> Void)?
    var onBandDisconnected: ((RollaBandInfo) -> Void)?
    var onPrimarySourceChanged: ((RollaPrimarySourceChanged) -> Void)?
    var onGoalsChanged: ((RollaGoalsChanged) -> Void)?
    var onProfileUpdated: ((RollaProfileUpdated) -> Void)?

    private init() {}

    func setPresenting(_ value: Bool) {
        isPresenting = value
    }

    func initialize() throws {
        guard engine == nil else { return }

        let flutterEngine = FlutterEngine(name: "rolla_engine")

        guard flutterEngine.run() else {
            throw RollaError.engineFailedToStart
        }

        GeneratedPluginRegistrant.register(with: flutterEngine)
        setupMethodChannel(with: flutterEngine)
        setupPigeonBindings(with: flutterEngine)

        self.engine = flutterEngine
        self.isReady = true
    }

    private func setupPigeonBindings(with engine: FlutterEngine) {
        appDependencies = AppDependencies(binaryMessenger: engine.binaryMessenger)
        appDependencies?.setupFlutterBindings()
    }
    
    private func setupMethodChannel(with engine: FlutterEngine) {
        let channel = FlutterMethodChannel(
            name: channelName,
            binaryMessenger: engine.binaryMessenger
        )
        
        channel.setMethodCallHandler { [weak self] call, result in
            self?.handleMethodCall(call, result: result)
        }
        
        self.methodChannel = channel
    }
    
    private func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let args = call.arguments as? [String: Any]
        
        switch call.method {
        case "close":
            onClose?(args?["reason"] as? String)
            result(nil)
            
        case "error":
            let code = args?["code"] as? String ?? "UNKNOWN"
            let message = args?["message"] as? String ?? "Unknown error"
            onError?(code, message)
            result(nil)

        case "onTokenRefreshed":
            let token = args?["token"] as? String ?? ""
            let refreshToken = args?["refreshToken"] as? String
            let expiresIn = args?["expiresIn"] as? Int
            let expiresInInterval: TimeInterval? = expiresIn.map { TimeInterval($0) }
            onTokenRefreshed?(token, refreshToken, expiresInInterval)
            result(nil)

        case "onTokenExpired":
            onTokenExpired?()
            result(nil)

        case "onActivityCompleted":
            onActivityCompleted?(RollaCompletedActivity.from(call.arguments))
            result(nil)

        case "onActivityStarted":
            onActivityStarted?(RollaStartedActivity.from(call.arguments))
            result(nil)

        case "onActivityRemoved":
            onActivityRemoved?(RollaRemovedActivity.from(call.arguments))
            result(nil)

        case "onUiSyncCompleted":
            onUiSyncCompleted?(RollaSyncResult.from(call.arguments))
            result(nil)

        case "onBandPaired":
            onBandPaired?(RollaBandInfo.from(call.arguments))
            result(nil)

        case "onBandUnpaired":
            onBandUnpaired?(RollaBandInfo.from(call.arguments))
            result(nil)

        case "onBandConnected":
            onBandConnected?(RollaBandInfo.from(call.arguments))
            result(nil)

        case "onBandDisconnected":
            onBandDisconnected?(RollaBandInfo.from(call.arguments))
            result(nil)

        case "onPrimarySourceChanged":
            onPrimarySourceChanged?(RollaPrimarySourceChanged.from(call.arguments))
            result(nil)

        case "onGoalsChanged":
            onGoalsChanged?(RollaGoalsChanged.from(call.arguments))
            result(nil)

        case "onProfileUpdated":
            onProfileUpdated?(RollaProfileUpdated.from(call.arguments))
            result(nil)

        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    func configure(with config: RollaConfiguration, isModal: Bool, showBackButton: Bool, completion: @escaping (Result<Void, RollaError>) -> Void) {
        guard let channel = methodChannel else {
            completion(.failure(.engineFailedToStart))
            return
        }

        var args: [String: Any] = [
            "token": config.token,
            "partnerId": config.partnerId,
            "environment": config.environment,
            "isModal": isModal,
            "showBackButton": showBackButton,
            "hideBottomNavigation": true,
            "showSettingsButton": config.showSettingsButton,
            "removeRollaBandReferences": config.removeRollaBandReferences
        ]

        if let userId = config.userId {
            args["userId"] = userId
        }

        if let refreshToken = config.refreshToken {
            args["refreshToken"] = refreshToken
        }

        if let expiresIn = config.tokenExpiresIn {
            args["tokenExpiresIn"] = Int(expiresIn)
        }

        if !config.disabledModules.isEmpty {
            args["disabledModules"] = config.disabledModules.map { $0.rawValue }
        }

        if !config.disabledDataSources.isEmpty {
            args["disabledDataSources"] = config.disabledDataSources.map { $0.rawValue }
        }

        if let language = config.language {
            args["language"] = language.rawValue
        }

        if let branding = config.branding {
            let brandingDict = branding.toDictionary()
            if !brandingDict.isEmpty {
                args["branding"] = brandingDict
            }
        }

        channel.invokeMethod("initialize", arguments: args) { response in
            DispatchQueue.main.async {
                if let error = response as? FlutterError {
                    completion(.failure(.initializationFailed(error.message ?? "Unknown error")))
                } else {
                    completion(.success(()))
                }
            }
        }
    }
    
    func updateToken(token: String, refreshToken: String?, expiresIn: TimeInterval?, completion: @escaping (Result<Void, RollaError>) -> Void) {
        guard let channel = methodChannel else {
            completion(.failure(.engineFailedToStart))
            return
        }

        var args: [String: Any] = ["token": token]
        if let refreshToken = refreshToken {
            args["refreshToken"] = refreshToken
        }
        if let expiresIn = expiresIn {
            args["expiresIn"] = Int(expiresIn)
        }

        channel.invokeMethod("updateToken", arguments: args) { response in
            DispatchQueue.main.async {
                if let error = response as? FlutterError {
                    completion(.failure(.initializationFailed(error.message ?? "Unknown error")))
                } else {
                    completion(.success(()))
                }
            }
        }
    }

    /// Ensure the Flutter engine is running and the SDK is configured, WITHOUT
    /// presenting any UI. Backs the headless reads (e.g. battery), letting a host
    /// call into the SDK before — or without ever — showing the SDK screen.
    ///
    /// If the engine is already running this re-issues `configure`. For the same
    /// user the Dart side treats that as a seamless resume and does not reset.
    func ensureConfigured(with config: RollaConfiguration, completion: @escaping (Result<Void, RollaError>) -> Void) {
        if engine == nil {
            do {
                try initialize()
            } catch let error as RollaError {
                completion(.failure(error))
                return
            } catch {
                completion(.failure(.unknown))
                return
            }
        }
        // Configure with the same presentation settings show(from:) uses (modal
        // with the back button on). The back button matters most: for a native
        // host it is the user's only built-in way out of the SDK and back to the
        // app. It must be set here too, not just in show(): a headless configure
        // already mounts RollaSdkHome offscreen and the Dart entry point won't
        // rebuild it on a later show() (seamless-resume early-returns once
        // initialized), so the home tree is built once with whatever this first
        // configure passes — a warm-up-then-show() flow with the button off here
        // would present without it.
        configure(with: config, isModal: true, showBackButton: true, completion: completion)
    }

    /// Read the connected Rolla band's battery level over the method channel.
    ///
    /// Resolves to a typed ``RollaBatteryResult``. Every no-band, disconnected,
    /// timed-out, or Bluetooth-off case comes back as `.success` with a
    /// non-`.available` status; `.failure` is reserved for transport problems,
    /// such as the engine not being started.
    func getBandBatteryLevel(completion: @escaping (Result<RollaBatteryResult, RollaError>) -> Void) {
        guard let channel = methodChannel else {
            completion(.failure(.engineFailedToStart))
            return
        }

        channel.invokeMethod("getBandBatteryLevel", arguments: nil) { response in
            DispatchQueue.main.async {
                if let error = response as? FlutterError {
                    completion(.failure(.flutterError(code: error.code, message: error.message ?? "Battery read failed")))
                } else {
                    completion(.success(RollaBatteryResult.from(response)))
                }
            }
        }
    }

    /// Query the account's paired band over the method channel.
    ///
    /// Resolves to a typed ``RollaPairedBandResult`` with zero Bluetooth
    /// involvement. Paired, not-paired, and unknown outcomes are all encoded in
    /// the result; `.failure` is reserved for transport problems, such as the
    /// engine not being started.
    func getPairedBandInfo(completion: @escaping (Result<RollaPairedBandResult, RollaError>) -> Void) {
        guard let channel = methodChannel else {
            completion(.failure(.engineFailedToStart))
            return
        }

        channel.invokeMethod("getPairedBandInfo", arguments: nil) { response in
            DispatchQueue.main.async {
                if let error = response as? FlutterError {
                    completion(.failure(.flutterError(code: error.code, message: error.message ?? "Paired-band query failed")))
                } else {
                    completion(.success(RollaPairedBandResult.from(response)))
                }
            }
        }
    }

    /// Run a headless sync over the method channel.
    ///
    /// Resolves to a typed ``RollaSyncResult``. Success, skipped, and failure
    /// outcomes are all encoded in the result; `.failure` is reserved for
    /// transport problems, such as the engine not being started.
    ///
    /// `includeSamples` is forwarded to Dart so the result's `syncedData` also
    /// carries the raw sample arrays when requested.
    func syncHealthData(
        includeSamples: Bool = false,
        completion: @escaping (Result<RollaSyncResult, RollaError>) -> Void
    ) {
        guard let channel = methodChannel else {
            completion(.failure(.engineFailedToStart))
            return
        }

        channel.invokeMethod("syncHealthData", arguments: ["includeSamples": includeSamples]) { response in
            DispatchQueue.main.async {
                if let error = response as? FlutterError {
                    completion(.failure(.flutterError(code: error.code, message: error.message ?? "Sync failed")))
                } else {
                    completion(.success(RollaSyncResult.from(response)))
                }
            }
        }
    }

    func clearSession(completion: @escaping (Result<Void, RollaError>) -> Void) {
        guard let channel = methodChannel else {
            completion(.failure(.engineFailedToStart))
            return
        }

        channel.invokeMethod("clearSession", arguments: nil) { response in
            DispatchQueue.main.async {
                if let error = response as? FlutterError {
                    completion(.failure(.initializationFailed(error.message ?? "Unknown error")))
                } else {
                    completion(.success(()))
                }
            }
        }
    }

    func destroy() {
        methodChannel?.setMethodCallHandler(nil)
        methodChannel = nil
        appDependencies = nil
        onClose = nil
        onError = nil
        onTokenRefreshed = nil
        onTokenExpired = nil
        onActivityCompleted = nil
        onActivityStarted = nil
        onActivityRemoved = nil
        onUiSyncCompleted = nil
        onBandPaired = nil
        onBandUnpaired = nil
        onBandConnected = nil
        onBandDisconnected = nil
        onPrimarySourceChanged = nil
        onGoalsChanged = nil
        onProfileUpdated = nil
        engine?.destroyContext()
        engine = nil
        isReady = false
    }
}
