//
//  ViewControllerTWO.swift
//  ProjectCoreSegue
//
//  Created by Student on 10/31/14.
//  Copyright (c) 2014 jay. All rights reserved.
//

import UIKit
import CoreData

protocol ViewControllerTwoDelegate{
    func myVCDidFinish(controller:ViewControllerTWO,str:String)
}
class ViewControllerTWO: UIViewController {
    var items = [NSManagedObject]()
    var delegate:ViewControllerTwoDelegate? = nil
    var text = ""
    @IBOutlet weak var TextInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Save(sender: AnyObject) {
        if( delegate != nil){
            delegate!.myVCDidFinish(self,str:text)
        }
    }
   
    @IBAction func AddItem(sender: AnyObject) {
        
        var alert = UIAlertController(title: "New Item", message: "Add a new item", preferredStyle:.Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default){(action: UIAlertAction!) -> Void in
            
            let textField = alert.textFields![0] as UITextField
            //self.items.append(textField.text)
            //self.saveName(textField.text)
            self.text = textField.text;
            //self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style:.Default){(action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
        
    }
   /* func saveName(name:String){
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        item.setValue(name, forKey: "name")
        //4
        var error: NSError?
        if !managedContext.save(&error){
            println("Could not save \(error), \(error?.userInfo)")
        }
        //5
        items.append(item)
    }*/
   
}
