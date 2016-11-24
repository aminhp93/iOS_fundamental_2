//
//  ViewController.swift
//  audio
//
//  Created by Minh Pham on 11/5/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    @IBAction func play(_ sender: UIButton) {
        audioPlayer.play()
    }
    
    @IBAction func pause(_ sender: UIButton) {
        if audioPlayer.isPlaying{
            audioPlayer.pause()
        } else {
            
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        if audioPlayer.isPlaying{
            audioPlayer.stop()
            audioPlayer.play()
        } else {
            audioPlayer.play()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "smb_coin", ofType: "wav")!))
            audioPlayer.prepareToPlay()
        }
        catch {
           print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

