//
//  ColorTwoViewController.swift
//  segue
//
//  Created by Student on 10/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ColorTwoViewController: UIViewController {
    var ColorString = ""
    @IBOutlet var ColorLable: UILabel!
    
    @IBAction func SaveColor(sender: UIBarButtonItem) {
    }
    
    @IBAction func ColorSelectionButton(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
