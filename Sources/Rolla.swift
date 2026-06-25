import UIKit
import Flutter

public final class Rolla {

    public let configuration: RollaConfiguration
    public weak var delegate: RollaDelegate?

    public var isPresenting: Bool {
        engineManager.isPresenting
    }

    private var flutterViewController: RollaFlutterViewController?
    private var pendingCloseReason: RollaCloseReason?
    private var engineManager: RollaEngineManager { RollaEngineManager.shared }

    public init(configuration: RollaConfiguration) {
        self.configuration = configuration
    }

    public func show(from viewController: UIViewController) {
        DispatchQueue.main.async {
            guard !self.engineManager.isPresenting else {
                self.delegate?.rolla(self, didFailWithError: .alreadyPresenting)
                return
            }

            guard viewController.viewIfLoaded?.window != nil else {
                self.delegate?.rolla(self, didFailWithError: .invalidPresentationContext)
                return
            }

            self.engineManager.setPresenting(true)

            self.prepareAndShow { [weak self] result in
                guard let self else { return }

                switch result {
                case .success(let vc):
                    vc.setupSlidePresentation()
                    viewController.present(vc, animated: true)

                case .failure(let error):
                    self.cleanup()
                    self.delegate?.rolla(self, didFailWithError: error)
                }
            }
        }
    }

    /// Clear all persisted session data (tokens, auth metadata) from secure storage.
    ///
    /// Call this when your app logs out the user and you want the SDK to forget
    /// all credentials for that user. This does **not** dismiss the SDK UI or
    /// destroy the Flutter engine — it only purges stored tokens.
    ///
    /// The engine must be initialized (i.e. `show()` must have been called at
    /// least once) for the method channel to be available.
    public func clearSession(completion: ((Result<Void, RollaError>) -> Void)? = nil) {
        DispatchQueue.main.async {
            self.engineManager.clearSession { result in
                completion?(result)
            }
        }
    }

    /// Push fresh tokens to the SDK.
    ///
    /// Call this after receiving a ``RollaDelegate/rollaDidRequestTokenRefresh(_:)``
    /// callback, once your app has obtained new tokens from its own auth backend.
    ///
    /// - Parameters:
    ///   - token: The new access token.
    ///   - refreshToken: An optional new refresh token.
    ///   - expiresIn: Optional time interval in seconds until the new token expires.
    ///   - completion: Called when the SDK has accepted or rejected the token update.
    public func updateToken(
        token: String,
        refreshToken: String? = nil,
        expiresIn: TimeInterval? = nil,
        completion: ((Result<Void, RollaError>) -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            self.engineManager.updateToken(
                token: token,
                refreshToken: refreshToken,
                expiresIn: expiresIn
            ) { result in
                completion?(result)
            }
        }
    }

    /// Warm up the Flutter engine and configure the SDK ahead of time, WITHOUT
    /// presenting any UI.
    ///
    /// Call this when you want to remove the engine start-up cost from the first
    /// ``show(from:)`` (e.g. warm up right after login so opening the SDK is
    /// instant), or to enable headless reads such as
    /// ``getBandBatteryLevel(completion:)`` before the UI has ever been
    /// shown.
    ///
    /// Warming up runs the Flutter engine and initializes the SDK in the
    /// background; a subsequent ``show(from:)`` reuses the already-running engine
    /// and goes straight to presenting. Safe to call more than once — repeat
    /// calls for the same user are a seamless no-op (the session is preserved).
    ///
    /// The warmed engine holds memory for the session; reclaim it with
    /// ``destroyEngine()`` when you no longer need the SDK.
    ///
    /// - Parameter completion: Called when the engine is configured and ready,
    ///   or with an error if start-up failed.
    public func warmUpEngine(completion: ((Result<Void, RollaError>) -> Void)? = nil) {
        DispatchQueue.main.async {
            // Headless: do not wire presentation callbacks (onClose/onError) here
            // so we never hijack the callbacks of a live presentation owned by a
            // different Rolla instance. show() wires them when it actually presents.
            self.engineManager.ensureConfigured(with: self.configuration) { result in
                completion?(result)
            }
        }
    }

