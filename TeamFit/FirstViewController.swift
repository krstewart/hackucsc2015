//
//  FirstViewController.swift
//  TeamFit
//
//  Created by Patrick Mathieu on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//
import UIKit
import CoreLocation
import MapKit
import CoreMotion

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var runSwitch: UISwitch!
    
    @IBOutlet weak var mphLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    var locationManager: CLLocationManager?
    var  latitude = ""
    var  longitude = ""
    var  locationStack: [String] = []
    var  startTime = NSTimeInterval()
    var  time = 0
   

    var  distanceTraveled = 0
    
    func getVelocity(start: Bool){
        //start = runSwitch.
       // var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
        if start == false{
            locationManager?.stopUpdatingLocation();
            print("location is fin")
          //  timer.invalidate()
        }
        else{
          print(locationStack.count);
          
            

        }
    }
    func result() {
       self.time++
       print(time)
    
    }
    func switchIsChanged(mySwitch: UISwitch) {
        if mySwitch.on {
          getVelocity(true)
        } else {
          getVelocity(false)
        }
    }
    func locationManager(manager: CLLocationManager!,
        didUpdateToLocation newLocation: CLLocation!,
        fromLocation oldLocation: CLLocation!){
            if (oldLocation != nil) {
                var gpsSpeed = newLocation.speed
                var distanceChange = newLocation.distanceFromLocation(oldLocation)
                var sinceLastUpdate = newLocation.timestamp.timeIntervalSinceDate(oldLocation.timestamp)
                var calculatedSpeed = distanceChange / sinceLastUpdate
                var mphSpeed = calculatedSpeed * 2.2369
                
                print(NSString(format:"you are moving at %.2f m/s \n",calculatedSpeed))
                speedLabel.text = (NSString(format: "You are moving at %.2f m/s \n", calculatedSpeed))
                mphLabel.text = (NSString(format: "You are moving at %.2f mph \n", mphSpeed))
             //  let CLLocationDistance distanceChange = newLocation.distanceFromLocation(oldLocation)
               // CLLocationDistance distanceChange = newLocation.distanceFromLocation(oldLocation)
                
      //          NSTimeInterval sinceLastUpdate = newLocation.timestamp.timeIntervalSinceDate(oldLocation.timestamp)
       //         double calculatedSpeed = distanceChange / sinceLastUpdate;
            }
            latitude = "\(newLocation.coordinate.latitude)"
            longitude = "\(newLocation.coordinate.longitude)"
            var locationPair = [latitude,longitude];
            locationStack += locationPair
            println("Latitude = \(newLocation.coordinate.latitude)")
            println("Longitude = \(newLocation.coordinate.longitude)")
            
    }
    func accelData(){
        let motionManager: CMMotionManager = CMMotionManager()
        if (motionManager.accelerometerAvailable) {
        
        
        }

    }
    
    func locationManager(manager: CLLocationManager!,
        didFailWithError error: NSError!){
            println("Location manager failed with error = \(error)")
    }
    
    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus){
            
            print("The authorization status of location services is changed to: ")
            
            switch CLLocationManager.authorizationStatus(){
            case .Authorized:
                println("Authorized")
            case .AuthorizedWhenInUse:
                println("Authorized when in use")
            case .Denied:
                println("Denied")
            case .NotDetermined:
                println("Not determined")
            case .Restricted:
                println("Restricted")
            default:
                println("Unhandled")
            }
            
    }
    
    func displayAlertWithTitle(title: String, message: String){
        let controller = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        
        controller.addAction(UIAlertAction(title: "OK",
            style: .Default,
            handler: nil))
        
        presentViewController(controller, animated: true, completion: nil)
        
    }
    
    func createLocationManager(#startImmediately: Bool){
        locationManager = CLLocationManager()
        if let manager = locationManager{
            println("Successfully created the location manager")
            manager.delegate = self
            if startImmediately{
                manager.startUpdatingLocation()
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.getVelocity(true);
        /* Are location services available on this device? */
        if CLLocationManager.locationServicesEnabled(){
            
            /* Do we have authorization to access location services? */
            switch CLLocationManager.authorizationStatus(){
            case .Authorized:
                /* Yes, always */
                createLocationManager(startImmediately: true)
            case .AuthorizedWhenInUse:
                /* Yes, only when our app is in use */
                createLocationManager(startImmediately: true)
            case .Denied:
                /* No */
                displayAlertWithTitle("Not Determined",
                    message: "Location services are not allowed for this app")
            case .NotDetermined:
                /* We don't know yet, we have to ask */
                createLocationManager(startImmediately: false)
                if let manager = self.locationManager{
                    manager.requestWhenInUseAuthorization()
                }
            case .Restricted:
                /* Restrictions have been applied, we have no access
                to location services */
                displayAlertWithTitle("Restricted",
                    message: "Location services are not allowed for this app")
            }
            
            
        } else {
            /* Location services are not enabled.
            Take appropriate action: for instance, prompt the
            user to enable the location services */
            println("Location services are not enabled")
        }
    }
    
}

