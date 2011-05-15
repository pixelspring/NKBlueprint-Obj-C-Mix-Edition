//
//  NKBridge.h
//  NimbleKit
//
//  Created by Alexander Voloshyn on 22.03.09.
//  Copyright 2009 VolnaTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NKBridge : NSObject {
}

+ (id)sharedInstance;
- (UIWebView*)webViewForPage:(NSString*)page;
- (UINavigationController*)navigationControllerForPage:(NSString*)page;
- (void)onApplicationQuit;

@end
