//
//  ViewController.swift
//  bounce_animation
//
//  Created by Minh Pham on 11/6/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
   
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.center.x = self.view.frame.width + 30
        label.center.x = self.view.frame.width + 30
        
        UIView.animate(withDuration: 4.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 30.0, animations: ({
            self.button.center.x = self.view.frame.width/2
        }), completion: nil)
        
        
        UIView.animate(withDuration: 4.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 30.0, animations: ({
            self.label.center.x = self.view.frame.width/2
        }), completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

