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

@synthesize _webView, result;

UILabel *label;
UISegmentedControl *segmentedControl;

- (void)showSegment
{

        // Quickly Create & Show a basic UILabel to display "SegmentWithTitle" titles
        label = [[UILabel alloc] init]; 
        label.frame = CGRectMake(10, 10, 300, 40);
        label.textAlignment = UITextAlignmentCenter;
        label.adjustsFontSizeToFitWidth=YES;
        label.text=@"Select An Option On The Segmented Control To Show It Here";
        [_webView addSubview:label];
    
      
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
[segmentedControl insertSegmentWithTitle: @"1" atIndex: 0 animated: YES];
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
[label release];
}



// ********************************************************************************************************
// Called when segment pressed, shows an alert or UILabel (currently UILabel, change with comments)
// TODO: Add method(s) to retrieve selected segment via Obj-C/.js Mix
// ********************************************************************************************************
- (void) segmentPressed:(id)sender{
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;

    label.text = [segmentedControl titleForSegmentAtIndex: [segmentedControl selectedSegmentIndex]];
	
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UISegmentedControl" message:@"Segment Pressed"
    //                                          delegate:self cancelButtonTitle:@"OK!" otherButtonTitles:nil];
    //[alert show];
    //[alert release];
}


// ********************************************************************************************************
// Trying to figure out how to add/remove via .js call... WIP!
// ********************************************************************************************************
/*
- (void) addSegment{
	[segmentedControl insertSegmentWithTitle: @"**" atIndex: ** animated: **];
}

- (void) removeSegment{
	[segmentedControl removeSegmentWithTitle: @"**" atIndex: ** animated: **];
}

 - (void) removeAllSegments{
    [segmentedControl removeAllSegments];
 }
*/ 
// ********************************************************************************************************


- (void) removeSegmentedControl{
	[segmentedControl removeFromSuperview];
    [label removeFromSuperview];    // If using the UILabel to show results, remove it also...
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
