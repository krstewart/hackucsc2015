//
//  DistanceTraveled.swift
//  TeamFit
//
//  Created by Lman on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//

import CoreLocation
import Foundation
class DistanceTraveled: NSObject {

let locationManager:CLLocationManager = CLLocationManager()
func checkLocation(){
     locationManager.startUpdatingLocation()

}

  //  var speedReceived:Double = 0
    
func checkLocation(){
  
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        let authstate = CLLocationManager.authorizationStatus()
        if(authstate == CLAuthorizationStatus.NotDetermined){
            println("Not Authorised")
            locationManger.requestWhenInUseAuthorization()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!){
        var location:CLLocation = locations[locations.count - 1] as CLLocation
        if(location.horizontalAccuracy > 0){
            self.speedReceived = location.speed
            println(self.speedReceived)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Couldn't get your location")
    }

}

