import UIKit

final class RollaSlideTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        RollaSlideAnimator(isPresenting: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        RollaSlideAnimator(isPresenting: false)
    }
}

final class RollaSlideAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    private let isPresenting: Bool
    
    private let duration: TimeInterval = 0.35
    
    private let parallaxRatio: CGFloat = 0.3

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
              let toVC = transitionContext.viewController(forKey: .to),
              let fromView = transitionContext.view(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }

        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toVC)
        let width = finalFrame.width

        toView.frame = finalFrame
        containerView.addSubview(toView)
        
        toView.transform = CGAffineTransform(translationX: width, y: 0)
        
        toView.layer.shadowColor = UIColor.black.cgColor
        toView.layer.shadowOpacity = 0.3
        toView.layer.shadowOffset = CGSize(width: -3, height: 0)
        toView.layer.shadowRadius = 8

        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveEaseOut
        ) {
            toView.transform = .identity
            
            fromView.transform = CGAffineTransform(translationX: -width * self.parallaxRatio, y: 0)
            fromView.alpha = 0.9
        } completion: { _ in
            fromView.transform = .identity
            fromView.alpha = 1.0
            
            toView.layer.shadowOpacity = 0
            
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
        let width = fromView.bounds.width
        
        containerView.insertSubview(toView, belowSubview: fromView)
        
        toView.transform = CGAffineTransform(translationX: -width * parallaxRatio, y: 0)
        toView.alpha = 0.9
        
        fromView.layer.shadowColor = UIColor.black.cgColor
        fromView.layer.shadowOpacity = 0.3
        fromView.layer.shadowOffset = CGSize(width: -3, height: 0)
        fromView.layer.shadowRadius = 8

        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveEaseOut
        ) {
            fromView.transform = CGAffineTransform(translationX: width, y: 0)
            
            toView.transform = .identity
            toView.alpha = 1.0
        } completion: { _ in
            fromView.layer.shadowOpacity = 0
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
