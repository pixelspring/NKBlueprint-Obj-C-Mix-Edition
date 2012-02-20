//
//  scrollView.h
//  NKScrollView
//
//  Created by Mike Seaby on 14/01/2012.
//  Copyright (c) 2012 Mike Seaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface scrollView : NSObject {
	
	NSDictionary* _parameters;
	UIWebView* _webView;
	NSString* _pageTitle;
	NSString* _lastReturnResult;
	UIScrollView* _scrollView;
}

@property (retain) NSDictionary* _parameters;
@property (retain) UIWebView* _webView;
@property (retain) NSString* _pageTitle;
@property (retain) NSString* _lastReturnResult;

@end