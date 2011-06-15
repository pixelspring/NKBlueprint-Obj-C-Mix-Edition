//
//  leftButton.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 16/03/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface leftButton : NSObject {
    UIWebView *webView;
    NSString *currentPage;
}

@property (nonatomic, assign) UIWebView *webView;
@property (retain) NSString *currentPage;

@end
