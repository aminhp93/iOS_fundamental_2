//
//  ViewController.swift
//  map_demo
//
//  Created by Minh Pham on 11/13/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        var latitude:CLLocationDegrees = 40.7
//        var longtitude:CLLocationDegrees = -73.9
//        var latDelta:CLLocationDegrees = 0.01
//        var longDelta:CLLocationDegrees = 0.01
//        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
//        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
//        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
//        map.setRegion(region, animated: true)
        
        var latitude:CLLocationDegrees = 43.095181
        var longtitude:CLLocationDegrees = -79.006424
        var latDelta:CLLocationDegrees = 0.05
        var longDelta:CLLocationDegrees = 0.05
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Niagra Fall"
        annotation.subtitle = "One day I'll go there"
        map.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
    }

    func action(gestureRecognizer: UIGestureRecognizer){
        print("Gestrure Recognized")
        
        var touchPoint = gestureRecognizer.locationInView(self.map)
        var newCoordinate:CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New Place"
        annotation.subtitle = "Second day"
        map.addAnnotation(annotation)
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

