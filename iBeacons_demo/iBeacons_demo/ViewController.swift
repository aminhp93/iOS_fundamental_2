//
//  ViewController.swift
//  iBeacons_demo
//
//  Created by Minh Pham on 11/24/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    var beaconRegion: CLBeaconRegion!
    var peripheralManager:CBPeripheralManager!
    
    var isBroadcasting = false
    var dataDictionary = NSDictionary()
    

    @IBOutlet weak var uuidField: UITextField!
    
    @IBOutlet weak var majorField: UITextField!
    
    @IBOutlet weak var minorField: UITextField!
    
    @IBOutlet weak var bluetoothStatusLabel: UILabel!
    
    @IBOutlet weak var beaconStatusLabel: UILabel!
    
    @IBOutlet weak var beaconButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.dismiss(animated:completion:))))
        
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
        
        uuidField.text = "8AF5672D-A7B9-4196-801D-72B29A6BC2B1"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkBroadcastState(){
        if !isBroadcasting{
            switch peripheralManager.state{
            case .poweredOn:
                self.startAdvertising()
                self.updateButtonTitle()
                self.updateBeaconStatus()
                break
            case .poweredOff:
                break
            case .resetting:
                break
            case .unauthorized:
                break
            case .unknown:
                break
            case .unsupported:
                break
            }
        } else {
            // We are broadcasting
            peripheralManager.stopAdvertising()
            isBroadcasting = false
            self.updateButtonTitle()
            self.updateBeaconStatus()
            
        }
    }
    
    func createBeaconRegion() -> CLBeaconRegion?{
        if let uuidString = uuidField.text{
            let uuid = UUID(uuidString: uuidString)!
            let major = Int(majorField.text!)!
            let minor = Int(minorField.text!)!
            
            return CLBeaconRegion(proximityUUID: uuid, major: CLBeaconMajorValue(major) , minor: CLBeaconMinorValue(minor), identifier: "com.agi.beacon")
        }
        return nil
        
    }
    
    
    func startAdvertising(){
        beaconRegion = self.createBeaconRegion()
        dataDictionary = beaconRegion.peripheralData(withMeasuredPower: nil)
        
        peripheralManager.startAdvertising(dataDictionary as! [String: Any])
        isBroadcasting = true
    }
    
    func updateButtonTitle(){
        if isBroadcasting{
            self.beaconButton.setTitle("Stop Broadcasting", for: .normal)
        } else {
            self.beaconButton.setTitle("Start Boardcasting", for: .normal)
        }
    }
    
    func updateBeaconStatus(){
        if isBroadcasting{
            bluetoothStatusLabel.text = "Broadcasting"
        } else {
            bluetoothStatusLabel.text = "Not Broadcasting"
        }
    }
    
    
    
    // CBPeripheraManagerDelegate
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            bluetoothStatusLabel.text = "Bluetooth powered on"
            break
        case .poweredOff:
            bluetoothStatusLabel.text = "Bluetooth powered off"
            break
        case .resetting:
            bluetoothStatusLabel.text = "Bluetooth resetting"
            break
        case .unauthorized:
            bluetoothStatusLabel.text = "Unauthorized"
            break
        case .unknown:
            bluetoothStatusLabel.text = "Unknown"
            break
        case .unsupported:
            bluetoothStatusLabel.text = "Unsupported"
            break
        }
    }
    
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style:.default, handler:nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    // Action
    
    @IBAction func startButtonPressed(_ sender: Any) {
        if uuidField.text == "" || majorField.text == "" || minorField.text == "" {
            self.showAlert(title: "Error", message: "Please complete all fields")
        } else {
            self.checkBroadcastState()
        }
    }
    
    func closeWindow(){
        if let presenter = self.presentingViewController{
            presenter.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    

}

