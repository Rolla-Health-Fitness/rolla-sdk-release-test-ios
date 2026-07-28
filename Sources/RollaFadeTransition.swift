import UIKit

final class RollaFadeTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        RollaFadeAnimator(isPresenting: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        RollaFadeAnimator(isPresenting: false)
    }
}

final class RollaFadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    private let isPresenting: Bool

    // Matches RollaSlideAnimator so both transitions feel equally quick.
    private let duration: TimeInterval = 0.35

    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            animatePresent(using: transitionContext)
        } else {
            animateDismiss(using: transitionContext)
        }
    }

    private func animatePresent(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to),
              let toVC = transitionContext.viewController(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }

        let containerView = transitionContext.containerView
        toView.frame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)

        toView.alpha = 0

        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveEaseOut
        ) {
            toView.alpha = 1
        } completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }

    private func animateDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
              let toView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }

        let containerView = transitionContext.containerView

        // With .fullScreen the host view was removed on present — restore it
        // underneath before fading the SDK UI out.
        containerView.insertSubview(toView, belowSubview: fromView)
        toView.alpha = 1

        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveEaseOut
        ) {
            fromView.alpha = 0
        } completion: { _ in
            fromView.alpha = 1
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
