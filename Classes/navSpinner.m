//
//  navSpinner.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 17/05/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "navSpinner.h"


@implementation navSpinner

- (void)showSpinner {

    UINavigationController *controller = [[NSClassFromString(@"NKBridge") sharedInstance]
    navigationControllerForPage:@"main.html"];
    
    UIActivityIndicatorView *activityIndicator = 
    [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    UIBarButtonItem * barButton = 
    [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
    
    // Set to Left or Right
    [[self navigationItem] setRightBarButtonItem:barButton];
    
    [barButton release];
    [activityIndicator startAnimating];
    
    
    
}

@end