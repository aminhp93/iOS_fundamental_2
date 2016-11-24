//
//  ViewController.swift
//  memorable_places
//
//  Created by Minh Pham on 11/13/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager: CLLocationManager!
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()

        } else {
            let laititude = NSString(string: places[activePlace]["lat"]!).doubleValue
            let longtitude = NSString(string: places[activePlace]["lon"]!).doubleValue
            var coordinate = CLLocationCoordinate2DMake(laititude, longtitude)
            
            var latDelta:CLLocationDegrees = 0.01
            var longDelta:CLLocationDegrees = 0.01
            var span = MKCoordinateSpanMake(latDelta, longDelta)
            
            var region = MKCoordinateRegionMake(coordinate, span)
            
            self.map.setRegion(region, animated: true)
            
            var annotation = MKPointAnnotation()
            
            
            annotation.coordinate = coordinate

            annotation.title = places[activePlace]["name"]

            self.map.addAnnotation(annotation)

        }
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2.0
        map.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer:UIGestureRecognizer){
        if gestureRecognizer.state == UIGestureRecognizerState.Began{
            var touchPoint = gestureRecognizer.locationInView(self.map)
            var newCoordiante = self.map.convertPoint(touchPoint, toCoordinateFromView: self.map)
            
            let a = newCoordiante.latitude
            let b = newCoordiante.longitude
            
            var location = CLLocation(latitude: a, longitude: b)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                var title = ""
                
                if (error == nil){
                    if let p = placemarks?[0]{
                        var subThoroughfare:String = ""
                        var thoroughfare:String = ""
                        
                        if p.subThoroughfare != nil {
                            subThoroughfare = p.subThoroughfare!
                        }
                        
                        if p.thoroughfare != nil{
                            thoroughfare = p.thoroughfare!
                        }
                        
                        title = "\(subThoroughfare) \(thoroughfare)"
                        
                    }
                }
                
                if title == ""{
                    title = "Added \(NSDate())"
                }
                print(places)
                places.append(["name":title, "lat": "\(a)", "lon": "\(b)"])
                print(places)
                
                var annotation = MKPointAnnotation()
                annotation.coordinate = newCoordiante
                annotation.title = title
                self.map.addAnnotation(annotation)
            })
        }
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        var userLocation:CLLocation = locations[0]
        
        var laititude = userLocation.coordinate.latitude
        var longtitude = userLocation.coordinate.longitude
        var coordinate = CLLocationCoordinate2DMake(laititude, longtitude)
        
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        var span = MKCoordinateSpanMake(latDelta, longDelta)
        
        var region = MKCoordinateRegionMake(coordinate, span)
        
        self.map.setRegion(region, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

