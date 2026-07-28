import Flutter
import UIKit

final class RollaFlutterViewController: FlutterViewController {

    var onDismiss: ((RollaCloseReason) -> Void)?
    private var didNotifyDismiss = false

    // UIKit's transitioningDelegate property is weak — the delegate must be
    // held strongly for the VC's lifetime so dismissal (which can happen much
    // later) is driven by the same animator as the presentation.
    private var presentationTransitionDelegate: UIViewControllerTransitioningDelegate?

    func setupPresentation(transition: RollaTransition) {
        modalPresentationStyle = .fullScreen
        let transitionDelegate: UIViewControllerTransitioningDelegate
        switch transition {
        case .default:
            transitionDelegate = RollaSlideTransitioningDelegate()
        case .fade:
            transitionDelegate = RollaFadeTransitioningDelegate()
        }
        presentationTransitionDelegate = transitionDelegate
        transitioningDelegate = transitionDelegate
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

