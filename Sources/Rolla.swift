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

    public func show(from viewController: UIViewController, transition: RollaTransition = .default) {
        DispatchQueue.main.async {
            guard !self.engineManager.isPresenting else {
                self.delegate?.rollaDidFailWithError(self, error: .alreadyPresenting)
                return
            }

            guard viewController.viewIfLoaded?.window != nil else {
                self.delegate?.rollaDidFailWithError(self, error: .invalidPresentationContext)
                return
            }

            self.engineManager.setPresenting(true)

            self.prepareAndShow { [weak self] result in
                guard let self else { return }

                switch result {
                case .success(let vc):
                    vc.setupPresentation(transition: transition)
                    viewController.present(vc, animated: true)

                case .failure(let error):
                    self.cleanup()
                    self.delegate?.rollaDidFailWithError(self, error: error)
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

    /// Start and configure the Flutter engine ahead of time, WITHOUT presenting
    /// any UI.
    ///
    /// This is an optional performance optimization. ``show(from:)``,
    /// ``openScreen(_:from:completion:)``, ``getBandBatteryLevel(completion:)``,
    /// ``getPairedBandInfo(completion:)``, and
    /// ``syncHealthData(includeSamples:completion:)`` all start the engine
    /// themselves on first use, so none of them require a prior warm-up — calling
    /// this simply moves that one-time start-up cost off the first call. A common
    /// pattern is to warm up right after login so the first ``show(from:)``
    /// presents instantly.
    ///
    /// A later ``show(from:)`` reuses the running engine and presents immediately.
    /// Safe to call repeatedly: a repeat call for the same user is a no-op that
    /// preserves the existing session.
    ///
    /// The warmed engine holds memory for the lifetime of the session; release it
    /// with ``destroyEngine()`` once you no longer need the SDK.
    ///
    /// - Parameter completion: Called when the engine is configured and ready,
    ///   or with an error if start-up failed.
    public func warmUpEngine(completion: ((Result<Void, RollaError>) -> Void)? = nil) {
        DispatchQueue.main.async {
            // Warm-up runs headless, so it must not wire up the onClose/onError
            // callbacks. Another Rolla instance may be presenting right now, and
            // those callbacks belong to it; show() wires them when this instance
            // presents. The host-EVENT callbacks are different: they are
            // engine-scoped, not presentation-scoped, so a headless warm-up DOES
            // wire them — events must flow without the SDK UI ever opening.
            self.wireHostEventCallbacks()
            self.engineManager.ensureConfigured(with: self.configuration) { result in
                completion?(result)
            }
        }
    }

    /// Read the connected Rolla band's current battery level.
    ///
    /// This is a **live BLE read from a Rolla band** — the user must have a Rolla
    /// band paired and reachable for a value to come back.
    ///
    /// Works on its own: the engine starts automatically on first use (no UI is
    /// shown) — a prior ``warmUpEngine(completion:)`` or ``show(from:)`` only
    /// removes the one-time start-up latency.
    ///
    /// The result is always a typed ``RollaBatteryResult``. Cases where no live
    /// value is available (no band paired, band not reachable, not a Rolla band,
    /// Bluetooth off or missing permission) resolve as `.success` with a
    /// non-`.available` status, never as a thrown error and never as a stale
    /// value reported as live. `.failure` is reserved for transport problems,
    /// such as the engine failing to start.
    ///
    /// - Parameter completion: Delivers the battery result on the main thread.
    public func getBandBatteryLevel(completion: @escaping (Result<RollaBatteryResult, RollaError>) -> Void) {
        DispatchQueue.main.async {
            // Headless read: don't wire presentation callbacks (see warmUpEngine).
            // Host-event callbacks ARE wired — they're engine-scoped.
            self.wireHostEventCallbacks()
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

    /// Answer "does this account currently have a Rolla band paired?" —
    /// with **zero Bluetooth**: no scan, no connect, no BLE permission; works
    /// with Bluetooth off.
    ///
    /// Works on its own: the engine starts automatically on first use (no UI is
    /// shown) — a prior ``warmUpEngine(completion:)`` or ``show(from:)`` only
    /// removes the one-time start-up latency.
    ///
    /// The result is always a typed ``RollaPairedBandResult``: `.bandPaired` with
    /// the band's MAC address (always present) plus the last cached
    /// battery/firmware/serial — each may be nil if the SDK hasn't read the band
    /// recently (for a live battery value use
    /// ``getBandBatteryLevel(completion:)``), `.noBandPaired` when the user's
    /// profile confirms no band, or `.unknown` when the state could not be
    /// determined (offline with no local record) — never a guess. `.failure` is
    /// reserved for transport problems, such as the engine failing to start.
    ///
    /// The lookup is network-first on purpose — the profile is the
    /// authoritative pairing record, so a band unpaired remotely from another
    /// device (which fires no event by design) is reported correctly; a local
    /// record only answers when the network can't.
    ///
    /// This is a pairing-state query, not a link-state one: live connect/
    /// disconnect transitions are reported by
    /// ``RollaDelegate/rollaDidConnectBand(_:band:)`` /
    /// ``RollaDelegate/rollaDidDisconnectBand(_:band:)`` instead.
    ///
    /// - Parameter completion: Delivers the paired-band result on the main thread.
    public func getPairedBandInfo(completion: @escaping (Result<RollaPairedBandResult, RollaError>) -> Void) {
        DispatchQueue.main.async {
            // Headless query: don't wire presentation callbacks (see warmUpEngine).
            // Host-event callbacks ARE wired — they're engine-scoped.
            self.wireHostEventCallbacks()
            //
            // Capture `self` STRONGLY through the configure round-trip — a
            // `[weak self]` would silently drop `completion` and defeat the
            // always-returns contract. Full reasoning at
            // getBandBatteryLevel(completion:).
            self.engineManager.ensureConfigured(with: self.configuration) { configureResult in
                switch configureResult {
                case .success:
                    self.engineManager.getPairedBandInfo(completion: completion)
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    /// Run a full sync of the user's primary health data source and upload
    /// anything new, WITHOUT showing any UI.
    ///
    /// Works on its own: the engine starts automatically on first use — a prior
    /// ``warmUpEngine(completion:)`` or ``show(from:)`` only removes the
    /// one-time start-up latency.
    ///
    /// The result is always a typed ``RollaSyncResult``. A sync that does nothing
    /// for an expected reason — no band paired, the band not reachable, a sync
    /// already running, a server-side source, or offline — resolves as `.success`
    /// with a `.skipped` outcome, never as a thrown error. `.failure` is reserved
    /// for transport problems, such as the engine failing to start.
    ///
    /// The same result is also delivered to
    /// ``RollaDelegate/rollaDidCompleteHealthDataSync(_:result:)`` once a sync
    /// reaches a terminal outcome.
    ///
    /// On success, ``RollaSyncResult/syncedData`` describes what was uploaded. A
    /// per-stream summary is always included; pass `includeSamples` `true` to
    /// also receive the raw sample arrays (``RollaSyncedHealthData/samples``).
    /// Samples are heavier — a band sync can be thousands of points — so they
    /// default to off.
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
            // Host-event callbacks ARE wired — they're engine-scoped.
            self.wireHostEventCallbacks()
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
                            self.delegate?.rollaDidCompleteHealthDataSync(self, result: syncResult)
                        }
                        completion(result)
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    /// Open a specific SDK screen (``RollaScreen``), presenting the SDK UI
    /// first when needed — an already-presented UI navigates in place.
    ///
    /// The opened screen is the root of the SDK UI: back returns the user to
    /// your app. Every outcome is a typed ``RollaOpenScreenStatus``, delivered
    /// on the main thread; presentation failures are also reported to
    /// ``RollaDelegate/rollaDidFailWithError(_:error:)``.
    ///
    /// Call ``warmUpEngine(completion:)`` before the first `openScreen`. A
    /// warm engine settles everything off screen and shows nothing unless the
    /// screen opened, whereas a cold engine must present first and lands on
    /// Home while it starts up. On a cold start, then, a status like
    /// ``RollaOpenScreenStatus/screenDisabled`` arrives with the SDK already
    /// open on Home; it describes what the user ended up seeing, not a no-op.
    ///
    /// - Parameters:
    ///   - screen: The SDK screen to open.
    ///   - viewController: The view controller to present the SDK UI from.
    ///   - transition: The presentation animation, same as
    ///     ``show(from:transition:)``. Ignored when already on screen.
    ///   - completion: Delivers the ``RollaOpenScreenStatus``.
    public func openScreen(
        _ screen: RollaScreen,
        from viewController: UIViewController,
        transition: RollaTransition = .default,
        completion: @escaping (RollaOpenScreenStatus) -> Void
    ) {
        DispatchQueue.main.async {
            // SDK UI already on screen: navigate in place, keeping whichever
            // instance presented it in charge of the presentation callbacks —
            // this call owns only its completion. show() dispatches the
            // channel `initialize` in the same main-queue turn that sets
            // isPresenting, so the invoke below is sequenced behind it.
            if self.engineManager.isPresenting {
                self.engineManager.openScreen(screen, completion: completion)
                return
            }

            guard viewController.viewIfLoaded?.window != nil else {
                self.delegate?.rollaDidFailWithError(self, error: .invalidPresentationContext)
                completion(.uiUnavailable)
                return
            }

            // Warm engine: navigate first, reveal second. The target screen
            // settles offscreen, so the host's presentation animation uncovers
            // the final screen — Flutter tickers don't advance while hidden,
            // so a post-present navigation would visibly replay its
            // transition — and a request that doesn't resolve as `.opened`
            // (e.g. screenDisabled) never flashes the SDK UI open.
            if self.engineManager.engine != nil {
                self.openScreenOnWarmEngine(screen, from: viewController, transition: transition, completion: completion)
                return
            }

            // Cold engine: present first — the SDK's loader covers engine
            // start-up while the queued navigation settles behind it.
            self.engineManager.setPresenting(true)

            // Capture `self` STRONGLY through the presentation round-trip —
            // same reasoning as getBandBatteryLevel(completion:): a weak
            // capture would silently drop `completion` if the caller holds
            // the Rolla instance only for the duration of this call.
            self.prepareAndShow { result in
                switch result {
                case .success(let vc):
                    vc.setupPresentation(transition: transition)
                    viewController.present(vc, animated: true)
                    // Invoked only now, after configure's `initialize` has
                    // been dispatched AND answered — the Dart side queues the
                    // navigation until its home widget settles.
                    self.engineManager.openScreen(screen, completion: completion)

                case .failure(let error):
                    self.cleanup()
                    // Presentation failures surface through the delegate
                    // exactly as a failed show() would report them; the
                    // completion additionally carries the typed status.
                    self.delegate?.rollaDidFailWithError(self, error: error)
                    if case .invalidPresentationContext = error {
                        completion(.uiUnavailable)
                    } else {
                        completion(.unknownError)
                    }
                }
            }
        }
    }

    /// Warm-engine half of ``openScreen(_:from:transition:completion:)``:
    /// configure, navigate over the channel, and present only when the
    /// navigation resolved as ``RollaOpenScreenStatus/opened`` — any other
    /// status completes without the SDK UI ever appearing.
    private func openScreenOnWarmEngine(
        _ screen: RollaScreen,
        from viewController: UIViewController,
        transition: RollaTransition,
        completion: @escaping (RollaOpenScreenStatus) -> Void
    ) {
        // Reserve the presentation slot up front, exactly like show(), so a
        // concurrent show()/openScreen() can't start a second presentation
        // while this one is in flight. Every non-presenting exit releases it.
        engineManager.setPresenting(true)

        // Engine-scoped host events must flow regardless of presentation —
        // same discipline as the headless APIs (see warmUpEngine).
        wireHostEventCallbacks()

        // `self` is captured strongly through the round-trips — same
        // reasoning as getBandBatteryLevel(completion:).
        engineManager.ensureConfigured(with: configuration) { configureResult in
            switch configureResult {
            case .failure(let error):
                self.engineManager.setPresenting(false)
                self.delegate?.rollaDidFailWithError(self, error: error)
                completion(.unknownError)

            case .success:
                // Sequenced behind configure's `initialize` — the Dart side
                // queues the navigation until its home widget settles.
                self.engineManager.openScreen(screen) { status in
                    guard status == .opened else {
                        self.engineManager.setPresenting(false)
                        completion(status)
                        return
                    }

                    guard let engine = self.engineManager.engine else {
                        self.engineManager.setPresenting(false)
                        self.delegate?.rollaDidFailWithError(self, error: .engineFailedToStart)
                        completion(.unknownError)
                        return
                    }

                    // The async round-trips above can outlive the host's
                    // presentation context — re-validate before presenting,
                    // like show() does at call time. Presenting from a
                    // detached view controller no-ops silently and would
                    // strand isPresenting forever.
                    guard viewController.viewIfLoaded?.window != nil else {
                        self.engineManager.setPresenting(false)
                        self.delegate?.rollaDidFailWithError(self, error: .invalidPresentationContext)
                        completion(.uiUnavailable)
                        return
                    }

                    self.setupCallbacks()
                    let vc = self.makePresentableViewController(engine: engine)
                    vc.setupPresentation(transition: transition)
                    viewController.present(vc, animated: true)
                    completion(.opened)
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
                completion(.success(self.makePresentableViewController(engine: engine)))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    /// Create the SDK's Flutter view controller, wire its dismiss handling to
    /// this instance, and remember it for ``dismiss()``.
    private func makePresentableViewController(engine: FlutterEngine) -> RollaFlutterViewController {
        let vc = RollaFlutterViewController(engine: engine, nibName: nil, bundle: nil)
        vc.onDismiss = { [weak self] reason in
            guard let self else { return }
            let finalReason = self.pendingCloseReason ?? reason
            self.cleanup()
            self.delegate?.rollaDidClose(self, reason: finalReason)
        }
        flutterViewController = vc
        return vc
    }

    /// Wire the host-event closures to THIS instance's delegate for the
    /// engine's lifetime. Unlike the presentation callbacks (wired in
    /// ``setupCallbacks()``, cleared in ``cleanup()`` on dismiss), events keep
    /// flowing after the SDK UI closes — a late `uploaded` activity phase must
    /// still reach the host, and a host that only ever runs headless calls
    /// still gets events. Cleared only by ``destroyEngine()`` or when another
    /// Rolla instance wires itself (last writer wins, matching the
    /// presentation-callback semantics).
    ///
    /// `self` is captured strongly on purpose: hosts often create a Rolla
    /// instance per call and drop it; a weak capture would silently end event
    /// delivery the moment that instance deallocates. The engine manager is a
    /// singleton and `Rolla` holds no strong reference back to it, so this is
    /// a cycle-free lifetime extension until destroy/rewire. The delegate
    /// property itself stays weak — the host controls its listener's lifetime.
    private func wireHostEventCallbacks() {
        engineManager.onActivityCompleted = { activity in
            self.delegate?.rollaDidCompleteActivity(self, activity: activity)
        }

        engineManager.onActivityStarted = { activity in
            self.delegate?.rollaDidStartActivity(self, activity: activity)
        }

        engineManager.onActivityRemoved = { activity in
            self.delegate?.rollaDidRemoveActivity(self, activity: activity)
        }

        engineManager.onUiSyncCompleted = { result in
            self.delegate?.rollaDidCompleteUISync(self, result: result)
        }

        engineManager.onBandPaired = { band in
            self.delegate?.rollaDidPairBand(self, band: band)
        }

        engineManager.onBandUnpaired = { band in
            self.delegate?.rollaDidUnpairBand(self, band: band)
        }

        engineManager.onBandConnected = { band in
            self.delegate?.rollaDidConnectBand(self, band: band)
        }

        engineManager.onBandDisconnected = { band in
            self.delegate?.rollaDidDisconnectBand(self, band: band)
        }

        engineManager.onPrimarySourceChanged = { change in
            self.delegate?.rollaDidChangePrimarySource(self, change: change)
        }

        engineManager.onGoalsChanged = { change in
            self.delegate?.rollaDidChangeGoals(self, change: change)
        }

        engineManager.onProfileUpdated = { update in
            self.delegate?.rollaDidUpdateProfile(self, update: update)
        }
    }

    private func setupCallbacks() {
        wireHostEventCallbacks()

        engineManager.onClose = { [weak self] reason in
            guard let self else { return }
            self.pendingCloseReason = .flutterRequested(reason: reason)
            self.dismiss()
        }

        engineManager.onError = { [weak self] code, message in
            guard let self else { return }
            self.delegate?.rollaDidFailWithError(self, error: .flutterError(code: code, message: message))
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
