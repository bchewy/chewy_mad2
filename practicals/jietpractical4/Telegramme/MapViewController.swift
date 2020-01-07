//
//  MapViewController.swift
//  Telegramme
//
//  Created by Brian Chew on 7/1/20.
//  Copyright © 2020 MAD2_P03. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class MapViewController : UIViewController {
    
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil
    
    @IBOutlet weak var map: MKMapView!
    let locationManager: CLLocationManager = {
        $0.requestWhenInUseAuthorization()
        $0.desiredAccuracy = kCLLocationAccuracyBest
        $0.startUpdatingLocation()
        $0.startUpdatingHeading()
        return $0
    }(CLLocationManager())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = locationDelegate
        
        locationDelegate.locationCallback = { location in
            self.latestLocation = location
            let lat = String(format: "Lat: %3.8f", location.coordinate.latitude)
            let long = String(format: "Long: %3.8f", location.coordinate.longitude)
            print("\(lat), \(long)")
            
            self.FindCurrentLocation(location: location)

        }
        GoToPoly()
    
    }
    
    
    let regionRadius: CLLocationDistance = 250
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion ( center: location.coordinate,
                                                    latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
        
    }
    
    func GoToPoly(){
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("535 Clementi Road Singapore 599489", completionHandler: {p,k in
        
        let initialLocation = CLLocation(latitude: p![0].location!.coordinate.latitude, longitude: p![0].location!.coordinate.longitude)
        self.centerMapOnLocation(location: initialLocation)
        
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = initialLocation.coordinate
        annotation.title = "Ngee Ann Polytechnic"
        annotation.subtitle = "School of ICT"
        self.map.addAnnotation(annotation)
        
        })
    }
    func FindCurrentLocation(location: CLLocation){
        let annotation_me:MKPointAnnotation = MKPointAnnotation()
        annotation_me.coordinate = location.coordinate
        annotation_me.title = "Me!"
        self.map.addAnnotation(annotation_me)
        
        self.centerMapOnLocation(location: location)
    }
    
}
