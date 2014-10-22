//
//  ViewController.swift
//  segue
//
//  Created by Student on 10/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ColorTwoViewControllerDelegate {

    @IBOutlet var ColorLable: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func myVCDidFinish(controler:ColorTwoViewController,text:String){
        ColorLable.text = "Co: " + text
        controler.navigationController?.popViewControllerAnimated(true)
        
        
    
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as ColorTwoViewController
            vc.ColorString = ColorLable.text!
            vc.delegate = self
        }
    }


}

