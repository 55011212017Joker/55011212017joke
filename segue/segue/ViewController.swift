//
//  ViewController.swift
//  segue
//
//  Created by Student on 10/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ColorTwoViewControllerDelegate{

    @IBOutlet var ColorLable: UILabel!
  
    @IBOutlet var nameOne: UILabel!
    
    @IBOutlet var IDOne: UILabel!
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       nameOne.text = ""
       IDOne.text = ""
        
        
    }
    func myVCDidFinish(controller:ColorTwoViewController,text:String,procol:UIColor,f:UIFont,name:String,id:String){
        ColorLable.text = "Co: " + text
        ColorLable.textColor = procol
        ColorLable.font = f
        ColorLable.layer.borderWidth = 5
        ColorLable.layer.borderColor = procol.CGColor
        nameOne.text = "NAME: " + name
        nameOne.textColor = procol
        nameOne.layer.borderWidth = 5
        nameOne.layer.borderColor = UIColor.blackColor().CGColor
        IDOne.text = "ID: " + id
        IDOne.textColor = procol
        IDOne.layer.borderWidth = 5
        IDOne.layer.borderColor = UIColor.blackColor().CGColor
        
        
        controller.navigationController?.popViewControllerAnimated(true)
        
        
    
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "mysegue"){
            let vc = segue.destinationViewController as ColorTwoViewController
            vc.ColorString = ColorLable.text!
            vc.delegate = self
        }
    }


}

