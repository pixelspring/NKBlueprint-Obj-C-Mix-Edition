//
//  wood.m
//  Custom Fonts
//
//  Created by Mike Seaby on 27/01/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "wood.h"

//****************************************************************
// Globally Add Image To UINavController
//****************************************************************

@implementation UINavigationBar (CustomBackground)

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"wbg.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	
}

@end



//****************************************************************
// Globally Add Image To UITabBar 
// !!! Only shows on Device, not Simulator !!!
//****************************************************************

@implementation UITabBar (CustomBackground)

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"wbg.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];	
}

@end



//****************************************************************
// Background for UISearchBar (translucent)
//****************************************************************

@implementation UISearchBar (CustomBackground)

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"wbg.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end


//****************************************************************
// Background for UITableView Rows:
// Currently very limited as it just draws an image as background
// to the tableview cell - no options yet to customise font etc
//****************************************************************

@implementation UITableViewCell (CustomBg)

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"tablerowbg.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}



@end

//****************************************************************
// New iOS 5 custom background methods 
//****************************************************************

@implementation wood

@synthesize _nimbleViewController, _parameters, _webView, _pageTitle, _lastReturnResult;

-(void)navBar 
{
	if ([[UINavigationBar class]respondsToSelector:@selector(appearance)]) {
	
	NSLog(@"background Called");
	// Set a Custom Background Image
	[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"wbg.png"] forBarMetrics:UIBarMetricsDefault];
	
	// Set some custom text attributes on the navBar
	[[UINavigationBar appearance] setTitleTextAttributes:
	 [NSDictionary dictionaryWithObjectsAndKeys:
			
			// Text Colour - or "color" for those in the US ;)
			[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], 
			UITextAttributeTextColor,
		    // Text Shadow Colour
			[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8], 
			UITextAttributeTextShadowColor, 
		    // Set the text shadow offset
			[NSValue valueWithUIOffset:UIOffsetMake(0, -1)], 
			UITextAttributeTextShadowOffset, 
		    // Set the font & font size
			[UIFont fontWithName:@"SnellRoundhand-Black" size:22], 
			UITextAttributeFont, 
			nil]];
	}
}

-(void)tabBar 
{
	if ([[UITabBar class]respondsToSelector:@selector(appearance)]) {
	NSLog(@"tabBar Called");
	// Set a custom background image
	UIImage *tabBackground = [[UIImage imageNamed:@"wbg.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
	[[UITabBar appearance] setBackgroundImage:tabBackground];
	
	// Set tabBar tint if not using an image 
	// [[UITabBar appearance] setTintColor:
	// [UIColor colorWithRed:255.0 green:0.0 blue:0.0 alpha:0.2]];
	
	// Set a background image for the selected tab
	[[UITabBar appearance] setSelectionIndicatorImage:
	[UIImage imageNamed:@"tabselect.png"]];
	}
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
