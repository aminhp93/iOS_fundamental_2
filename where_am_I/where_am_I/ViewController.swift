//
//  ViewController.swift
//  where_am_I
//
//  Created by Minh Pham on 11/13/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager:CLLocationManager!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    
    @IBOutlet weak var longtitudeLabel: UILabel!
    
    @IBOutlet weak var courseLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var altitudeLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations)
        
        var userLocation:CLLocation = locations[0]
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        self.longtitudeLabel.text = "\(userLocation.coordinate.longitude)"
        
        self.courseLabel.text = "\(userLocation.course)"
        self.speedLabel.text = "\(userLocation.speed)"
        self.altitudeLabel.text = "\(userLocation.altitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {(placemarks, error) -> Void in
            if (error != nil){
                print(error)
            } else {
                
                let p = CLPlacemark(placemark: placemarks![0] as! CLPlacemark)
                print(p)
                var subThoroughfare:String = ""
                
                if (p.subThoroughfare != nil){
                    subThoroughfare = p.subThoroughfare!
                }
                self.addressLabel.text = "\(subThoroughfare) \(p.thoroughfare!) \n \(p.subAdministrativeArea!) \n \(p.subLocality!) \n \(p.postalCode!) \n \(p.country!)"
                
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

