//
//  TObject.m
//  TDeneme
//
//  Created by Can Durakci on 11/22/11.
//  Jazzbass 
//  Copyright (c) 2011 Unimedisys. All rights reserved. visit www.unimedisys.com 
//

#import "TObject.h"
#import "Nimble.h"
#import "NKBridge.h"
#import <Twitter/Twitter.h>

@implementation TObject
@synthesize _nimbleViewController;
@synthesize _parameters, _webView, _pageTitle, _lastReturnResult;

-(void)tweetIt // For some reason, if the function is named "tweet", any instances of the word "tweet" are removed???
{
    NSLog(@"Tweeting!");
	
	NSString* message = [_parameters objectForKey:@"message"];
    
    if ([TWTweetComposeViewController canSendTweet])
    {
        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:message];
		[tweetSheet addImage:[UIImage imageNamed:@"Icon@2x.png"]];	// Optionally add an image to the tweet if you so desire - some nice app branding maybe ;)
        
        UIViewController* controller = [[NSClassFromString(@"NKBridge") sharedInstance] navigationControllerForPage:@"main.html"];
            if(!controller)
                controller = [[NSClassFromString(@"NKBridgeInternal") sharedInstance] _nimbleViewController];
        [controller presentModalViewController:tweetSheet animated:YES];

    }
  else
    {
        UIAlertView *alertView = [[UIAlertView alloc] 
                                  initWithTitle:@"Sorry"                                                             
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"                                                          
                                  delegate:self                                              
                                  cancelButtonTitle:@"OK"                                                   
                                  otherButtonTitles:nil];
        [alertView show];
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

- (void) dealloc
{
	self._pageTitle = nil;
	self._parameters = nil;
	self._webView = nil;
	self._lastReturnResult = nil;
	[super dealloc];
}

@end

