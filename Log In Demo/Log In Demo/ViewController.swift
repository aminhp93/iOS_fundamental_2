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

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func button(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newValue.setValue(textField.text, forKey: "username")
        
        do {
            try context.save()
            
            textField.alpha = 0
            button.alpha = 0
            label.alpha = 1
            
            label.text = "Hi there " + textField.text! + "!"
            
            
        } catch {
            print("Saved failed")
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
                    button.alpha = 0
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

