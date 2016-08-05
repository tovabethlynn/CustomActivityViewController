//
//  ViewController.swift
//  CustomActivityViewController
//
//  Created by Tova Grobert on 8/5/16.
//  Copyright © 2016 Toes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    let dimView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(dismissActivityVC), name: "dismissActivityVC", object: nil)
        
    }
    
    
    func dismissActivityVC() {
        
        UIView.animateWithDuration(0.35, animations: {
            
            self.dimView.alpha = 0
            
        }) { (finished) in
            
            self.dimView.removeFromSuperview()
            
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    // MARK: - Navigation
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let controller = segue.destinationViewController as! ActivityViewController

        controller.modalPresentationStyle = .Custom
        controller.transitioningDelegate = self

        //dim out background view
        dimView.frame = self.view.frame
        self.view.addSubview(self.dimView)
        dimView.backgroundColor = UIColor.blackColor()
        dimView.alpha = 0

        UIView.animateWithDuration(0.35, animations: {
            self.dimView.alpha = 0.4
        })


    }

    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return HalfSizePresentationController(presentedViewController: presented, presentingViewController: presenting)
        
    }

}




class HalfSizePresentationController : UIPresentationController {
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        return CGRect(x: 0, y: containerView!.bounds.height / 2, width: containerView!.bounds.width, height: containerView!.bounds.height / 2)
    }
    
}

