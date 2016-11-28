//
//  PresentationController.swift
//  testPresent
//
//  Created by 刘一智 on 2016/11/18.
//  Copyright © 2016年 liuyizhi. All rights reserved.
//

import UIKit

//???
class PresentationController: UIPresentationController {

    let blurView = UIVisualEffectView()
    
    // The view controller that was presented by this view controller or its nearest ancestor.
    // presentedViewController
    // The view controller that presented this view controller (or its farthest ancestor.)
    // presentingViewController
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        blurView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    //???
    override func presentationTransitionWillBegin() {
        blurView.frame = containerView!.bounds
        containerView!.insertSubview(blurView, at: 0)

        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
            self.blurView.effect = UIBlurEffect(style: .light)
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
            self.blurView.effect = nil
        }, completion: nil)
    }
    
    // Position of the presented view in the container view by the end of the presentation transition.
    // (Default: container view bounds)
    override var frameOfPresentedViewInContainerView: CGRect {
        return containerView!.bounds
    }
    
}
