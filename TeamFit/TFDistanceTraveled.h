//
//  TFDistanceTraveled.h
//  TeamFit
//
//  Created by Lman on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface TFDistanceTraveled : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>{
    NSMutableArray *locationStack;
    NSArray *pair;
 
}

//declaring with @Property makes them public
@property (strong,nonatomic) NSString *userLocationAddress;
@property (strong,nonatomic) NSString *userLatitude;
@property (strong,nonatomic) NSString *userLongitude;
@property (strong,nonatomic) NSString *userCity;
@property (nonatomic) NSInteger userZipCode;

-(void)loadLocation:(bool) start;
-(NSString *)doVelocity:(bool) start;



@end