//
//  CompassClass.m
//  NKCompass
//
//  Created by Can Durakci on 11/22/11.
//  Jazzbass 
//  Copyright (c) 2011 Unimedisys. All rights reserved. visit www.unimedisys.com 
//

#import "CompassClass.h"

@implementation CompassClass

@synthesize locationManager;


- (id) init {
    self = [super init];
    if (self != nil) {
        self.locationManager = [[[CLLocationManager alloc] init] autorelease];
        self.locationManager.delegate = self; // send loc updates to myself
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location: %@", [newLocation description]);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
	NSLog(@"Error: %@", [error description]);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    
	NSLog(@"New magnetic heading: %f", newHeading.magneticHeading);
	//NSLog(@"New true heading: %f", newHeading.trueHeading);
    
}


- (void) dealloc
{
    [self.locationManager release];
    
	[super dealloc];
}


@end
