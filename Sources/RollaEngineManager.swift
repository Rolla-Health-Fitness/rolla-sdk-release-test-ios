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

    /// The freshest token pair this engine is known to hold, seeded by
    /// successful `updateToken` pushes and by `onTokenRefreshed` deliveries
    /// from the SDK's own internal rotation. Refresh tokens are single-use, so
    /// once the SDK rotates, the pair frozen inside the host's
    /// `RollaConfiguration` is consumed — re-sending it on every `configure`
    /// would destroy the live refresh token and 401 the session. When present,
    /// `configure` sends this register instead of the frozen configuration
    /// values.
    private struct LatestKnownTokens {
        let token: String
        let refreshToken: String?
        let expiresIn: TimeInterval?
        let seededAt: Date
    }

    private var methodChannel: FlutterMethodChannel?
    private let channelName = "rolla_sdk/init"
    private var appDependencies: AppDependencies?
    private var latestKnownTokens: LatestKnownTokens?

    // The configuration token the current credential lineage started from.
    // A configure carrying a DIFFERENT token means the host obtained fresh
    // credentials (new login, new configuration) — the register descends from
    // the previous lineage and must not shadow them.
    private var sessionAnchorToken: String?

    // Count of in-flight configure round-trips that CHANGED the anchor.
    // While one is running, the Dart side may still be tearing down the
    // previous session, and a late onTokenRefreshed from that session must
    // not seed the register under the new anchor — it would be replayed to
    // the new user on the next configure. Seeds are discarded while > 0.
    private var anchorChangingConfigures = 0

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
            // Never seed while an anchor-changing configure is in flight:
            // this event may belong to the session being replaced (its
            // refresh raced the switch) and must not be replayed to the new
            // user.
            if !token.isEmpty && anchorChangingConfigures == 0 {
                latestKnownTokens = LatestKnownTokens(
                    token: token,
                    refreshToken: refreshToken,
                    expiresIn: expiresInInterval,
                    seededAt: Date()
                )
            }
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

        // Prefer the latest known pair over the frozen configuration values,
        // but only while the configuration still carries the token the
        // register descends from. A different token means new host
        // credentials — send those and drop the outdated register.
        let anchorChanged = config.token != sessionAnchorToken
        let latest: LatestKnownTokens? = anchorChanged ? nil : latestKnownTokens
        if anchorChanged {
            latestKnownTokens = nil
            sessionAnchorToken = config.token
            anchorChangingConfigures += 1
        }

        var args: [String: Any] = [
            "token": latest?.token ?? config.token,
            "partnerId": config.partnerId,
            "environment": config.environment,
            "isModal": isModal,
            "showBackButton": showBackButton,
            "hideBottomNavigation": true,
            "showOptionsButton": config.showOptionsButton,
            "showGoalsSection": config.showGoalsSection
        ]

        if let userId = config.userId {
            args["userId"] = userId
        }

        if let latest = latest {
            if let refreshToken = latest.refreshToken {
                args["refreshToken"] = refreshToken
            }
            // The register's TTL was captured when the pair was seeded; send
            // what is left of it now so the Dart side doesn't restart the
            // full window on every presentation. Capped at the original TTL —
            // a wall clock moved backwards must not inflate it.
            if let expiresIn = latest.expiresIn {
                let remaining = min(Int(expiresIn - Date().timeIntervalSince(latest.seededAt)), Int(expiresIn))
                if remaining > 0 {
                    args["tokenExpiresIn"] = remaining
                }
            }
        } else {
            if let refreshToken = config.refreshToken {
                args["refreshToken"] = refreshToken
            }

            if let expiresIn = config.tokenExpiresIn {
                args["tokenExpiresIn"] = Int(expiresIn)
            }
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

        channel.invokeMethod("initialize", arguments: args) { [weak self] response in
            // Settle the anchor change synchronously (the result callback
            // arrives on the platform thread) — floored at zero, since
            // destroy() resets the counter and a late callback from a
            // destroyed engine must not push it negative.
            if anchorChanged, let self = self {
                self.anchorChangingConfigures = max(self.anchorChangingConfigures - 1, 0)
            }
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

        // If the anchor moves while this round-trip is in flight (the host
        // switched sessions), the response was evaluated by the OLD session —
        // seeding it under the new anchor would replay these tokens to the
        // wrong session on the next configure.
        let anchorAtInvoke = sessionAnchorToken

        channel.invokeMethod("updateToken", arguments: args) { [weak self] response in
            // Seed synchronously (the result callback arrives on the platform
            // thread, and channel messages are processed in order) — deferring
            // the seed a runloop tick could let it overwrite a NEWER pair a
            // just-processed onTokenRefreshed event seeded in between.
            if !(response is FlutterError), let self = self {
                // Remember the pushed pair so a later configure re-sends it
                // instead of the frozen configuration values — but only when
                // the SDK actually applied it (it ignores tokens older than
                // the pair it already holds).
                let applied = (response as? [String: Any])?["applied"] as? Bool ?? true
                if applied && self.sessionAnchorToken == anchorAtInvoke {
                    self.latestKnownTokens = LatestKnownTokens(
                        token: token,
                        refreshToken: refreshToken,
                        expiresIn: expiresIn,
                        seededAt: Date()
                    )
                }
            }
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

    /// Ask the SDK UI to navigate to a screen over the method channel.
    ///
    /// Resolves to a typed ``RollaOpenScreenStatus`` — every outcome,
    /// including a channel error or an unparseable response, is encoded in
    /// the status (as ``RollaOpenScreenStatus/unknownError``); nothing throws.
    ///
    /// Must only be invoked after `initialize` has been dispatched on the
    /// channel: the Dart side queues the navigation until its home widget
    /// settles, but only once the SDK entry point exists.
    func openScreen(_ screen: RollaScreen, completion: @escaping (RollaOpenScreenStatus) -> Void) {
        guard let channel = methodChannel else {
            completion(.unknownError)
            return
        }

        channel.invokeMethod("openScreen", arguments: ["screen": screen.rawValue]) { response in
            // `from` owns every mapping, error responses included.
            DispatchQueue.main.async {
                completion(RollaOpenScreenStatus.from(response))
            }
        }
    }

    func clearSession(completion: @escaping (Result<Void, RollaError>) -> Void) {
        guard let channel = methodChannel else {
            completion(.failure(.engineFailedToStart))
            return
        }

        channel.invokeMethod("clearSession", arguments: nil) { [weak self] response in
            DispatchQueue.main.async {
                if let error = response as? FlutterError {
                    completion(.failure(.initializationFailed(error.message ?? "Unknown error")))
                } else {
                    // The session's credentials are gone — forget the register
                    // so the next configure sends its configuration's own
                    // tokens.
                    self?.latestKnownTokens = nil
                    self?.sessionAnchorToken = nil
                    completion(.success(()))
                }
            }
        }
    }

    func destroy() {
        methodChannel?.setMethodCallHandler(nil)
        methodChannel = nil
        appDependencies = nil
        latestKnownTokens = nil
        sessionAnchorToken = nil
        anchorChangingConfigures = 0
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
