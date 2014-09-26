//
//  ViewController.swift
//  inputname
//
//  Created by Student on 9/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let cellIdentifier = "cellIdentifier"
    @IBOutlet var lableName: UILabel!
    @IBOutlet var textInput: UITextField!
    @IBOutlet var buttonAdd: UIButton!
    @IBOutlet var tableviewShow: UITableView!
    var name = [String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button(sender: AnyObject) {
        var x = textInput.text;
        name.append(x)
    }
    func tableView(tableView: UITableView!,callForRowAtIndexPath indexPath: NSIndexPath!)->UITableViewCell{
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)as UITableViewCell
        cell.textLabel!.text = self.name[indexPath.row]
        self.tableviewShow.reloadData();
        
      //  cell.textLabel!.text = self.tableData[indexPath.row]
        return cell
    }

}

