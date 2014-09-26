//
//  ViewController.swift
//  TipCalculator
//
//  Created by Student on 9/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController:
UIViewController,UITableViewDelegate {
@IBOutlet var totalTextField : UITextField!
@IBOutlet var taxPctSlider : UISlider!
@IBOutlet var taxPCtLabel : UILabel!
@IBOutlet var resultsTextView : UITextView!
@IBOutlet var tableViewshow: UITableView!
let tipCalc = TipCalculatorModel(total: 33.35,taxPct:0.06)
    var possibleTips = Dictionary<Int, (tipAmt:Double, total:Double)>()
    var sortedKeys:[Int] = []
    
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
        //resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
       tipCalc.taxPct = Double(taxPctSlider.value)/100.0
        refreshUI()
    }
    @IBAction func ViewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    func tableView(tableView: UITableView,numberofRowsInSection section: Int)->Int{
        return sortedKeys.count
        
    }
    func numberofSectionsInTableView(tableView: UITableView!)->Int{
        
        return 1
    }
    func tableView(tableView:UITableView!, didSelectRowIndexPath indexPath:NSIndexPath!){
        
    }
    func tableView(tableView: UITableView!,callForRowAtIndexPath indexPath: NSIndexPath!)->UITableViewCell{
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel!.text = "\(tipPct)%:"
        cell.detailTextLabel!.text = String(format: "Tip: $0.2f, Total: $%0.2f", tipAmt, total)
        return cell
        
        
    }
    func refreshUI(){
        
        //1
        totalTextField.text = String(format:"%0.2f",tipCalc.total)
        //2
        taxPctSlider.value = Float(tipCalc.taxPct)*100
        //3
        taxPCtLabel.text = "Tax Percentage(\(Int(taxPctSlider.value))%):"
        
    }
}

