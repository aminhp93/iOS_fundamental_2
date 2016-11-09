//
//  ViewController.swift
//  permanent_storage
//
//  Created by Minh Pham on 11/8/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        UserDefaults.standard.set("Rob", forKey: "name")
        
        let userName = UserDefaults.standard.object(forKey: "name")!
        print(userName)
        
        let arr = [1,2,3,4]
        UserDefaults.standard.set(arr, forKey: "array")
        let returnedArray = UserDefaults.standard.object(forKey: "array")! as! Array<Any>
        print(returnedArray)
        
        for x in returnedArray{
            print(x)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

