//
//  ViewController.swift
//  testPresent
//
//  Created by 刘一智 on 2016/11/17.
//  Copyright © 2016年 liuyizhi. All rights reserved.
//

import UIKit


@available(iOS 10.0, *)
class ViewController: UIViewController {
    
    let replyViewController: SecondViewController = {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "second") as! SecondViewController
    }()
    
    fileprivate var interaction: UIPreviewInteraction!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *) {
            setupPreviewInteraction()
        } else {
            // Fallback on earlier versions
        }

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func presented(_ sender: UITapGestureRecognizer) {
//        let second = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "second")
        self.present(replyViewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

@available(iOS 10.0, *)
extension ViewController: UIPreviewInteractionDelegate {
    
    fileprivate var replyViewControllerIsPresented: Bool {
        return presentedViewController != nil
    }
    
    func setupPreviewInteraction() -> () {
        interaction = UIPreviewInteraction(view: self.view)
        interaction.delegate = self
    }
    
    // MARK: UIPreviewInteractionDelegate
    func previewInteractionShouldBegin(_ previewInteraction: UIPreviewInteraction) -> Bool {
        return !replyViewControllerIsPresented
    }
    
    func previewInteraction(_ previewInteraction: UIPreviewInteraction, didUpdatePreviewTransition transitionProgress: CGFloat, ended: Bool) {
//        let second = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "second") as! InteractionSecondType
//        replyViewController = second
        if !replyViewControllerIsPresented {
            replyViewController.presentationIsInteraction = true
            present(replyViewController, animated: true, completion: nil)
        }

        replyViewController.interactionTransitionProgress = transitionProgress
        print("didUpdatePreviewTransition\(transitionProgress)")
        if ended {
            replyViewController.completeCurrentInteractionTransition()
        }
    }
    
    func previewInteraction(_ previewInteraction: UIPreviewInteraction, didUpdateCommitTransition transitionProgress: CGFloat, ended: Bool) {
        print("didUpdateCommitTransition\(transitionProgress)")
    }
    
    func previewInteractionDidCancel(_ previewInteraction: UIPreviewInteraction) {
        print("previewInteractionDidCancel")
        replyViewController.cancelCurrentInteractionTransition()
        replyViewController.dismiss(animated: true)
    }
    
}
