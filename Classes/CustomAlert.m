//
//  CustomAlert.m
//  
//
//  Created by Mike Seaby on 30/03/2010.
//  Copyright 2010 Mike Seaby. All rights reserved.
//

#import "CustomAlert.h"

@interface CustomAlert (Private)

- (void) drawRoundedRect:(CGRect) rect inContext:(CGContextRef) context withRadius:(CGFloat) radius;

@end

static UIColor *fillColor = nil;
static UIColor *borderColor = nil;

@implementation CustomAlert

+ (void) setBackgroundColor:(UIColor *) background withStrokeColor:(UIColor *) stroke
{
	if(fillColor != nil)
	{
		[fillColor release];
		[borderColor release];
	}
	
	fillColor = [background retain];
	borderColor = [stroke retain];
}

- (id)initWithFrame:(CGRect)frame
{
    if((self = [super initWithFrame:frame]))
	{
        if(fillColor == nil)
		{
			fillColor = [[UIColor blackColor] retain];
			borderColor = [[UIColor colorWithHue:0.625 saturation:0.0 brightness:0.8 alpha:0.8] retain];
		}
    }
	
    return self;
}

- (void)drawRect:(CGRect)rect
{	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextClearRect(context, rect);
	CGContextSetAllowsAntialiasing(context, true);
	CGContextSetLineWidth(context, 0.0);
	CGContextSetAlpha(context, 0.8); 
	CGContextSetLineWidth(context, 2.0);
	CGContextSetStrokeColorWithColor(context, [borderColor CGColor]);
	CGContextSetFillColorWithColor(context, [fillColor CGColor]);
	
	// Draw background
	CGFloat backOffset = 2;
	CGRect backRect = CGRectMake(rect.origin.x + backOffset, rect.origin.y + backOffset, rect.size.width - backOffset*2, rect.size.height - backOffset*2);
	[self drawRoundedRect:backRect inContext:context withRadius:8]; //8
	CGContextDrawPath(context, kCGPathFillStroke);
	
	// Clip Context
	CGRect clipRect = CGRectMake(backRect.origin.x + backOffset-1, backRect.origin.y + backOffset-1, backRect.size.width - (backOffset-1)*2, backRect.size.height - (backOffset-1)*2);
	[self drawRoundedRect:clipRect inContext:context withRadius:8]; //9
	CGContextClip (context);
	
	//Draw highlight
	CGGradientRef glossGradient;
	CGColorSpaceRef rgbColorspace;
	size_t num_locations = 2;
	CGFloat locations[2] = { 0.0, 1.0 };
	CGFloat components[8] = { 1.0, 1.0, 1.0, 0.35, 1.0, 1.0, 1.0, 0.06 };
	rgbColorspace = CGColorSpaceCreateDeviceRGB();
	glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
	
	CGRect ovalRect = CGRectMake(-130, -115, (rect.size.width*2), rect.size.width/2);
	
	CGPoint start = CGPointMake(rect.origin.x, rect.origin.y);
	CGPoint end = CGPointMake(rect.origin.x, rect.size.height/5);
	
	CGContextSetAlpha(context, 1.0); 
	CGContextAddEllipseInRect(context, ovalRect);
	CGContextClip (context);
	
	CGContextDrawLinearGradient(context, glossGradient, start, end, 0);
	
	CGGradientRelease(glossGradient);
	CGColorSpaceRelease(rgbColorspace); 
}

- (void) drawRoundedRect:(CGRect) rrect inContext:(CGContextRef) context withRadius:(CGFloat) radius
{
	CGContextBeginPath (context);
	
	CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
	CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
	
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
}

- (void)dealloc
{
    [super dealloc];
}

@end