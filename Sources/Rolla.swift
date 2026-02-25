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
    }

    private func cleanup() {
        pendingCloseReason = nil
        flutterViewController = nil
        engineManager.setPresenting(false)
        engineManager.onClose = nil
        engineManager.onError = nil
    }
}
