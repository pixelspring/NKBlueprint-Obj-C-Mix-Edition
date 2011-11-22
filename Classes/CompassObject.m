//
//  CompassObject.m
//  NKCompass
//
//  Created by Can Durakci on 11/22/11.
//  Jazzbass 
//  Copyright (c) 2011 Unimedisys. All rights reserved. visit www.unimedisys.com 
//

#import "CompassObject.h"

@implementation CompassObject

@synthesize _parameters, _webView, _pageTitle, _lastReturnResult;


- (void) startlistening{
    
    
    locationController = [[CompassClass alloc] init];
    [locationController.locationManager startUpdatingHeading];  
    
}


- (void) stoplistening{
    
    [locationController.locationManager stopUpdatingHeading];
    
}

-(void)sendback{
    [_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) 
                               withObject:[NSString stringWithFormat:@"compasstext('%@');", locationController.locationManager.heading] waitUntilDone:NO];
}

#pragma mark -
#pragma mark automatic setter methods

- (void)setNKParameters:(NSDictionary*)parameters
{
	self._lastReturnResult = nil;
	self._parameters = parameters;
}

- (void)setNKCurrentPage:(NSString*)pageTitle
{
	self._pageTitle = pageTitle;
}

- (void)setNKWebView:(UIWebView*)webView
{
	self._webView = webView;
}

- (void) dealloc
{
	self._pageTitle = nil;
	self._parameters = nil;
	self._webView = nil;
	self._lastReturnResult = nil;
	[super dealloc];
}



@end

