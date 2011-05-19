//
//  flashLight.h
//  ObjC-Mix
//
//  Created by Mike Seaby on 19/05/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface flashLight : NSObject {
    AVCaptureSession *torchSession;
}

@property (nonatomic, retain) AVCaptureSession * torchSession;

@end