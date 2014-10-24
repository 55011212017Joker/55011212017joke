//
//  ColorTwoViewController.swift
//  segue
//
//  Created by Student on 10/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
protocol ColorTwoViewControllerDelegate{
    func myVCDidFinish(controller:ColorTwoViewController,text:String,procol:UIColor,f:UIFont,name:String,id:String)
}

class ColorTwoViewController: UIViewController {
    
    @IBOutlet var red: UIButton!
    
    @IBOutlet var IDnameText: UITextField!
    @IBOutlet var NameText: UITextField!
    @IBOutlet var blue: UIButton!
    @IBOutlet var green: UIButton!
    var delegate:ColorTwoViewControllerDelegate? = nil
    var ColorString = ""
   @IBOutlet var ColorLable: UILabel!
    var col: UIColor!
    var fon: UIFont!
   
    @IBAction func SaveColor(sender: UIBarButtonItem) {
        if(delegate != nil){
            delegate!.myVCDidFinish(self,text: ColorLable!.text!,procol:col,f:fon,name: NameText!.text!,id: IDnameText!.text!)
        }
        
    }
    
    @IBAction func ColorSelectionButton(sender: UIButton) {
        ColorLable.text = sender.titleLabel!.text!
        col = getRandomColor();
        ColorLable.textColor = col
        //ColorLable.backgroundColor = getRandomColor()
        fon = UIFont.italicSystemFontOfSize(20)
        ColorLable.font = fon
        ColorLable.layer.borderWidth = 5
        ColorLable.layer.borderColor = col.CGColor
        
        
        
        
    }
    func getRandomColor() -> UIColor{
        
        var randomRed = CGFloat(arc4random() % 255)
        
        var randomGreen = CGFloat(arc4random() % 255)
        
        var randomBlue = CGFloat(arc4random() % 255)
        
        return UIColor(red: randomRed / 255.0, green: randomGreen / 255.0, blue: randomBlue / 255.0, alpha: 0.8)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        ColorLable.text = ColorString
     
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
