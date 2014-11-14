//
//  Attach.swift
//  quiz_new
//
//  Created by Student on 11/14/14.
//  Copyright (c) 2014 jay. All rights reserved.
//

import UIKit

class Attach: UIViewController {

    var squareView: UIView!
    var anchorView: UIView!
    var attachment: UIAttachmentBehavior!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    
    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        
        attachment.anchorPoint = sender.locationInView(view)
        anchorView.center = sender.locationInView(view)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        squareView.backgroundColor = UIColor.blueColor()
        view.addSubview(squareView)
        
        anchorView = UIView(frame: CGRect(x: view.center.x, y: view.center.y, width: 20, height: 20))
        anchorView.backgroundColor = UIColor.redColor()
        view.addSubview(anchorView)
        
        attachment = UIAttachmentBehavior(item: squareView, attachedToAnchor: CGPointMake(anchorView.center.x, anchorView.center.y))
        
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(attachment)
        
        gravity = UIGravityBehavior(items: [squareView])
        animator.addBehavior(gravity)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
