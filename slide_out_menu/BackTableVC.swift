//
//  BackTableVC.swift
//  slide_out_menu
//
//  Created by Minh Pham on 11/21/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController{
    
    var tableArray = [String]()
    
    override func viewDidLoad() {
        tableArray = ["First", "Second", "Third"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: tableArray[indexPath.row], for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = tableArray[indexPath.row]
        
        return cell
    }
    
    
    
}
