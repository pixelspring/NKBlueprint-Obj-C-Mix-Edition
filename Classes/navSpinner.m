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

@synthesize _navigationController, webView, _currentPage;


- (void)setNKCurrentPage:(NSString*)pageTitle {
	self._currentPage = pageTitle;
	self._navigationController = [[NSClassFromString(@"NKBridge") sharedInstance] navigationControllerForPage:self._currentPage];
}


- (void)showNavSpinner {
	UIView *activityView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 33, 20)] autorelease]; // add spinner via view so its position can be tuned. use the third value in CGRectMake to fine tune the horizontal position of the spinner
	UIActivityIndicatorView *navSpin = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)] autorelease];
	[activityView addSubview:navSpin];
	[navSpin startAnimating];
	self._navigationController.visibleViewController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:activityView] autorelease];
}

@end

// TO REMOVE THE SPINNER:
// Use 
// yourNavControllerVarName.removeNavigationItem()