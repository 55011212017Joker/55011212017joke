//
//  ViewController.swift
//  NiceJar
//
//  Created by dasdom on 24.08.14.
//  Copyright (c) 2014 Dominik Hauser. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import CoreMotion

class ViewController: UIViewController {
    
    let tweaks = Tweaks()
    
    var animator: UIDynamicAnimator?
    var propertyBehavior = UIDynamicItemBehavior()
    let gravityBehavior = UIGravityBehavior()
    
    var coins = [UIImageView]()
    var totalNumberOfCoins: Int = 0
    
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var jarView: UIView!
    @IBOutlet weak var summaryButton: UIButton!
    @IBOutlet weak var verticalLabelConstraint: NSLayoutConstraint!
    
    let kTotalNumberOfCoins = "kTotalNumberOfCoins"
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collisionBehavior: UICollisionBehavior = {
            let behavior = UICollisionBehavior()
            behavior.translatesReferenceBoundsIntoBoundary = true;
            return behavior
            }()
        
        animator = {
            let animator = UIDynamicAnimator(referenceView: self.jarView)
            animator.addBehavior(self.gravityBehavior)
            animator.addBehavior(collisionBehavior)
            animator.addBehavior(self.propertyBehavior)
            return animator
            }()
        
        tweaks.tweakActionForCategory("Jar View", collectionName: "Coin Label", name: "Text Size", defaultValue: 30, minimumValue: 20, maximumValue: 60, action: { (currentValue) -> () in
            self.coinLabel.font = self.coinLabel.font.fontWithSize(CGFloat(currentValue.floatValue))
        })
        
        tweaks.tweakActionForCategory("Jar View", collectionName: "Coin Label", name: "Orange Text", defaultValue: false, action: { (currentValue) -> () in
            if currentValue.boolValue == true {
                self.coinLabel.textColor = UIColor(red: 0.98, green: 0.58, blue: 0.13, alpha: 1.0)
            } else {
                self.coinLabel.textColor = UIColor.blackColor()
            }
        })
        
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(data, error) in
            let magnitude = Tweaks.tweakValueForCategory("Jar View", collectionName: "Dynamics", name: "Gravity Magnitude", defaultValue: 1.0)
            let y = magnitude * CGFloat(data.acceleration.y)
            let x = magnitude * CGFloat(data.acceleration.x)
            self.gravityBehavior.gravityDirection = CGVector(x, -y)
        })
        
        totalNumberOfCoins = NSUserDefaults.standardUserDefaults().integerForKey(kTotalNumberOfCoins)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let elasticity = Tweaks.tweakValueForCategory("Jar View", collectionName: "Coins", name: "Elasticity", defaultValue: 0.35, minimumValue: 0.0, maximumValue: 1.0)
        propertyBehavior.elasticity = elasticity
        
        let labelConstaintConstant = Tweaks.tweakValueForCategory("Jar View", collectionName: "Label", name: "Y Offset", defaultValue: 102)
        verticalLabelConstraint.constant = labelConstaintConstant
        
        let showButton = Tweaks.tweakValueForCategory("Summary", collectionName: "General", name: "Show", defaultValue: false)
        summaryButton.hidden = !showButton
        
    }
    
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if let eventTouches = event.touchesForView(jarView) {
            let touch = eventTouches.anyObject() as UITouch
            let location = touch.locationInView(jarView)
            
            let coinDiameter = Tweaks.tweakValueForCategory("Jar View", collectionName: "Coins", name: "Size", defaultValue: 50)
            
            let coinView = UIImageView(image: UIImage(named: "coin"))
            coinView.frame = CGRectMake(0, 0, coinDiameter, coinDiameter)
            coinView.layer.cornerRadius = floor(coinDiameter/2.0)
            coinView.center = location
            
            addCoin(coinView)
            coinLabel.text = "\(coins.count)"
        }
    }
    
    func addCoin(coinView: UIImageView) {
        jarView.addSubview(coinView)
        
        coins.append(coinView)
        
        for behavior in animator!.behaviors {
            behavior.addItem(coinView)
        }
    }
    
    @IBAction func removeCoins(sender: AnyObject?) {
        for coinView in coins {
            coinView.removeFromSuperview()
            
            for behavior in animator!.behaviors {
                behavior.removeItem(coinView)
            }
        }
        
        coins = [UIImageView]()
        
        coinLabel.text = "\(coins.count)"
    }
    
    @IBAction func saveCoins(sender: AnyObject) {
        
        totalNumberOfCoins += coins.count
        NSUserDefaults.standardUserDefaults().setInteger(totalNumberOfCoins, forKey: kTotalNumberOfCoins)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: nil, animations: { () in
            for coinView in self.coins {
                coinView.alpha = 0.0
                self.coinLabel.alpha = 0.0
            }
            }) { (finished) in
                self.removeCoins(nil)
                self.coinLabel.alpha = 1.0
        }
    }
    
    @IBAction func showSummary(sender: UIButton) {
        let message = "You have a total number of \(totalNumberOfCoins+coins.count) coins."
        let alertController = UIAlertController(title: "Your Coins", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}


