//
//  SecondViewController.swift
//  testPresent
//
//  Created by 刘一智 on 2016/11/17.
//  Copyright © 2016年 liuyizhi. All rights reserved.
//

import UIKit

protocol InteractionSecondType: class {
    func cancelCurrentInteractionTransition()
    func completeCurrentInteractionTransition()
    var interactionTransitionProgress: CGFloat { get set }
    var presentationIsInteraction : Bool { get set }
}

class SecondViewController: UIViewController, InteractionSecondType {
    
    private let transitionDelegate = TransitionDelegate()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = transitionDelegate
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = transitionDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = transitionDelegate
    }
    
    var presentationIsInteraction : Bool = false {
        didSet {
            transitionDelegate.presentactionIsInteraction = presentationIsInteraction
        }
    }
    var interactionTransitionProgress: CGFloat = 0.0 {
        didSet {
            transitionDelegate.currentTransitionProgress = interactionTransitionProgress
        }
    }
    func completeCurrentInteractionTransition() {
        transitionDelegate.completeCurrentInteractionTransition()
    }
    func cancelCurrentInteractionTransition() {
        transitionDelegate.canelCurrentInteractiveTransition()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
