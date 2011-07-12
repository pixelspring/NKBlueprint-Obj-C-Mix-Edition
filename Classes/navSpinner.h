//
//  navSpinner.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 17/05/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface navSpinner : NSObject{

    UINavigationController* _navigationController;
    UIWebView *webView;
    NSString *currentPage;
	
	UIBarButtonItem *barButton;
	UIActivityIndicatorView *activityIndicator;
}

//@property(retain,nonatomic)  UINavigationController *_navigationController;
@property (retain) UINavigationController* _navigationController;
@property (nonatomic, assign) UIWebView *webView;
@property (retain) NSString *currentPage;


@end