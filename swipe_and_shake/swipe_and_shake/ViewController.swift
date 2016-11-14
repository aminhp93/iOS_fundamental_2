//
//  ViewController.swift
//  swipe_and_shake
//
//  Created by Minh Pham on 11/13/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeUP = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUP.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUP)
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake{
            print("Devide was shaken")
            
        }
    }

    func swiped(gesture:UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
                
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped Right")
            case UISwipeGestureRecognizerDirection.Up:
                print("SWiped Up")
            default:
                break
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

