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



#if TARGET_IPHONE_SIMULATOR
#warning *** Simulator: Flashlight only works on device & will crash simulator if called.
#endif

- (id) init {


	{               
#if TARGET_IPHONE_SIMULATOR
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"FYI" message:@"Flashlight not available on simulator. If you try, it WILL crash this app\n\n ;)" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		
		// Add an image to the UIAlertView ---------------------------------------------------------------------
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(220, 10, 32, 32)];
		
		// Get the Layer of imageView
		CALayer * l = [imageView layer];
		[l setMasksToBounds:YES];
		[l setCornerRadius:6.0];
		
		// Add a border to the image
		[l setBorderWidth:2.0];
		[l setBorderColor:[[UIColor whiteColor] CGColor]];
		
		NSString *path = [[NSString alloc] initWithString:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"icon.png"]];
		UIImage *bkgImg = [[UIImage alloc] initWithContentsOfFile:path];
		[imageView setImage:bkgImg];
		[bkgImg release];
		[path release];
		
		[alert addSubview:imageView];
		[imageView release];
		// Image Code Endeth here ------------------------------------------------------------------------------
		
		[alert show];
		[alert release];
#endif   
	}

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
