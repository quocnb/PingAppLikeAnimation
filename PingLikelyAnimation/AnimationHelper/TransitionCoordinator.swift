//
//  TransitionCoordinator.swift
//  PingLikelyAnimation
//
//  Created by Quoc Nguyen on 12/20/17.
//  Copyright © 2017 Quoc Nguyen. All rights reserved.
//

import UIKit

class TransitionCoordinator: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {

    }

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CircularTransition()
    }
}
