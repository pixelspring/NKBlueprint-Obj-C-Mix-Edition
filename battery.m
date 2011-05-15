//
//  battery.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 22/01/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "battery.h"

@implementation battery

@synthesize result;

- (void)getBatteryLevel
{
	UIDevice *myDevice = [UIDevice currentDevice];
	[myDevice setBatteryMonitoringEnabled:YES];
	float batLeft = [myDevice batteryLevel] * 100;
    self.result = [NSString stringWithFormat:@"%f %%",batLeft]; 
	
	
	//UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Battery" message:[NSString stringWithFormat:@"Battery at: %f %%",batLeft] delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
	//[alert show];
	//[alert release];
}

- (NSString*)methodResult
{
    return self.result;
}

@end
