//
//  ViewController.swift
//  working_with_audio
//
//  Created by Minh Pham on 11/13/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    @IBAction func play(sender: AnyObject) {
     
        player.play()

    }
    
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func volume(sender: AnyObject) {
        player.volume = slider.value
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath = NSBundle.mainBundle().pathForResource("millionaire", ofType: "mp3")!
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
        } catch {
            // Process error here
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

