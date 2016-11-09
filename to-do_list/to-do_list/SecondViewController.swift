//
//  SecondViewController.swift
//  to-do_list
//
//  Created by Minh Pham on 11/8/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var item: UITextField!
    
    @IBAction func addButton(sender: AnyObject) {
        toDoList.append(item.text!)
        print("1")
        print(toDoList)
        item.text = ""
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        item.resignFirstResponder()
        return true
    }

    
}

