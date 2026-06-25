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

        if let branding = config.branding {
            args["branding"] = branding.toDictionary()
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
    /// presenting any UI. Used by headless reads (e.g. battery) so a host can
    /// call into the SDK before — or without ever — showing the SDK screen.
    ///
    /// If the engine is already running this re-issues `configure`, which the
    /// Dart side fast-paths as a seamless-resume for the same user (no reset).
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
        // Configure with the SAME chrome show(from:) uses (modal + back button).
        // A headless configure already mounts RollaSdkHome offscreen, and the
        // Dart entry point won't rebuild it on a later show() (seamless-resume
        // early-returns once initialized). Matching show()'s chrome here means
        // the home tree is built once with the correct back button, so a
        // warm-up-then-show() flow presents identical chrome to a cold show().
        configure(with: config, isModal: true, showBackButton: true, completion: completion)
    }

    /// Read the connected Rolla band's battery level over the method channel.
    ///
    /// Resolves to a typed ``RollaBatteryResult`` for every no-band / disconnected
    /// / timeout / Bluetooth-off case (`.success` with a non-`.available` status);
    /// `.failure` is reserved for transport problems (e.g. engine not started).
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

    /// Run a headless sync over the method channel.
    ///
    /// Resolves to a typed ``RollaSyncResult`` for every outcome (success /
    /// skipped / failure are all encoded in the result); `.failure` is reserved
    /// for transport problems (e.g. engine not started).
    ///
    /// [includeSamples] is forwarded to Dart so the result's `syncedData`
    /// additionally carries raw sample arrays when requested.
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
        engine?.destroyContext()
        engine = nil
        isReady = false
    }
}
