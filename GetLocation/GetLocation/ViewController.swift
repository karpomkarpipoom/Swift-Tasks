//
//  ViewController.swift
//  GetLocation
//
//  Created by BALAMURUGAN on 25/04/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var latValue     : UILabel!
    @IBOutlet weak var longValue    : UILabel!
    
    var locationManager = CLLocationManager()
    var CurrentLocation : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse){
            locationManager.startUpdatingLocation()
        }else{
            print("go to Setting page give permit")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last as! CLLocation
        
        let lat = location.coordinate.latitude
        let long = location.coordinate.longitude
        
        self.latValue.text = "lat value \(lat)"
        self.longValue.text = "Long value \(long)"
        
    }


}

