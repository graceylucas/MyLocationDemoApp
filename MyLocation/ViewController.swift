//
//  ViewController.swift
//  MyLocation
//
//  Created by Mary Grace Lucas on 12/18/15.
//  Copyright © 2015 Mary Grace Lucas. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager: CLLocationManager!
    
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        manager = CLLocationManager()
        
        // Sets the delegate to be the view controller
        manager.delegate = self
        
        // Sets the best possible accuracy (might use more battery)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Requests permission to get user's location when app is in use
        manager.requestWhenInUseAuthorization()
        
        // Sets the manager up to monitor the location
        manager.startUpdatingLocation()
        
    }
    
    // Function creates an action that happens every time the location is updated
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)

        let userLocation:CLLocation = locations[0]
        
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        self.courseLabel.text = "\(userLocation.course)"
        self.speedLabel.text = "\(userLocation.speed)"
        self.altitudeLabel.text = "\(userLocation.altitude)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        // 
        
        
    }
    
    
}

