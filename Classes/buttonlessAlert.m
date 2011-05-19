//
//  buttonlessAlert.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 17/05/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "buttonlessAlert.h"
#import "NKBridge.h"
#import "Nimble.h"


@implementation buttonlessAlert

- (void)showButtonless
{
    UIAlertView *alert;
    
    
    alert = [[[UIAlertView alloc] initWithTitle:@"Doing Really Important Stuff\nPlease Wait..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil] autorelease];
    [alert show];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    // Tweak the indicator (spinner) position up a bit from the bottom of alert
    indicator.center = CGPointMake(alert.bounds.size.width / 2, alert.bounds.size.height - 50);
    [indicator startAnimating];
    [alert addSubview:indicator];
    [indicator release];
    
    // [alert dismissWithClickedButtonIndex:0 animated:YES]; // Dismiss the Alert programatically as we have no buttons ;)
}

- (void)hideButtonless
{
    UIAlertView *alert;
    
    [alert dismissWithClickedButtonIndex:0 animated:YES]; // Currently crashes app??? Grr.
}

@end
