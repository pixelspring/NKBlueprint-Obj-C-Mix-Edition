//
//  navSpinner.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 17/05/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "navSpinner.h"
#import "NKBridge.h"

@implementation navSpinner

@synthesize _navigationController, webView, currentPage;

/*
- (void)setNKCurrentPage:(NSString*)pageTitle {
	self._thisPage = pageTitle;
	self._navigationController = [[NSClassFromString(@"NKBridge") sharedInstance] navigationControllerForPage:self._thisPage];
}
*/

/*
- (void)showSpinner {
    // Blah *****
    navController = [[NSClassFromString(@"NKBridge") sharedInstance]navigationControllerForPage:@"main.html"];
    
	UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
    
	navController.visibleViewController.navigationItem.rightBarButtonItem = barButton;
    
    [barButton release];
    [activityIndicator startAnimating];
    [activityIndicator release];
    // Blah *****
    
    
    UIView *activityView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 33, 20)] autorelease];
    UIActivityIndicatorView *activityIndicator = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)] autorelease];
    [activityView addSubview:activityIndicator];
    [activityIndicator startAnimating];
    self._navigationController.visibleViewController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:activityView] autorelease];
    
}
*/


- (void)showSpinner {
	
	UINavigationController *controller = [[NKBridge sharedInstance] navigationControllerForPage:self.currentPage];

	UIView *activityView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 33, 20)] autorelease]; // add spinner via view so its position can be tuned. use the third value in CGRectMake to fine tune the horizontal position of the spinner
	UIActivityIndicatorView *activityIndicator = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)] autorelease];
	[activityView addSubview:activityIndicator];
	[activityIndicator startAnimating];
	self._navigationController.visibleViewController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:activityView] autorelease];
}


- (void)stopSpinner {
    
    /*
    [[self navController] setRightBarButtonItem:nil];
    navController.visibleViewController.navigationItem.rightBarButtonItem;nil;
    [activityIndicator stopAnimating];
    [activityIndicator release];*/
    //[activityIndicator removeFromSuperView];
    
    self._navigationController.visibleViewController.navigationItem.rightBarButtonItem = nil;
}

@end