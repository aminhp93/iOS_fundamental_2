//
//  FirstViewController.swift
//  to-do_list
//
//  Created by Minh Pham on 11/8/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit


var toDoList:[String] = ["Hello", "Hello2"]

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var todoListTable: UITableView!
    
    override func viewDidLoad() {
        print(toDoList)

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil){
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print(toDoList.count)
        print(toDoList)

        return toDoList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    override func viewDidDisappear(animated: Bool) {
        todoListTable.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            todoListTable.reloadData()
        }
    }
}

