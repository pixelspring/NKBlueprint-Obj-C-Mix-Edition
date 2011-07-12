//
//  screenShot.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 30/05/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>
#import <QuartzCore/QuartzCore.h>
#import <ImageIO/ImageIO.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface screenShot : UIView {

    UIWebView* _webView;
    
}

@property (retain) UIWebView* _webView;
@end
