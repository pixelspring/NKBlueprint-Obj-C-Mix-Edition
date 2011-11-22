//
//  TObject.h
//  TDeneme
//
//  Created by Can Durakci on 11/22/11.
//  Jazzbass 
//  Copyright (c) 2011 Unimedisys. All rights reserved. visit www.unimedisys.com 
//

#import <Foundation/Foundation.h>

@interface TObject : NSObject
{
   	NSDictionary* _parameters;
	UIWebView* _webView;
	NSString* _pageTitle;
	NSString* _lastReturnResult;
	NSMutableArray* _components;
	UIView *overlay;
    UIViewController* _nimbleViewController;
}
@property (retain) NSDictionary* _parameters;
@property (retain) UIWebView* _webView;
@property (retain) NSString* _pageTitle;
@property (retain) NSString* _lastReturnResult;
@property (retain) UIViewController* _nimbleViewController;


@end
