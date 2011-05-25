//
//  ObjC_MixAppDelegate.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 21/01/2011.
//  Copyright Mike Seaby 2011. All rights reserved.
//

#import "ObjC_MixAppDelegate.h"
#import "Nimble.h"
#import "NKBridge.h"
#import "locale.h"

extern BOOL _mainWebViewLoaded;

@implementation ObjC_MixAppDelegate

@synthesize window;

// Fancy Fade/Zoom After Load 
//*********************************
- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {  
    [splashView removeFromSuperview];  
    [splashView release];  
} 

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	Nimble *nimble = [[Nimble alloc] initWithRootPage:@"main.html" window:window serial:@"YOUR_SERIAL_HERE"];
	[nimble release];
	[window makeKeyAndVisible];
	while (!_mainWebViewLoaded) {
		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
	}
    
    //sleep(10); // Delay App start by holding the Default.png for 10secs
    
    // Fancy Fade/Zoom After Load 
    //*********************************
    splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];  
    splashView.image = [UIImage imageNamed:@"Default.png"];  
    [window addSubview:splashView];  
    [window bringSubviewToFront:splashView];  
    [UIView beginAnimations:nil context:nil];  
    [UIView setAnimationDuration:2.0];  
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];  
    [UIView setAnimationDelegate:self];   
    [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];  
    splashView.alpha = 0.0;  
    //splashView.frame = CGRectMake(-60, -85, 440, 635);  // Comment this out (or change dimension to match initWithFrame) for fade without zoom.
    [UIView commitAnimations]; 
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[[NKBridge sharedInstance] performSelector:@selector(onApplicationQuit)];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end



//****************************************************************
// Fancy Fade/Zoom After Load for universal app (iPhone / iPad)
//****************************************************************

/*
 if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
 {
 // The device is an iPad.
 splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 768, 1024)];
 splashView.image = [UIImage imageNamed:@"Default-Portrait.png"];
 [window addSubview:splashView];
 [window bringSubviewToFront:splashView];
 [UIView beginAnimations:nil context:nil];
 [UIView setAnimationDuration:2.0];
 [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];
 [UIView setAnimationDelegate:self]; 
 [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
 splashView.alpha = 0.0;
 splashView.frame = CGRectMake(0, 0, 768, 1024);
 [UIView commitAnimations];
 }
 else
 {
 // The device is an iPhone or iPod touch.
 splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
 splashView.image = [UIImage imageNamed:@"Default.png"];
 [window addSubview:splashView];
 [window bringSubviewToFront:splashView];
 [UIView beginAnimations:nil context:nil];
 [UIView setAnimationDuration:2.0];
 [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];
 [UIView setAnimationDelegate:self]; 
 [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
 splashView.alpha = 0.0;
 splashView.frame = CGRectMake(0, 0, 320, 480);
 [UIView commitAnimations];
 }
 */
 
 
 
 
//****************************************************************
// Floz's Device-rotation-compatible startup animation
// (device only, NOT for simulator)
//**************************************************************** 

  
  /*
  BOOL iPad = NO;
  #ifdef UI_USER_INTERFACE_IDIOM
  iPad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
  #endif
  
  if (!iPad) {
  splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];  
  splashView.image = [UIImage imageNamed:@"Default.png"];  
  [window addSubview:splashView];  
  [window bringSubviewToFront:splashView];  
  [UIView beginAnimations:nil context:nil];  
  [UIView setAnimationDuration:.5];  
  [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
  [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];  
  [UIView setAnimationDelegate:self];   
  [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];  
  splashView.alpha = 0.0;  
  splashView.frame = CGRectMake(0-60, 0-90, 320+2*60, 480+2*90);  
  [UIView commitAnimations];
  } else { // iPads   
  
  [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
  
  int orientation = [[UIDevice currentDevice] orientation];
  int y;
  
  switch (orientation) {
  case UIDeviceOrientationPortrait:
  y = 20;
  splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,y, 768, 1004)];
  splashView.image = [UIImage imageNamed:@"Default-Portrait~ipad.png"];
  //            NSLog(@"UIDeviceOrientationPortrait");
  break;
  
  case UIDeviceOrientationPortraitUpsideDown:
  y = 0;
  splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,y, 768, 1004)];
  splashView.image = [UIImage imageNamed:@"Default-Portrait~ipad.png"];
  splashView.transform = CGAffineTransformMakeRotation(M_PI);
  //            NSLog(@"UIDeviceOrientationPortraitUpsideDown");
  break;
  
  case UIDeviceOrientationLandscapeLeft:
  y = 0;
  splashView = [[UIImageView alloc] initWithFrame:CGRectMake(-(1024-748)/2+y,(1024-748)/2, 1024, 748)];
  splashView.image = [UIImage imageNamed:@"Default-Landscape~ipad.png"];
  splashView.transform = CGAffineTransformMakeRotation(M_PI/2);
  //            NSLog(@"UIDeviceOrientationLandscapeLeft");
  break;
  
  default: // UIDeviceOrientationLandscapeRight
  y = 20;
  splashView = [[UIImageView alloc] initWithFrame:CGRectMake(-(1024-748)/2+y,(1024-748)/2, 1024, 748)];
  splashView.image = [UIImage imageNamed:@"Default-Landscape~ipad.png"];
  splashView.transform = CGAffineTransformMakeRotation(3*M_PI/2);
  //            NSLog(@"UIDeviceOrientationLandscapeRight");
  }
  
  [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
  
  [window addSubview:splashView];  
  [window bringSubviewToFront:splashView];  
  [UIView beginAnimations:nil context:nil];  
  [UIView setAnimationDuration:.5];  
  [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
  [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];  
  [UIView setAnimationDelegate:self];   
  [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];  
  splashView.alpha = 0.0;  
  splashView.frame = CGRectMake(0-120, y-160, 768+2*120, 1024+2*160);
  [UIView commitAnimations];
  }
  */