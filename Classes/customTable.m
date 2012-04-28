//
//  customTable.m
//  ObjC-Mix
//
//  Created by Pixelspring on 28/04/2012.
//  Copyright (c) 2012 Mike Seaby. All rights reserved.
//

#import "customTable.h"
#import "NKBridge.h"


//****************************************************************
// Background for UITableView Cells (Rows):
//****************************************************************

@implementation UITableViewCell (Customised)


#pragma mark- Customise UITableViewCell (BG, Title label & Subtitle Label)
- (void)drawRect:(CGRect)rect {
	
	// ---------------------------------------------------------------------------------
	// Solid Colour as Cell Background...
	// ---------------------------------------------------------------------------------
	/*
	 UIView* cellSolidColorBG = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	 cellSolidColorBG.opaque = YES;	// Explicitly set to opaque for performance
	 cellSolidColorBG.backgroundColor = [[UIColor alloc] initWithRed:211.0 / 255 
	 green:211.0 / 255 
	 blue:211.0 / 255 
	 alpha:1.0];
	 [self setBackgroundView:cellSolidColorBG];
	 [cellSolidColorBG release];
	 */
	
	
	// ---------------------------------------------------------------------------------
	// ... Or Use an Image as cell background:
	// ---------------------------------------------------------------------------------
	
	UIImage *imageCellBG = [UIImage imageNamed:@"tablerowbg.png"];
	[imageCellBG drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	[imageCellBG release];
	
	
	// ---------------------------------------------------------------------------------
	// Title Customisation
	//
	// See http://iosfonts.com/ for available font choices, or add your own font files
	// to your project. Font sizes or cell height (setRowHeight in .js tableView setup) 
	// may need adjustment.
	// ---------------------------------------------------------------------------------
	
	// Set font & font size:
	self.textLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:14];
	
	// Set the colour:
	self.textLabel.textColor = [[UIColor alloc] initWithRed:162.0 / 255 
													  green:74.0 / 255 
													   blue:14.0 / 255 
													  alpha:1.0];
	
	// Set BG color (transparant usually best choice here) 
	self.textLabel.backgroundColor = [UIColor clearColor];
	
	// Set text shadow color
	self.textLabel.shadowColor = [[UIColor alloc] initWithRed:255.0 / 255 
														green:255.0 / 255 
														 blue:255.0 / 255 
														alpha:1.0];
	// Set text shadow offset
	self.textLabel.shadowOffset = CGSizeMake(0, 1);
	
	
	// ---------------------------------------------------------------------------------
	// Subtitle Customisation:
	//
	// As above, we can add a shadow to the subtitle but has a tendency to look mushy
	// at the smaller font sizes that subtitles tend to be - so in this case it's
	// commented out.
	// ---------------------------------------------------------------------------------
	self.detailTextLabel.font = [UIFont fontWithName:@"Baskerville-Italic" size:13];
	self.detailTextLabel.textColor = [[UIColor alloc] initWithRed:0.0 / 255 
															green:0.0 / 255 
															 blue:0.0 / 255 
															alpha:1.0];
	
	/*													 													 
	 self.detailTextLabel.shadowColor = [[UIColor alloc] initWithRed:255.0 / 255 
	 green:255.0 / 255 
	 blue:255.0 / 255 
	 alpha:1.0];
	 
	 self.detailTextLabel.shadowOffset = CGSizeMake(0, 1);
	 */														 	
}




// ---------------------------------------------------------------------------------
// When Tapped and Finger Lifted
// ---------------------------------------------------------------------------------
/*
 - (void)setHighlighted: (BOOL)highlighted animated: (BOOL)animated
 {
 UIView *bghView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
 [bghView setBackgroundColor:[UIColor blackColor]];
 [self setSelectedBackgroundView:bghView];
 [bghView release];
 }
 */

// ---------------------------------------------------------------------------------
// Touch & Hold (Selected)
// ---------------------------------------------------------------------------------
#pragma mark- setSelected & Suppress warning

// FIXME: !!! Remove need to suppress warning? !!!
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)setSelected: (BOOL)selected animated: (BOOL)animated 
{
	// ---------------------------------------------------------------------------------
	// Use a colour as selected background...
	// ---------------------------------------------------------------------------------
	/*
	 UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	 [bgView setBackgroundColor:[UIColor redColor]];
	 [self setSelectedBackgroundView:bgView];
	 [bgView release];
	 */ 
	
	// ---------------------------------------------------------------------------------
	// ... or Use an Image as selected background
	// ---------------------------------------------------------------------------------
	
	UIImageView *selectedBGImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tablerowbgSel.png"]];
	self.selectedBackgroundView = selectedBGImage;
	[selectedBGImage release];
	
}
#pragma clang diagnostic pop

@end


// ---------------------------------------------------------------------------------
// UITableView Cell Seperator
// ---------------------------------------------------------------------------------

#pragma mark- UITableView Cell Seperator

@implementation UITableView (Custom) 

- (void)drawRect:(CGRect)rect {
	
	self.separatorColor = [[UIColor alloc] initWithRed:190.0 / 255 
												 green:190.0 / 255 
												  blue:190.0 / 255 
												 alpha:1.0];
	
	
}




@end
