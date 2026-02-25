import Flutter
import UIKit

final class RollaFlutterViewController: FlutterViewController {

    var onDismiss: ((RollaCloseReason) -> Void)?
    private var didNotifyDismiss = false
    private let slideTransitionDelegate = RollaSlideTransitioningDelegate()

    func setupSlidePresentation() {
        modalPresentationStyle = .fullScreen
        transitioningDelegate = slideTransitionDelegate
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        guard !didNotifyDismiss else { return }

        if isMovingFromParent {
            notifyDismissOnce(reason: .hostNavigationBack)
            return
        }

        if isBeingDismissed {
            notifyDismissOnce(reason: .hostModalDismiss)
            return
        }

        if navigationController?.isBeingDismissed == true {
            notifyDismissOnce(reason: .hostModalDismiss)
            return
        }

        if let nav = navigationController, !nav.viewControllers.contains(self) {
            notifyDismissOnce(reason: .hostStackReplaced)
            return
        }

        if view.window == nil {
            notifyDismissOnce(reason: .unknown)
        }
    }

    private func notifyDismissOnce(reason: RollaCloseReason) {
        didNotifyDismiss = true
        onDismiss?(reason)
        onDismiss = nil
    }
}

