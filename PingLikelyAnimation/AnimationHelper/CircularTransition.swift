//
//  CircularTransition.swift
//  PingLikelyAnimation
//
//  Created by Quoc Nguyen on 12/20/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

protocol CircleTransitionable {
    var triggerButton: UIButton {get}
    var contentLabel: UILabel {get}
    var mainView: UIView {get}
}

class CircularTransition: NSObject, UIViewControllerAnimatedTransitioning {

    weak var context: UIViewControllerContextTransitioning?

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? CircleTransitionable,
                let toVC = transitionContext.viewController(forKey: .to) as? CircleTransitionable,
                let snapshot = fromVC.mainView.snapshotView(afterScreenUpdates: false)
                else {
            transitionContext.completeTransition(false)
            return
        }
        context = transitionContext
        let containerView = transitionContext.containerView

        let background = UIView(frame: fromVC.mainView.frame)
        background.backgroundColor = fromVC.mainView.backgroundColor
        containerView.addSubview(background)

        containerView.addSubview(snapshot)
        fromVC.mainView.removeFromSuperview()
        animateOldTextOffscreen(fromView: snapshot)

        containerView.addSubview(toVC.mainView)
        animate(to: toVC.mainView, from: fromVC.triggerButton)
        animateTextLabel(to: toVC.contentLabel, from: fromVC.triggerButton)
    }

    // MARK: - Helper function
    private func animateOldTextOffscreen(fromView: UIView) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: {
            fromView.center += CGPoint(x: -1300, y: 1500)
            fromView.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
        }) { (_) in

        }
    }

    private func animate(to toView: UIView, from triggerButton: UIButton) {
        var buttonRect = triggerButton.frame
        buttonRect.size.height = buttonRect.size.width
        let circleMarkPathInitial = UIBezierPath(ovalIn: buttonRect)

        let fullHeight = toView.bounds.height
        let extremePoint = CGPoint(x: triggerButton.center.x,
                                   y: triggerButton.center.y - fullHeight)
        let radius = extremePoint.vectorLength()
        let circleMarkPathFinal = UIBezierPath(ovalIn: buttonRect.insetBy(dx: -radius, dy: -radius))

        let markLayer = CAShapeLayer()
        markLayer.path = circleMarkPathFinal.cgPath
        toView.layer.mask = markLayer

        let markLayerAnimation = CABasicAnimation(keyPath: "path")
        markLayerAnimation.fromValue = circleMarkPathInitial.cgPath
        markLayerAnimation.toValue = circleMarkPathFinal.cgPath
        markLayerAnimation.duration = 0.25
        markLayerAnimation.delegate = self
        markLayer.add(markLayerAnimation, forKey: "path")
    }

    private func animateTextLabel(to textLabel: UILabel, from triggerButton: UIButton) {
        let originalCenter = textLabel.center
        textLabel.alpha = 0.0
        textLabel.center = triggerButton.center
        textLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveEaseOut, animations: {
            textLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            textLabel.center = originalCenter
            textLabel.alpha = 1.0
        }) { (_) in

        }
    }
}

extension CircularTransition: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        context?.completeTransition(true)
    }
}
