//
//  deShadow.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 17/04/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "deShadow.h"


@implementation deShadow


- (void) hideGradientBackground:(UIView*)theView
{
    for (UIView* subview in theView.subviews)
    {
        if ([subview isKindOfClass:[UIImageView class]])
            subview.hidden = YES;
        
        [self hideGradientBackground:subview];
    }
}

- (void)setNKWebView:(UIWebView*)webView
{
    for (UIView* subview in webView.subviews)
    {
        [self hideGradientBackground:subview];
    }
}

- (void)dummy
{
    
}

@end