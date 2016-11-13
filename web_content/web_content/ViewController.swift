//
//  ViewController.swift
//  web_content
//
//  Created by Minh Pham on 11/9/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        // Download directly from url
        webView.loadRequest(NSURLRequest(URL: url))
        
        // Download source code content
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
//            // Will happend when task complete
//            if let urlContent = data {
//                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
//                print(webContent)
//                
//                dispatch_async(dispatch_get_main_queue(), {() -> Void in
//                    self.webView.loadHTMLString(String(webContent), baseURL: nil)
//                })
//                
//            } else {
//                
//            }
//        }
//        
//        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

