//
//  customUIAlert.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 29/12/2011.
//  Copyright (c) 2011 Mike Seaby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface customUIAlert : UIAlertView
{
	UIWebView *_webView;
    NSString *_currentPage;
	NSDictionary* _parameters;
}

@property (nonatomic, assign) UIWebView *_webView;
@property (retain) NSString *_currentPage;
@property(retain) NSDictionary* _parameters;

@end