    /// Read the connected Rolla band's current battery level.
    ///
    /// This is a **live BLE read from a Rolla band** — the user must have a Rolla
    /// band paired and reachable to get a value. The engine is warmed up
    /// automatically if needed (no UI is shown), so this works even before
    /// ``show(from:)`` has ever been called.
    ///
    /// The result is always a typed ``RollaBatteryResult``: band-absence cases
    /// (no band paired, disconnected, timeout, not a Rolla band, Bluetooth off)
    /// resolve as `.success` with a non-`.available` status — never as a thrown
    /// error and never as a stale value presented as live. `.failure` is reserved
    /// for transport problems (e.g. the engine could not start).
    ///
    /// - Parameter completion: Delivers the battery result on the main thread.
    public func getBandBatteryLevel(completion: @escaping (Result<RollaBatteryResult, RollaError>) -> Void) {
        DispatchQueue.main.async {
            // Headless read: don't wire presentation callbacks (see warmUpEngine).
            //
            // Capture `self` STRONGLY through the configure round-trip. This is a
            // one-shot terminal completion and `engineManager` (a shared singleton)
            // never stores this Rolla instance, so there's no retain cycle — the
            // strong capture self-releases once the closure runs. A `[weak self]`
            // here would silently drop `completion` if the caller holds the Rolla
            // instance only for the duration of this call (as hosts typically do),
            // hanging an `await` forever and defeating the always-returns contract.
            self.engineManager.ensureConfigured(with: self.configuration) { configureResult in
                switch configureResult {
                case .success:
                    self.engineManager.getBandBatteryLevel(completion: completion)
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    /// Run a full sync of the connected source's health data, WITHOUT showing
    /// any UI.
    ///
    /// This connects the user's primary data source (the Rolla band over BLE,
    /// or Apple Health) and uploads anything new — headlessly. The engine is
    /// warmed up automatically if needed, so this works even before
    /// ``show(from:)`` has ever been called.
    ///
    /// The result is always a typed ``RollaSyncResult``: a sync that does
    /// nothing for an expected reason (no band connected, a sync already
    /// running, a server-side source, offline) resolves as `.success` with a
    /// `.skipped` outcome — never as a thrown error. `.failure` is reserved for
    /// transport problems (e.g. the engine could not start).
    ///
    /// The same result is also delivered to
    /// ``RollaDelegate/rollaDidCompleteSync(_:result:)`` when a sync runs to a
    /// terminal outcome (i.e. the channel round-trip succeeded).
    ///
    /// On success, ``RollaSyncResult/syncedData`` carries what the sync
    /// uploaded: a per-stream summary is always included; pass [includeSamples]
    /// `true` to additionally get the raw sample arrays
    /// (``RollaSyncedHealthData/samples``). Samples are heavier (a band sync can
    /// be thousands of points), so the default is `false`.
    ///
    /// - Parameters:
    ///   - includeSamples: When `true`, also return the raw per-stream samples.
    ///     Defaults to `false` (summaries only).
    ///   - completion: Delivers the sync result on the main thread.
    public func syncHealthData(
        includeSamples: Bool = false,
        completion: @escaping (Result<RollaSyncResult, RollaError>) -> Void
    ) {
        DispatchQueue.main.async {
            // Headless sync: don't wire presentation callbacks (see warmUpEngine).
            //
            // Capture `self` STRONGLY through the configure round-trip — same
            // reasoning as getBandBatteryLevel(completion:). A `[weak self]` here
            // would silently drop `completion` (and the delegate callback) if
            // the caller holds the Rolla instance only for the duration of this
            // call, hanging an `await` forever and defeating the
            // always-returns contract.
            self.engineManager.ensureConfigured(with: self.configuration) { configureResult in
                switch configureResult {
                case .success:
                    self.engineManager.syncHealthData(includeSamples: includeSamples) { result in
                        if case .success(let syncResult) = result {
                            self.delegate?.rollaDidCompleteSync(self, result: syncResult)
                        }
                        completion(result)
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    /// Destroy the Flutter engine and free its resources from memory.
    ///
    /// Call this when the host app wants to reclaim the memory used by the
    /// Flutter engine. Unlike ``dismiss()``, which keeps the engine alive for
    /// fast re-presentation, this method fully tears it down.
    ///
    /// The next call to ``show(from:)`` or ``warmUpEngine(completion:)`` will
    /// create a fresh engine automatically.
    public static func destroyEngine() {
        RollaEngineManager.shared.destroy()
    }

    public func dismiss() {
        DispatchQueue.main.async {
            guard self.engineManager.isPresenting, let vc = self.flutterViewController else { return }
            if self.pendingCloseReason == nil {
                self.pendingCloseReason = .programmatic
            }
            vc.dismiss(animated: true)
        }
    }

    private func prepareAndShow(completion: @escaping (Result<RollaFlutterViewController, RollaError>) -> Void) {
        do {
            try engineManager.initialize()
        } catch let error as RollaError {
            completion(.failure(error))
            return
        } catch {
            completion(.failure(.unknown))
            return
        }

        guard let engine = engineManager.engine else {
            completion(.failure(.engineFailedToStart))
            return
        }

        setupCallbacks()

        engineManager.configure(with: configuration, isModal: true, showBackButton: true) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success:
                let vc = RollaFlutterViewController(engine: engine, nibName: nil, bundle: nil)
                vc.onDismiss = { [weak self] reason in
                    guard let self else { return }
                    let finalReason = self.pendingCloseReason ?? reason
                    self.cleanup()
                    self.delegate?.rollaDidClose(self, reason: finalReason)
                }
                self.flutterViewController = vc
                completion(.success(vc))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func setupCallbacks() {
        engineManager.onClose = { [weak self] reason in
            guard let self else { return }
            self.pendingCloseReason = .flutterRequested(reason: reason)
            self.dismiss()
        }

        engineManager.onError = { [weak self] code, message in
            guard let self else { return }
            self.delegate?.rolla(self, didFailWithError: .flutterError(code: code, message: message))
        }

        engineManager.onTokenRefreshed = { [weak self] token, refreshToken, expiresIn in
            guard let self else { return }
            self.delegate?.rollaDidRefreshToken(self, token: token, refreshToken: refreshToken, expiresIn: expiresIn)
        }

        engineManager.onTokenExpired = { [weak self] in
            guard let self else { return }
            self.delegate?.rollaDidRequestTokenRefresh(self)
        }
    }

    private func cleanup() {
        pendingCloseReason = nil
        flutterViewController = nil
        engineManager.setPresenting(false)
        engineManager.onClose = nil
        engineManager.onError = nil
        engineManager.onTokenRefreshed = nil
        engineManager.onTokenExpired = nil
    }
}
