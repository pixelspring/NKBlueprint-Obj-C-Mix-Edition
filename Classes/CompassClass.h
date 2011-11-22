//
//  CompassClass.h
//  NKCompass
//
//  Created by Can Durakci on 11/22/11.
//  Jazzbass 
//  Copyright (c) 2011 Unimedisys. All rights reserved. visit www.unimedisys.com 
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface CompassClass : NSObject <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
    
    
}

@property (nonatomic, retain) CLLocationManager *locationManager;


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;


@end
