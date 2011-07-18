//
//  checkJailbreak.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 18/07/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "checkJailbreak.h"
#import "NKBridge.h"

@implementation checkJailbreak

@synthesize webView, currentPage;

- (void)checkForJailbreak
{	
	NSString *filePath = @"/Applications/Cydia.app";
	
	if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
	{
		NSLog(@"Cydia is present, so device has been jailbroken");
		[self.webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:[NSString stringWithFormat:@"isJailbroken()"] waitUntilDone:NO];
	}
	else
	{
		NSLog(@"Cydia not present, so device probably not jailbroken");
		[self.webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:[NSString stringWithFormat:@"notJailbroken()"] waitUntilDone:NO];
	}
}


- (void)setNKWebView:(UIWebView*)view {
    self.webView = view;
}

- (void)setNKCurrentPage:(NSString*)page {
    self.currentPage = page;
}


@end
