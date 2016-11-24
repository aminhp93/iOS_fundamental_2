//
//  ViewController.swift
//  spinnet_alert
//
//  Created by Minh Pham on 11/19/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func create(_ sender: Any) {
        let alertController = UIAlertController(title: "Hey there", message: "Are you there", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("button pressed")
            self.dismiss(animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            print("button pressed")
            self.dismiss(animated: true, completion: nil)
        }))

        
        self.present(alertController
            , animated: true, completion: nil)
    }

    @IBAction func pause(_ sender: Any) {
        activityIndicator = UIActivityIndicatorView(frame:CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
//        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    @IBAction func restore(_ sender: Any) {
        activityIndicator.stopAnimating()
//        UIApplication.shared.endIgnoringInteractionEvents()
        
    }
}

