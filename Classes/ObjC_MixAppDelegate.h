//
//  ObjC_MixAppDelegate.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 21/01/2011.
//  Copyright Mike Seaby 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjC_MixAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	NSDictionary* _parameters;
    NSString* _lastReturnResult;
    
    // Fancy Fade/Zoom After Load 
    //*********************************
    UIImageView *splashView;  
} 

// Fancy Fade/Zoom After Load 
//********************************* 
- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context; // Fancy Fade/Zoom After Load

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (retain) NSDictionary* _parameters;
@property (retain) NSString* _lastReturnResult;

@end

