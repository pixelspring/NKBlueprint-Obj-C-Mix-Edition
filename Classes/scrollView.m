//
//  scrollView.m
//  NKBlueprint Obj-C
//
//  Created by Mike Seaby on 15/01/2012.
//  Copyright (c) 2012 Mike Seaby. All rights reserved.
//

#import "scrollView.h"

@implementation scrollView

@synthesize _parameters, _webView, _pageTitle, _lastReturnResult;

-(void) showScrollView {
	
	NSLog(@"Scroll View Called");
	
	
	NSArray *_textArray = [[NSArray alloc] initWithObjects:@"Alpha", @"Bravo\nThis Is A New Line", @"Charlie", @"Delta", @"Echo", @"Foxtrot", @"Golf", @"Hotel", @"India", @"Juliet", @"Kilo", nil];
	
	NSLog(@"There are #%d UILabels in this scrollView",[_textArray count]);
	
	
	// Create a frame that will fit the width of the screen and is 80px high
    CGRect frame = CGRectMake(0, 0, 320, 80);
    
    // Maximum pages, this is used to determine our scroll view size below
	int viewCount = [_textArray count];
	
    // Set up a UIScrollView with the frame we set up previously
	
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
	scrollView.contentSize = CGSizeMake(320 *viewCount, 80);
	
	scrollView.pagingEnabled = YES;										// "Snap" to section
	scrollView.bounces = YES;											// Do you want to "bounce" the scrollView when reaching the end?
	scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;		// Can be "Default", Black" or "White"
	
    // Iterate through our max number of pages and create a UIView
    // Set the origin of the new UIView to be 320 (width of the screen) x the iteration count
    // This creates a separate view for each "page"
	
	for (int i=0; i<viewCount; i++) {
		CGRect f = CGRectMake(i*320, 0, 320, 80);
		UIView *view = [[UIView alloc] initWithFrame:f];
		if(i%2)
			view.backgroundColor = [UIColor cyanColor];
		else
			view.backgroundColor = [UIColor magentaColor];
		
		UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
		
		//label.text = [NSString stringWithFormat:@"This Is View #%d",i+1];
		label.text=[_textArray objectAtIndex:i];
		
		
		label.backgroundColor = [UIColor clearColor];
		
		label.shadowColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.9];
		label.shadowOffset = CGSizeMake(0, 1);
		
		label.textColor = [[UIColor alloc] initWithRed:0.0 / 255 green:0.0 / 255 blue:0.0 / 255 alpha:1.0];
		label.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:20];
		label.textAlignment = UITextAlignmentCenter;
		label.lineBreakMode = UILineBreakModeWordWrap;
		label.numberOfLines = 0;
		
		[view addSubview:label];
		[scrollView addSubview:view];
		
		[view release];
		[label release];
	}
    
    // Add the scroll view to the webview 
	[_webView addSubview:scrollView];
	NSLog(@"Scroll View Shown");
	
    // Flash the scroll view indicators when the window is visible
    [scrollView flashScrollIndicators];
    
	[scrollView release];
}

-(void) hideScrollView	{
	NSLog(@"Scroll View Hide Called");
	// Add code to actually hide the scrollView here....!
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

@end
