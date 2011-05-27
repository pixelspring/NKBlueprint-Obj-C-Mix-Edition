//
//  segment.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 24/05/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//  http://developer.apple.com/library/ios/#documentation/uikit/reference/UISegmentedControl_Class/Reference/UISegmentedControl.html
//

#import "segment.h"


@implementation segment

@synthesize _webView;

UISegmentedControl *segmentedControl;

- (void)showSegment
{
// ********************************************************************************************************
// Set up the Segmented Control
// ********************************************************************************************************     

segmentedControl = [[UISegmentedControl alloc] initWithFrame: CGRectMake(35, 100, 250, 30)];
//[segmentedControl setAlpha:0.2];    // Set Alpha value (transparancy) if you so desire



// ********************************************************************************************************
// Choose a style for your Segmented Control. "Bar" & "Bezeled" can be tinted
// ******************************************************************************************************** 
segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;          // Large Plain Style (default)
//segmentedControl.segmentedControlStyle = UISegmentedControlStyleBordered;     // Large Bordered Style
//segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;          // Small Toolbar Style. Can have tint.
//segmentedControl.segmentedControlStyle = UISegmentedControlStyleBezeled;      // Large Bezeled Style. Can have tint.



// ********************************************************************************************************
// Lets add some items. Segments can have either Title(text) or Image, but not both. Animated = YES or NO
// ********************************************************************************************************                                       

// Plain ol' text
[segmentedControl insertSegmentWithTitle: @"One" atIndex: 0 animated: YES];
[segmentedControl insertSegmentWithTitle: @"2" atIndex: 1 animated: YES];

// Images
[segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"bug24.png"] atIndex:2 animated:YES];
[segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"brush24.png"] atIndex:3 animated:YES];
[segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"dashboard24.png"] atIndex:4 animated:YES];

segmentedControl.selectedSegmentIndex = 2; // Show Segment as default. NB - Index starts from 0, not 1!
// ********************************************************************************************************                                         



[segmentedControl addTarget:self action:@selector(segmentPressed:) forControlEvents:UIControlEventValueChanged];



// Add the Segmented Control to your webView
[_webView addSubview: segmentedControl];
[segmentedControl release];
}



// ********************************************************************************************************
// Called when segment pressed, send selected segment via Obj-C/.js Mix
// Using the correct String Format Specifier makes all the difference ;) 
// http://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
// ********************************************************************************************************

- (void) segmentPressed:(id)sender{
 UISegmentedControl *segmentedControl = (UISegmentedControl *)sender; 
 NSString *segSelected = [NSString stringWithFormat:@"%d", segmentedControl.selectedSegmentIndex];
 [_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:[NSString stringWithFormat:@"segmentUpdated('%@');", segSelected] waitUntilDone:NO];
 }


// ********************************************************************************************************
// Need to figure out how to add/remove via .js call... WIP!
// ********************************************************************************************************
/*
- (void) addSegment{
	[segmentedControl insertSegmentWithTitle: @"*?*" atIndex: *?* animated: YES];
}

- (void) removeSegment{
	[segmentedControl removeSegmentWithTitle: @"*?*" atIndex: *?* animated: YES];
}

 - (void) removeAllSegments{
    [segmentedControl removeAllSegments];
 }
*/ 
// ********************************************************************************************************


// ********************************************************************************************************
// Remove the segment
// ********************************************************************************************************
- (void) removeSegmentedControl{
	[segmentedControl removeFromSuperview];
}




#pragma mark -
#pragma mark automatic setter methods

- (void)setNKWebView:(UIWebView*)webView
{
	self._webView = webView;
}

- (void) dealloc
{
	self._webView = nil;
	[super dealloc];
}



@end
