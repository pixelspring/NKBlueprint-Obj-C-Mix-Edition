//
//  customUIAlert.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 29/12/2011.
//  Copyright (c) 2011 Mike Seaby. All rights reserved.
//

#import "customUIAlert.h"
#import "NKBridge.h"
#import "Nimble.h"
#import <QuartzCore/QuartzCore.h>

@implementation customUIAlert
@synthesize _webView, _currentPage, _parameters;

-(void)customAlert
{
	customUIAlert *customAlertView = [[customUIAlert alloc] initWithTitle:[_parameters objectForKey:@"title"]
															      message:[_parameters objectForKey:@"message"]
																 delegate:self
												        cancelButtonTitle:[_parameters objectForKey:@"cancel"]
													    otherButtonTitles:[_parameters objectForKey:@"ok"],nil];
	
	[customAlertView show];
	[customAlertView release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1) {
        NSString* jsCode = [NSString stringWithFormat:[_parameters objectForKey:@"jsCAFunction"]];
		
		NSString* getWebPage = [self._parameters objectForKey:@"caPage"];
        UIWebView* view = [[NKBridge sharedInstance] webViewForPage:getWebPage];
		
        [view performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:jsCode waitUntilDone:YES];
    }
    
}


- (void)layoutSubviews
{
    for (UIView *subview in self.subviews){
        if ([subview isMemberOfClass:[UIImageView class]]) {
            subview.hidden = YES; //Hide UIImageView Containing Blue Background
        }
		
        if ([subview isMemberOfClass:[UILabel class]]) { // Point to UILabels To Change Text
            UILabel *label = (UILabel*)subview; // Cast From UIView to UILabel
            label.textColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f];
            label.shadowColor = [UIColor blackColor];
            label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        }
    }
}


- (void)drawRect:(CGRect)rect {
	
	//---------------------------------------------------------------------------------------------------
	
	// Image
	//UIImage *image = [UIImage imageNamed:@"wbg.png"];
	//[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	
	//---------------------------------------------------------------------------------------------------
	
	
	
	// Reference the Current Graphics Context
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// Create a Base Shape
	CGRect activeBounds = self.bounds;
	CGFloat cornerRadius = 10.0f;	// How round do you like your corners? (Try -2.0f for that wonky look!)			
	CGFloat inset = 2.5f;			// Set that inset. Higher values = less padding.
	CGFloat originX = activeBounds.origin.x + inset;
	CGFloat originY = activeBounds.origin.y + inset;
	CGFloat width = activeBounds.size.width - (inset*2.0f);
	CGFloat height = activeBounds.size.height - (inset*2.0f);
	
	CGRect bPathFrame = CGRectMake(originX, originY, width, height);
	CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:bPathFrame cornerRadius:cornerRadius].CGPath;
	
	// Add Fill and Outer Drop Shadow
	CGContextAddPath(context, path);
	CGContextSetFillColorWithColor(context, [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f].CGColor);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 6.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f].CGColor);
	CGContextDrawPath(context, kCGPathFill);
	
	// Clip the Context
	CGContextSaveGState(context); //Save Context State Before Clipping To "path"
	CGContextAddPath(context, path);
	CGContextClip(context);
	
	// Draw Gradient
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	size_t count = 3;
	CGFloat locations[3] = {0.0f, 0.57f, 1.0f};
	CGFloat components[12] =
    {
        70.0f/255.0f, 70.0f/255.0f, 70.0f/255.0f, 1.0f,     //1
        55.0f/255.0f, 55.0f/255.0f, 55.0f/255.0f, 1.0f,     //2
        40.0f/255.0f, 40.0f/255.0f, 40.0f/255.0f, 1.0f      //3
    };
	CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, count);
	CGPoint startPoint = CGPointMake(activeBounds.size.width * 0.5f, 0.0f);
	CGPoint endPoint = CGPointMake(activeBounds.size.width * 0.5f, activeBounds.size.height);
	CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
	CGColorSpaceRelease(colorSpace);
	CGGradientRelease(gradient);
	
	// Hatched Background
	CGFloat buttonOffset = 0.5f; // Offset by half point for crisp lines. Change this value to move hatched area down - try 92.5 for instance
	CGContextSaveGState(context); // Save Context State Before Clipping "hatchPath"
	CGRect hatchFrame = CGRectMake(0.0f, buttonOffset, activeBounds.size.width, (activeBounds.size.height - buttonOffset+1.0f));
	CGContextClipToRect(context, hatchFrame);
	
	CGFloat spacer = 4.0f;
	int rows = (activeBounds.size.width + activeBounds.size.height/spacer);
	CGFloat padding = 0.0f;
	CGMutablePathRef hatchPath = CGPathCreateMutable();
	for(int i=1; i<=rows; i++) {
		CGPathMoveToPoint(hatchPath, NULL, spacer * i, padding);
		CGPathAddLineToPoint(hatchPath, NULL, padding, spacer * i);
	}
	CGContextAddPath(context, hatchPath);
	CGPathRelease(hatchPath);
	CGContextSetLineWidth(context, 1.0f);
	CGContextSetLineCap(context, kCGLineCapRound);
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:0.35f].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
	
	// Draw A Separating Line
	CGMutablePathRef linePath = CGPathCreateMutable();
	CGFloat linePathY = (buttonOffset - 1.0f);
	CGPathMoveToPoint(linePath, NULL, 0.0f, linePathY);
	CGPathAddLineToPoint(linePath, NULL, activeBounds.size.width, linePathY);
	CGContextAddPath(context, linePath);
	CGPathRelease(linePath);
	CGContextSetLineWidth(context, 3.0f);
	CGContextSaveGState(context); //Save Context State Before Drawing "linePath" Shadow
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:0.6f].CGColor);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 0.0f, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.2f].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
	CGContextRestoreGState(context); //Restore Context State After Drawing "linePath" Shadow
	
	// Inner Shadow
	CGContextAddPath(context, path);
	CGContextSetLineWidth(context, 3.0f);
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f].CGColor);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.0f), 6.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0f].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
	
	// Redraw The Path to avoid Pixellation
	CGContextRestoreGState(context); //Restore First Context State Before Clipping "path"
	CGContextAddPath(context, path);
	CGContextSetLineWidth(context, 3.0f);
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0f].CGColor);
	CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.0f), 0.0f, [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:0.1f].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
	
}





#pragma mark NK Setters

- (void)setNKWebView:(UIWebView*)view {
    self._webView = view;
}

- (void)setNKCurrentPage:(NSString*)page {
    self._currentPage = page;
}

- (void)setNKParameters:(NSDictionary*)parameters
{
	self._parameters = parameters;
}

@end
