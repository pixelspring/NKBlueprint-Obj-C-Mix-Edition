//
//  gestures.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 15/03/2012.
//  Copyright (c) 2012 Mike Seaby. All rights reserved.
//

#import "gestures.h"

@implementation gestures

@synthesize _parameters, _webView, _pageTitle, _lastReturnResult;

- (void)showGestureView 
{
	// -----------------------------------------------------------------------------------------------------
	// Create & show a basic UIImageView
	// -----------------------------------------------------------------------------------------------------
	CGRect myImageRect = CGRectMake(0.0f, 65.0f, 320.0f, 250.0f);
	UIImageView *swipePadImage = [[UIImageView alloc] initWithFrame:myImageRect];
	[swipePadImage setImage:[UIImage imageNamed:@"swipePad.png"]];
	swipePadImage.opaque = YES; // Set to be explicitly opaque for performance
	
	// We need to enable multipleTouch & interactionEnabled for the UIImageView as they default to NO
	[swipePadImage setMultipleTouchEnabled:YES];
	[swipePadImage setUserInteractionEnabled:YES];
	
	// Add the imageView to our NK webView
	[_webView addSubview:swipePadImage];
	[swipePadImage release];
	
	
	
	// *****************************************************************************************************
	//	SET UP GESTURE RECOGNIZERS:
	// *****************************************************************************************************
	//	Here we'll set up the code to capture taps, swipes, rotates etc
	//	
	//	In this case I'm applying gestures to the webView. So in theory, all gestures will be detected over
	//	the entire webView area rather than just our imageview that we created. However, as the webView is
	//	in essence a scrollView, it only captures l/r swipes and pinch/rotations - ie. not vertical swipes.
	//
	//	But if we disable touch events on the web page with the trusty:
	//	*** document.ontouchmove = function(event){event.preventDefault();} ***
	//	we can then limit gesture recognition to our imageView.
	//
	//	Apple Dev Docs reference for more info:
	//	https://developer.apple.com/library/IOs/#documentation/UIKit/Reference/UIGestureRecognizer_Class/Reference/Reference.html#//apple_ref/occ/cl/UIGestureRecognizer
	// *****************************************************************************************************
	
	// -----------------------------------------------------------------------------------------------------
	// One finger, two taps
	// -----------------------------------------------------------------------------------------------------
	
	// Create gesture recognizer & get it to call a selector method
	UITapGestureRecognizer *oneFingerTwoTaps = 
	[[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps)] autorelease];
	
	// Set required amount of taps and touches
	[oneFingerTwoTaps setNumberOfTapsRequired:2];
	[oneFingerTwoTaps setNumberOfTouchesRequired:1];
	
	// Add the gesture to the view (see note above)
	[[self _webView] addGestureRecognizer:oneFingerTwoTaps];
	
	
	
	// -----------------------------------------------------------------------------------------------------
	// Two fingers, two taps
	// -----------------------------------------------------------------------------------------------------
	UITapGestureRecognizer *twoFingersTwoTaps = 
	[[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingersTwoTaps)] autorelease];
	[twoFingersTwoTaps setNumberOfTapsRequired:2];
	[twoFingersTwoTaps setNumberOfTouchesRequired:2];
	[[self _webView] addGestureRecognizer:twoFingersTwoTaps];
	
	// -----------------------------------------------------------------------------------------------------
	// One finger, swipe up
	// -----------------------------------------------------------------------------------------------------
	UISwipeGestureRecognizer *oneFingerSwipeUp = 
	[[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeUp:)] autorelease];
	[oneFingerSwipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
	[[self _webView] addGestureRecognizer:oneFingerSwipeUp];
	
	// -----------------------------------------------------------------------------------------------------
	// One finger, swipe down
	// -----------------------------------------------------------------------------------------------------
	UISwipeGestureRecognizer *oneFingerSwipeDown = 
	[[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeDown:)] autorelease];
	[oneFingerSwipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
	[[self _webView] addGestureRecognizer:oneFingerSwipeDown];
	
	// -----------------------------------------------------------------------------------------------------
	// One finger, swipe right
	// -----------------------------------------------------------------------------------------------------
	UISwipeGestureRecognizer *oneFingerSwipeRight = 
	[[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeRight:)] autorelease];
	[oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
	[[self _webView] addGestureRecognizer:oneFingerSwipeRight];
	
	// -----------------------------------------------------------------------------------------------------
	// One finger, swipe left
	// -----------------------------------------------------------------------------------------------------
	UISwipeGestureRecognizer *oneFingerSwipeLeft = 
	[[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeLeft:)] autorelease];
	[oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
	[[self _webView] addGestureRecognizer:oneFingerSwipeLeft];
	
	// -----------------------------------------------------------------------------------------------------
	// Two finger rotate  
	// -----------------------------------------------------------------------------------------------------
	UIRotationGestureRecognizer *twoFingersRotate = 
	[[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingersRotate:)] autorelease];
	[[self _webView] addGestureRecognizer:twoFingersRotate];
	
	// -----------------------------------------------------------------------------------------------------
	// Two finger pinch
	// -----------------------------------------------------------------------------------------------------
	UIPinchGestureRecognizer *twoFingerPinch = 
	[[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerPinch:)] autorelease];
	[[self _webView] addGestureRecognizer:twoFingerPinch];
	
}



