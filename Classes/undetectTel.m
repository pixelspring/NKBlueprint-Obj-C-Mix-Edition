//
//  undetectTel.m
//  ObjC-Mix
//
//  Taken from code by user "acme" on the NimbleKit forums
//

#import "undetectTel.h"

@implementation undetectTel

- (void)setNKWebView:(UIWebView*)webView
{
    [webView setDataDetectorTypes:UIDataDetectorTypeNone];
}

- (void) nada
{
}

@end
