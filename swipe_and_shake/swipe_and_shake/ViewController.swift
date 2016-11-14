//
//  ViewController.swift
//  swipe_and_shake
//
//  Created by Minh Pham on 11/13/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
//        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
//        self.view.addGestureRecognizer(swipeRight)
//        
//        var swipeUP = UISwipeGestureRecognizer(target: self, action: "swiped:")
//        swipeUP.direction = UISwipeGestureRecognizerDirection.Up
//        self.view.addGestureRecognizer(swipeUP)
        
    }
    
    
    var sounds = ["hello", "millionaire"]
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake{
            print("Devide was shaken")
            
            var randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            var fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            do {
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                
                player.play()
            } catch {
                
            }
            
            
            
        }
    }

//    func swiped(gesture:UIGestureRecognizer){
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
//            switch swipeGesture.direction{
//                
//            case UISwipeGestureRecognizerDirection.Right:
//                print("Swiped Right")
//            case UISwipeGestureRecognizerDirection.Up:
//                print("SWiped Up")
//            default:
//                break
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

