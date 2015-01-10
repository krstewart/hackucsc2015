//
//  location.swift
//  TeamFit
//
//  Created by Lman on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//


import CoreLocation
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    
var seenError : Bool = false
var locationFixAchieved : Bool = false
var locationStatus : NSString = "Not Started"

var locationManager: CLLocationManager!

override func viewDidLoad() {
    super.viewDidLoad()
}

func initLocationManager() {
    seenError = false
    locationFixAchieved = false
    locationManager = CLLocationManager()
    locationManager.delegate = self
 //   locationManager.locationServicesEnabled
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
}

func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    locationManager.stopUpdatingLocation()
   // if (error) {
    //    if (seenError == false) {
     //       seenError = true
      //      print(error)
       // }
    }
}

func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    if (locationFixAchieved == false) {
        locationFixAchieved = true
        var locationArray = locations as NSArray
        var locationObj = locationArray.lastObject as CLLocation
        var coord = locationObj.coordinate
        
        println(coord.latitude)
        println(coord.longitude)
    }
}

func locationManager(manager: CLLocationManager!,
    didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        var shouldIAllow = false
        
        switch status {
        case CLAuthorizationStatus.Restricted:
            locationStatus = "Restricted Access to location"
        case CLAuthorizationStatus.Denied:
            locationStatus = "User denied access to location"
        case CLAuthorizationStatus.NotDetermined:
            locationStatus = "Status not determined"
        default:
            locationStatus = "Allowed to location Access"
            shouldIAllow = true
        }
        NSNotificationCenter.defaultCenter().postNotificationName("LabelHasbeenUpdated", object: nil)
        if (shouldIAllow == true) {
            NSLog("Location to Allowed")
            // Start location services
            locationManager.startUpdatingLocation()
        } else {
            NSLog("Denied access: \(locationStatus)")
        }
}