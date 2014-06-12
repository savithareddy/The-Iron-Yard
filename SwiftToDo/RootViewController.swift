//
//  RootViewController.swift
//  SwiftToDo
//
//  Created by Savitha Reddy on 6/12/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

import UIKit

//var item = "item" // global declare 

class RootViewController:UITableViewController,UITextFieldDelegate{
    
    var dinosaurs = ["Stegosauraus","TRex","name3","name4"] // let makes code faster// is a constant/cannot be add items later - not mutable // if var then can change i.e mutable // this array can be accessed in the appDelegate too
    // this becomes property  like decalrig out of the scope of noofrows etc..
    // to add items let change to var
    var inputField = UITextField(frame: CGRectMake(10, 10, 200, 40))
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        self.tableView.editing = true
       self.navigationItem.rightBarButtonItem = self.editButtonItem()
        var inputForm  = UIView(frame:CGRectMake(0, 0, 320, 60))
        inputField.delegate = self
        inputField.placeholder = "New Input"
        inputForm.addSubview(inputField)
        var inputButton = UIButton(frame: CGRectMake(220, 10, 90, 40))
//       inputButton.titleLabel.text = "Add New"
      inputButton.setTitle("Add New", forState: UIControlState.Normal)
        inputButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        inputButton.addTarget(self, action: "addNew", forControlEvents: UIControlEvents.TouchUpInside)
        inputForm.addSubview(inputButton)
        
        self.tableView.tableHeaderView = inputForm
        
    }
    
    func addNew()
    {
//        dinosaurs += inputField.text
        dinosaurs.insert(inputField.text, atIndex: 0)
        self.tableView .reloadData()
        inputField.text = ""
        inputField.resignFirstResponder()
    
//        println(inputField.text)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        addNew()
        return true
    }
    
    override func  tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return dinosaurs.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = UITableViewCell()
        cell.textLabel.text = dinosaurs[indexPath.row]
        cell.backgroundColor = UIColor.grayColor()
        return cell
    }
    override func prefersStatusBarHidden() -> Bool {return true}
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            dinosaurs .removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
//        else
//    if editingStyle == UITableViewCellEditingStyle.Insert{
//            dinosaurs.append("Name9")
//            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
//        }
    }
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!) {
        
        var movedItem = dinosaurs[sourceIndexPath.row]
        dinosaurs.removeAtIndex(sourceIndexPath.row)
        dinosaurs.insert(movedItem, atIndex: destinationIndexPath.row)
    }
    
}


