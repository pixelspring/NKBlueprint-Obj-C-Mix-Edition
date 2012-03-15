//
//  gestures.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 15/03/2012.
//  Copyright (c) 2012 Mike Seaby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gestures : NSObject {
	
	NSDictionary* _parameters;
	UIWebView* _webView;
	NSString* _pageTitle;
	NSString* _lastReturnResult;
}

@property (retain) NSDictionary* _parameters;
@property (retain) UIWebView* _webView;
@property (retain) NSString* _pageTitle;
@property (retain) NSString* _lastReturnResult;

@end
