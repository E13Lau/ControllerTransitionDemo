//
//  DismissAnimation.swift
//  testPresent
//
//  Created by 刘一智 on 2016/11/18.
//  Copyright © 2016年 liuyizhi. All rights reserved.
//

import UIKit

private enum AnimationParameters {
    static let duration = 0.4
    static let damping: CGFloat = 0.8
}


class DismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return AnimationParameters.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //TODO:  as <>
        guard let fromController = transitionContext.viewController(forKey: .from) else {      return
        }
        
        let animations: () -> ()
        if transitionContext.isInteractive {
            animations = {
                fromController.view.alpha = 0.0
            }
        } else {
            //TODO::
            animations = {
                fromController.view.alpha = 0.0
            }
        }
        
        let completion = { (finished: Bool) in
            transitionContext.completeTransition(finished)
        }
        
        if transitionContext.isAnimated {
            let duraion = transitionDuration(using: transitionContext)
            if transitionContext.isInteractive {
                UIView.animate(withDuration: duraion, delay: 0, options: [], animations: animations, completion: completion)
            } else {
                UIView.animate(withDuration: duraion, delay: 0, usingSpringWithDamping: AnimationParameters.damping, initialSpringVelocity: 0, options: [], animations: animations, completion: completion)
            }
        } else {
            animations()
            completion(true)
        }
        
    }
}
