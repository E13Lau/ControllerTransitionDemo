//
//  TransitionDelegate.swift
//  testPresent
//
//  Created by 刘一智 on 2016/11/18.
//  Copyright © 2016年 liuyizhi. All rights reserved.
//

import UIKit

class TransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    var presentactionIsInteraction = false

    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimation()
    }
    
    //！！！
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if presentactionIsInteraction {
            currentInteractionController = InteractionController()
            return currentInteractionController
        } else {
            return nil
        }
    }
    
    private var currentInteractionController: InteractionController? = nil
    var currentTransitionProgress: CGFloat = 0.0 {
        didSet {
            currentInteractionController?.update(currentTransitionProgress)
        }
    }
    
    func completeCurrentInteractionTransition() {
        currentInteractionController?.finish()
    }
    
    func canelCurrentInteractiveTransition() {
        currentInteractionController?.cancel()
    }
    
    
    
}
