//
//  ViewController.swift
//  Core Data
//
//  Created by Minh Pham on 11/25/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("kristen", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(35, forKey: "age")
        
        do {
            try context.save()
            print("Saved")
        } catch {
            print("There are errors")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for i in results as! [NSManagedObject]{
                    if let username = i.value(forKey: "username") as? String{
                        print(username)
                    }
                }
            } else {
                print("No result")
            }
            
        } catch {
            print("Could not catch reuslts")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

