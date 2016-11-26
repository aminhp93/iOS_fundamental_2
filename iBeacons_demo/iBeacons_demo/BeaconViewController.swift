//
//  BeaconViewController.swift
//  iBeacons_demo
//
//  Created by Minh Pham on 11/24/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth


class BeaconViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var uuidLabel: UILabel!
    
    @IBOutlet weak var majorLabel: UILabel!
    
    @IBOutlet weak var minorLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rangingButton: UIButton!
    
    var beaconRegion:CLBeaconRegion!
    var locationManager:CLLocationManager!
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case .authorizedAlways:
            print("Authorized")
            break
        case .authorizedWhenInUse:
            break
        case .denied:
            print("Denied")
            break
        case .notDetermined:
            break
        case .restricted:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        locationManager.requestState(for: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        if state == .inside {
            locationManager.startRangingBeacons(in: beaconRegion)
        } else {
            locationManager.stopRangingBeacons(in: beaconRegion)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Beacon region entered \(region)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Beacon region exited \(region)")
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        //
        
        if beacons.count > 0{
            self.updateStatusLabels(beacons: beacons)
            locationManager.stopRangingBeacons(in: region)
            self.updateButtonTitle()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("Error \(error)")
        
    }
    
    func locationManager(_ manager: CLLocationManager, rangingBeaconsDidFailFor region: CLBeaconRegion, withError error: Error) {
        print("Error \(error)")
    }
    
    // MARK: Helpers
    
    func getProximityString(proximity: CLProximity) -> String{
        switch proximity{
        case .immediate:
            return "Immediate"
        case .near:
            return "Near"
        case .far:
            return "Far"
        case .unknown:
            return "Unknown"
        }
    }
    
    
    
    
    // MARK: Main
    
    func initializedLocationManager(callback: (Bool) -> Void){
        if CLLocationManager.authorizationStatus() == .authorizedAlways{
            //Granted
            locationManager = CLLocationManager()
            locationManager.delegate = self
            
            
            let uuid = UUID(uuidString: "A98DD195-4C42-4DE8-859D-66E462CD2F86")! as UUID
            beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: "com.agi.beacon")
            beaconRegion.notifyOnEntry = true
            beaconRegion.notifyOnExit = true
            
            locationManager.startMonitoring(for: beaconRegion)
            locationManager.startUpdatingLocation()
            
            callback(true)
            
        } else {
            
            //Request access
            callback(false)
        }
    }
    
    
    func toggleDiscovery(){
        if !isSearching {
            self.initializedLocationManager(callback: { (success) in
                if success {
                    isSearching = true
                } else {
                    locationManager.requestAlwaysAuthorization()
                }
            })
        } else {
            locationManager.stopMonitoring(for: beaconRegion)
            locationManager.stopRangingBeacons(in: beaconRegion)
            locationManager.stopUpdatingLocation()
            isSearching = false
            
        }
    }
    
    func updateStatusLabels(beacons:[CLBeacon]){
        let beacon = beacons[0] as CLBeacon
        uuidLabel.text = beacon.proximityUUID.uuidString
        majorLabel.text = "Major \(beacon.major.stringValue)"
        minorLabel.text = "Minor \(beacon.minor.stringValue)"
        
        let accuracy = String(format: "%.2f", beacon.accuracy)
        
        statusLabel.text = "Beacon found is \(self.getProximityString(proximity: beacon.proximity)), it is \(accuracy)m away"
        
        
        uuidLabel.isHidden = false
        majorLabel.isHidden = false
        minorLabel.isHidden = false
        
    }
    
    func updateButtonTitle(){
        if isSearching {
            self.rangingButton.setTitle("Stop Ranging", for: .normal)
        } else {
            self.rangingButton.setTitle("Start Ranging", for: .normal)
        }
    }
    
    
    // MARK: Actions
    
    
    @IBAction func startButtonPressed(_ sender: Any) {
        self.toggleDiscovery()
        self.updateButtonTitle()
    }
    
    
}
