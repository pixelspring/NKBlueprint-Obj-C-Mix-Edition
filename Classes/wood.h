//
//  wood.h
//  Custom Fonts
//
//  Created by Mike Seaby on 27/01/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface wood : NSObject {
	NSDictionary* _parameters;
	UIWebView* _webView;
	NSString* _pageTitle;
	NSString* _lastReturnResult;
	NSMutableArray* _components;
	UIViewController* _nimbleViewController;
}

	@property (retain) NSDictionary* _parameters;
	@property (retain) UIWebView* _webView;
	@property (retain) NSString* _pageTitle;
	@property (retain) NSString* _lastReturnResult;
	@property (retain) UIViewController* _nimbleViewController;

@end
