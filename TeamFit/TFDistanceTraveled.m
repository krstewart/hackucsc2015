//
//  TFDistanceTraveled.m
//  TeamFit
//
//  Created by Lman on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFDistanceTraveled.h"

@interface TFDistanceTraveled ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) CLPlacemark *placemark;


@end

@implementation TFDistanceTraveled

-(NSString *)getUserCoordinates{
    return self.userLocationAddress;
}
-(NSString *)doVelocity:(bool) start{
    [self loadLocation:start];
    return self.userLatitude;
    
}

- (void)loadLocation:(bool) start{ //inititates the location protocol
    self.locationManager = [[CLLocationManager alloc] init];
    self.geocoder = [[CLGeocoder alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
    if(start == false){
        [self.locationManager stopUpdatingLocation];

    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        self.userLongitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.userLatitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        NSLog(@"Longitude is %@\n, and latitude is %@\n",self.userLongitude,self.userLatitude);
        
    }
    //will need to check if usr moves thou
    
    NSLog(@"Resolving the Address");
    [self.geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        //  NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            self.placemark = [placemarks lastObject];
            self.userLocationAddress = [NSString stringWithFormat:@"%@ %@\n%@\n%@",
                                        //self.placemark.subThoroughfare, self.placemark.thoroughfare,
                                        self.placemark.postalCode, self.placemark.locality,
                                        self.placemark.administrativeArea,
                                        self.placemark.country];
            self.userCity = self.placemark.locality;
            self.userZipCode = self.placemark.postalCode.integerValue;
            //the placemark object extracts geolocation data from location manager
            NSLog(@"the formatted string is %@", self.userLocationAddress);
        } else {
            //    NSLog(@"%@", error.debugDescription);
        }
    } ];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error //checks failure messages
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}
@end
