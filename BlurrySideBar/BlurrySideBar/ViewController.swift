//
//  ViewController.swift
//  BlurrySideBar
//
//  Created by Training on 01/09/14.
//  Copyright (c) 2014 Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SideBarDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    var sideBar:SideBar = SideBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "image2")
        sideBar = SideBar(sourceView: self.view, menuItems: ["first item", "second item", "funny item", "another item"])
        sideBar.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func sideBarDidSelectButtonAtIndex(_ index: Int) {
        if index == 0{
            imageView.backgroundColor = UIColor.red
            imageView.image = nil
        } else if index == 1{
            imageView.backgroundColor = UIColor.clear
            imageView.image = UIImage(named: "image2")
        }
    }

}

