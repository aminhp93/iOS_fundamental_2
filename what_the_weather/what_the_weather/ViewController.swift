//
//  ViewController.swift
//  what_the_weather
//
//  Created by Minh Pham on 11/13/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var cityTextField: UITextField!

    @IBAction func findWeather(sender: AnyObject) {
        let url = NSURL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){(data, response, error) -> Void in
            if let urlContent = data {
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                
                let websiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                if websiteArray!.count > 1{
                    
                    let weatherArray = websiteArray![1].componentsSeparatedByString("</span>")
                    
                    
                    if weatherArray.count > 1{
                        let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        print(weatherSummary)
                        dispatch_async(dispatch_get_main_queue(), {() -> Void in
                            self.resultLabel.text = weatherSummary
                        })
                    }
                }
            }
        }
        task.resume()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

