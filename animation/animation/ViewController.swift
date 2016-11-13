//
//  ViewController.swift
//  animation
//
//  Created by Minh Pham on 11/13/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 1
    var timer = NSTimer()
    var isAnimating = true
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func updateImage(sender: AnyObject) {
        if isAnimating == true {
            timer.invalidate()
            isAnimating = false
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            isAnimating = true
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
    }
    
    func doAnimation(){
                if counter == 3{
                    counter = 1
                } else {
                    counter += 1
                }
                imageView.image = UIImage(named: "Mario\(counter).png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
//        imageView.center = CGPointMake(imageView.center.x - 400, imageView.center.y)
//        imageView.alpha = 0
        imageView.frame = CGRectMake(100, 20, 0, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations: {
//            self.imageView.center = CGPointMake(self.imageView.center.x + 400, self.imageView.center.y)
//            self.imageView.alpha = 1
            self.imageView.frame = CGRectMake(100, 20, 100, 200)

        })
    }


}

