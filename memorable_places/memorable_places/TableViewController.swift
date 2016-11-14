//
//  TableViewController.swift
//  memorable_places
//
//  Created by Minh Pham on 11/13/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

var places = [Dictionary<String, String>()]

var activePlace = -1

class TableViewController: UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()        
        print(places)
        print(places.count)
        if places.count == 1{
            places.removeAtIndex(0)
            places.append(["name": "Taj Mahal", "lat": "27.175277", "lon": "78,042128"])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        print(places, "elo")
        cell.textLabel?.text = places[indexPath.row]["name"]
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        activePlace = indexPath.row
        return indexPath
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newPlace"{
            activePlace = -1
        }
    }
}

