//
//  deBounce.m
//  ObjC-Mix
//
//  Created by Pixelspring on 28/04/2012.
//  Copyright (c) 2012 Mike Seaby. All rights reserved.
//

#import "deBounce.h"

@implementation deBounce

- (void)setNKWebView:(UIWebView*)webView
{
	webView.scrollView.bounces = NO;
}

- (void)noBounce
{
    
}

@end
