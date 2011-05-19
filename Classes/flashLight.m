//
//  flashLight.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 19/05/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "flashLight.h"


@implementation flashLight

@synthesize torchSession;

- (void)dealloc {
    [torchSession release];
    [super dealloc];
}


- (id) init {
    if ((self = [super init])) {
        
        // initialize flashlight
        // test if this class even exists to ensure flashlight is turned on ONLY for iOS 4 and above
        Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
        if (captureDeviceClass != nil) {
            
            AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
            
            if ([device hasTorch] && [device hasFlash]){
                
                if (device.torchMode == AVCaptureTorchModeOff) {
                    
                    NSLog(@"Setting up flashlight for later use...");
                    
                    AVCaptureDeviceInput *flashInput = [AVCaptureDeviceInput deviceInputWithDevice:device error: nil];
                    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
                    
                    AVCaptureSession *session = [[AVCaptureSession alloc] init];
                    
                    [session beginConfiguration];
                    [device lockForConfiguration:nil];
                    
                    [session addInput:flashInput];
                    [session addOutput:output];
                    
                    [device unlockForConfiguration];
                    
                    [output release];
                    
                    [session commitConfiguration];
                    [session startRunning];
                    
                    [self setTorchSession:session];
                    [session release];
                }
                
            }
            
        }
    } return self;
    
}


- (void)flashOn {

    // test if this class even exists to ensure flashlight is turned on ONLY for iOS 4 and above
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        [device lockForConfiguration:nil];
        
        [device setTorchMode:AVCaptureTorchModeOn];
        [device setFlashMode:AVCaptureFlashModeOn];
        
        [device unlockForConfiguration];
        
    }

}

- (void)flashOff {

    // test if this class even exists to ensure flashlight is turned on ONLY for iOS 4 and above
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        [device lockForConfiguration:nil];
        
        [device setTorchMode:AVCaptureTorchModeOff];
        [device setFlashMode:AVCaptureFlashModeOff];
        
        [device unlockForConfiguration];
        
    }
}
@end
