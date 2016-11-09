//
//  ViewController.swift
//  segue_example
//
//  Created by Minh Pham on 11/8/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.inputText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func press(_ sender: Any) {
        label.text = inputText.text
    }

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var inputText: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) ->Bool{
        textField.resignFirstResponder()
        return true
    }
    
    
}

