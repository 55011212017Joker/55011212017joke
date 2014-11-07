//
//  ViewController.swift
//  animationinswift
//
//  Created by Student on 11/7/14.
//  Copyright (c) 2014 jay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   @IBOutlet weak var numberOfFishSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func animateButtonPressed(sender: AnyObject) {
        
        
        let numberOfFish = Int(self.numberOfFishSlider.value)
        println(numberOfFish)
        for loopNumber in 1...numberOfFish {
            
            // set up some constants for the animation
            let duration = 1.0
            let options = UIViewAnimationOptions.CurveLinear
            
            // randomly assign a delay of 0.9 to 1s
            let delay =  NSTimeInterval( ((Int(rand()) %  900)+100.0) / 1000.0)
            
            // set up some constants for the fish
            let size : CGFloat = CGFloat( Int(rand()) %  40 + 50.0)
            let yPosition : CGFloat = CGFloat( Int(rand()) %  100 + 20.0)
            
            // create the fish
            let fish = UIImageView()
            fish.image = UIImage(named: "2.gif")
            fish.frame = CGRectMake(0-size, yPosition, size, size)
            self.view.addSubview(fish)
            
            // define the animation
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                
                // move the fish
                fish.frame = CGRectMake(320, yPosition, size, size)
                
                }, completion: { animationFinished in
                    
                    // remove the fish
                    fish.removeFromSuperview()
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

