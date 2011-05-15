//
//  ActivityIndicator.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 21/01/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "ActivityIndicator.h"


@implementation ActivityIndicator

- (void)showActivityIndicator {
	UIApplication* app = [UIApplication sharedApplication];
	
	app.networkActivityIndicatorVisible = YES;
    NSLog(@"INDICATOR-SHOWN"); 
}

- (void)hideActivityIndicator {
	UIApplication* app = [UIApplication sharedApplication];
	
	app.networkActivityIndicatorVisible = NO;
    NSLog(@"INDICATOR-HIDDEN");
	
}

@end
