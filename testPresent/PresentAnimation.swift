//
//  PresentAnimation.swift
//  testPresent
//
//  Created by 刘一智 on 2016/11/17.
//  Copyright © 2016年 liuyizhi. All rights reserved.
//

import UIKit

private enum AnimationParameters {
    static let duration = 0.4
    static let damping: CGFloat = 0.7
}

class PresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return AnimationParameters.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let toView = transitionContext.view(forKey: .to) {
            transitionContext.containerView.addSubview(toView)
            toView.layoutIfNeeded()
            toView.alpha = 1.0
        }
        //TODO:as <XXXType>
        let toViewController = transitionContext.viewController(forKey: .to)
        
        let completion = { (finished: Bool) in
            transitionContext.completeTransition(finished)
        }
        
        let animation = {
            
        }
        
        if transitionContext.isAnimated {
            //是否可动画的，大部分时间都是
            let duration = transitionDuration(using: transitionContext)
            let runAnimations = {
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: AnimationParameters.damping, initialSpringVelocity: 0, options: [], animations: animation, completion: completion)
            }
            if transitionContext.isInteractive {
                //可交互的
                UIView.animate(withDuration: duration, delay: 0, options: [], animations: {}, completion: { (finished) in
                    if transitionContext.transitionWasCancelled {
                        completion(false)
                    } else {
                        runAnimations()
                    }
                })
            } else {
                runAnimations()
            }
        } else {
            animation()
            completion(true)
        }
        
    }

}
