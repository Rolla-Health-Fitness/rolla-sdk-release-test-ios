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
            "showGoalsOnHome": true
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

        if let modules = config.modules {
            args["modules"] = modules
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
    
    func destroy() {
        methodChannel?.setMethodCallHandler(nil)
        methodChannel = nil
        appDependencies = nil
        engine?.destroyContext()
        engine = nil
        isReady = false
    }
}
