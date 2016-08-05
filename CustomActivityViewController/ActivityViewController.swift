//
//  ActivityViewController.swift
//  TabataTimer
//
//  Created by Tova Grobert on 7/21/16.
//  Copyright © 2016 Toes. All rights reserved.
//

import UIKit
import AVFoundation

class ActivityViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    
    @IBAction func done(sender: AnyObject) {
        
        NSNotificationCenter.defaultCenter().postNotificationName("dismissActivityVC", object: self, userInfo: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ActivityViewController.dismissActivityView))
        gesture.cancelsTouchesInView = false
        self.view.window?.addGestureRecognizer(gesture)
        
    }
    
    
    func dismissActivityView(sender: UITapGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.Ended {
            let location: CGPoint = sender.locationInView(nil)
            
            if !self.view.pointInside(self.view.convertPoint(location, fromView: self.view.window), withEvent: nil) {
                self.view.window?.removeGestureRecognizer(sender)
                done(self)
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
