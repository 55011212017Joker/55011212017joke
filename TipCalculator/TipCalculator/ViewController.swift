//
//  ViewController.swift
//  TipCalculator
//
//  Created by Student on 9/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController:
UIViewController {
@IBOutlet var totalTextField : UITextField!
@IBOutlet var taxPctSlider : UISlider!
@IBOutlet var taxPCtLabel : UILabel!
@IBOutlet var resultsTextView : UITextView!
let tipCalc = TipCalculatorModel(total: 33.35,taxPct:0.06)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func CalulateTapped(sender: AnyObject) {
        //1
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        //2
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        //3
        for (tipPct,tipValue)in possibleTips{
            //4
            results  += "\(tipPct)%: \(tipValue)\n"
            
        }
        //5
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
       tipCalc.taxPct = Double(taxPctSlider.value)/100.0
        refreshUI()
    }
    @IBAction func ViewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    
    func refreshUI(){
        
        //1
        totalTextField.text = String(format:"%0.2f",tipCalc.total)
        //2
        taxPctSlider.value = Float(tipCalc.taxPct)*100
        //3
        taxPCtLabel.text = "Tax Percentage(\(Int(taxPctSlider.value))%):"
        resultsTextView.text = ""
    }
}

