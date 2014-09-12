//
//  ViewController.swift
//  sumone
//
//  Created by Student on 9/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var sumOne: UIButton!
    
    @IBOutlet var sumTwo: UIButton!
    
    @IBOutlet var sumThree: UIButton!
    
    @IBOutlet var sumReset: UIButton!
    
    @IBOutlet var lableOne: UILabel!
    
    @IBOutlet var lableTwo: UILabel!
    
    @IBOutlet var lableThree: UILabel!
    var one = 0
    var two = 0
    var three = 0
    override func
        
        viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func acOne(sender: AnyObject) {
        one += 1
        lableOne.text = "\(String(one))"
        
    }

    @IBAction func acTwo(sender: AnyObject) {
        two += 1
        lableTwo.text = "\(String(two))"
    }
    
    @IBAction func acThree(sender: AnyObject) {
        three += 1
        lableThree.text = "\(String(three))"
    }
}

