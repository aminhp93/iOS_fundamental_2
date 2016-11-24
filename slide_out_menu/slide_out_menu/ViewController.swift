//
//  ViewController.swift
//  slide_out_menu
//
//  Created by Minh Pham on 11/21/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var varView = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        openButton.target = self.revealViewController()
        openButton.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if varView == 0{
            label.text = "Strings"
        } else {
            label.text = "Others"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var openButton: UIBarButtonItem!

    @IBOutlet weak var label: UILabel!
}

