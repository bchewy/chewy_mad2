//
//  LocationDelegate.swift
//  Telegramme
//
//  Created by Brian Chew on 7/1/20.
//  Copyright © 2020 MAD2_P03. All rights reserved.
//

import CoreLocation
class LocationDelegate : NSObject, CLLocationManagerDelegate {
    
    var locationCallback: ((CLLocation) -> ())? = nil
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
    guard let currentLocation = locations.last else { return }
    locationCallback?(currentLocation)
    }
    
}
