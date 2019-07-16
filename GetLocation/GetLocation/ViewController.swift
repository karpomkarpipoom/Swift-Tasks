//
//  ViewController.swift
//  GetLocation
//
//  Created by BALAMURUGAN on 25/04/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var latValue     : UILabel!
    @IBOutlet weak var longValue    : UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var CurrentLocation : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coordin = mapView.userLocation.location?.coordinate {
            print(coordin)
            mapView.setCenter(coordin, animated: true)
        }
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse){
            locationManager.startUpdatingLocation()
        }else{
            print("go to Setting page give permit")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last as! CLLocation
        
        let location2D : CLLocationCoordinate2D = (manager.location?.coordinate)!
        
        let lat = location.coordinate.latitude as Double
        let long = location.coordinate.longitude as Double
        
        self.latValue.text = "lat value \(lat)"
        self.longValue.text = "Long value \(long)"
        
        let coordin = MKCoordinateSpan.init(latitudeDelta: lat, longitudeDelta: long)
        let region = MKCoordinateRegion.init(center: location2D, span: coordin)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location2D
        annotation.title = "MY LOCATION"
        annotation.subtitle = "find me"
        
        mapView.addAnnotation(annotation)
        
    }


}

