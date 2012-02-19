//
//  localNotification.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 19/02/2012.
//  Copyright (c) 2012 Mike Seaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface localNotification : NSObject {
	
	NSDictionary* _parameters;
	UIWebView* _webView;
	NSString* _pageTitle;
	NSString* _lastReturnResult;
	NSMutableArray* arguments;
	
	UILocalNotification *localNotification;
}

@property (retain) NSDictionary* _parameters;
@property (retain) UIWebView* _webView;
@property (retain) NSString* _pageTitle;
@property (retain) NSString* _lastReturnResult;

@property (nonatomic, strong) UILocalNotification *localNotification;


@end
