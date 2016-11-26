//
//  ViewController.swift
//  Log In Demo
//
//  Created by Minh Pham on 11/25/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var isLoggedIn = false
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var logout: UIButton!
    
    @IBAction func button(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if isLoggedIn {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            
            do {
                let results = try context.fetch(request)
                
                if results.count > 0 {
                    for i in results as! [NSManagedObject] {
                        i.setValue(textField.text, forKey: "username")
                        
                        do {
                            try context.save()
                        } catch {
                            print("Saved failed")
                        }
                    }
                    
                    label.text = "Hi there " + textField.text! + "!"
                    
                    
                }
            } catch {
                print("Update Username failed")
            }
            
            
            
        } else {
        
            let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            
            newValue.setValue(textField.text, forKey: "username")
            
            do {
                try context.save()
                
                textField.alpha = 0
                button.setTitle("Log In", for: [])
                label.alpha = 1
                
                label.text = "Hi there " + textField.text! + "!"
                isLoggedIn = false
                
            } catch {
                print("Saved failed")
            }
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do {
            let results = try context.fetch(request)
            if results.count > 0{
                for i in results as! [NSManagedObject] {
                    context.delete(i)
                    
                    do {
                        try context.save()
                    } catch {
                        print("Individual delete failed")
                    }
                }
                label.alpha = 0
                
                logout.alpha = 0
                
                textField.alpha = 1
                
                button.alpha = 1
                isLoggedIn = true
            }
        } catch {
            print("Delete failed")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            for i in results as! [NSManagedObject]{
                if let result = i.value(forKey: "username") as? String{
                    textField.alpha = 0
                    button.setTitle("Update Username", for: [])
                    label.alpha = 1
                    
                    label.text = "Hi there " + result + "!"
                }
            }
            
            
        } catch {
            print("Request failed")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