// *****************************************************************************************************
//	SELECTOR METHODS:
//	Here we get the captured gestures to do something!
// *****************************************************************************************************
// -----------------------------------------------------------------------------------------------------
//	One finger, two taps 
// -----------------------------------------------------------------------------------------------------
- (void)oneFingerTwoTaps
{
	NSLog(@"Action: One finger, two taps");
	[_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:[NSString stringWithFormat:@"whatGesture('One Finger Two Taps');"] waitUntilDone:NO];
}

// -----------------------------------------------------------------------------------------------------
//	Two fingers, two taps
// -----------------------------------------------------------------------------------------------------
- (void)twoFingersTwoTaps {
	NSLog(@"Action: Two fingers, two taps");
	[_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) 
							   withObject:[NSString stringWithFormat:@"whatGesture('Two Fingers Two Taps');"] waitUntilDone:NO];
} 

// -----------------------------------------------------------------------------------------------------
//	One finger, swipe up
// -----------------------------------------------------------------------------------------------------
- (void)oneFingerSwipeUp:(UISwipeGestureRecognizer *)recognizer 
{ 
	CGPoint point = [recognizer locationInView:[self _webView]];
	NSLog(@"Swipe up - start location: %f,%f", point.x, point.y);
	[_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) 
                               withObject:[NSString stringWithFormat:@"whatGesture('oneFingerSwipeUp Start: %f End: %f');", point.x, point.y] waitUntilDone:NO];
}

// -----------------------------------------------------------------------------------------------------
//	One finger, swipe down
// -----------------------------------------------------------------------------------------------------
- (void)oneFingerSwipeDown:(UISwipeGestureRecognizer *)recognizer 
{ 
	CGPoint point = [recognizer locationInView:[self _webView]];
	NSLog(@"Swipe down - start location: %f,%f", point.x, point.y);
	[_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) 
                               withObject:[NSString stringWithFormat:@"whatGesture('oneFingerSwipeDown Start: %f End: %f');", point.x, point.y] waitUntilDone:NO];
}

// -----------------------------------------------------------------------------------------------------
//	One finger, swipe right
// -----------------------------------------------------------------------------------------------------
- (void)oneFingerSwipeRight:(UISwipeGestureRecognizer *)recognizer 
{ 
	CGPoint point = [recognizer locationInView:[self _webView]];
	NSLog(@"Swipe right - start location: %f,%f", point.x, point.y);
	[_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) 
                               withObject:[NSString stringWithFormat:@"whatGesture('oneFingerSwipeRight Start: %f End: %f');", point.x, point.y] waitUntilDone:NO];
}

// -----------------------------------------------------------------------------------------------------
//	One finger, swipe left
// -----------------------------------------------------------------------------------------------------
- (void)oneFingerSwipeLeft:(UISwipeGestureRecognizer *)recognizer 
{ 
	CGPoint point = [recognizer locationInView:[self _webView]];
	NSLog(@"Swipe left - start location: %f,%f", point.x, point.y);
	[_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) 
                               withObject:[NSString stringWithFormat:@"whatGesture('oneFingerSwipeLeft Start: %f End: %f');", point.x, point.y] waitUntilDone:NO];
}

// -----------------------------------------------------------------------------------------------------
//	Two finger rotate   
// -----------------------------------------------------------------------------------------------------
- (void)twoFingersRotate:(UIRotationGestureRecognizer *)recognizer 
{
	// Convert the radian value to show the degree of rotation
	NSLog(@"Rotation in degrees since last change: %f", ([recognizer rotation] * 180) / M_PI);
	[_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) 
                               withObject:[NSString stringWithFormat:@"whatGesture('twoFingersRotate: Rotation in degrees since last change: %f');", ([recognizer rotation] * 180) / M_PI] waitUntilDone:NO];
}

// -----------------------------------------------------------------------------------------------------
//	Two finger pinch
// -----------------------------------------------------------------------------------------------------
- (void)twoFingerPinch:(UIPinchGestureRecognizer *)recognizer 
{
	NSLog(@"Pinch scale: %f", recognizer.scale);
	[_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) 
                               withObject:[NSString stringWithFormat:@"whatGesture('twoFingerPinch Scale: %f');", recognizer.scale] waitUntilDone:NO];
}

- (void)dealloc 
{
	[super dealloc];
}


#pragma mark NK Setter Methods

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

@end
