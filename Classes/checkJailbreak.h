//
//  checkJailbreak.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 18/07/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface checkJailbreak : NSObject {
	UIWebView *webView;
    NSString *currentPage;
}

@property (nonatomic, assign) UIWebView *webView;
@property (retain) NSString *currentPage;

@end
