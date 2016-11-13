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
        
        var latitude:CLLocationDegrees = 43.0013
        var longtitude:CLLocationDegrees = -79.324
        var latDelta:CLLocationDegrees = 0.05
        var longDelta:CLLocationDegrees = 0.05
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

