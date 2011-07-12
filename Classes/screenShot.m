//
//  screenShot.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 30/05/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//
//

#import "screenShot.h"


@implementation screenShot
@synthesize _webView;

- (IBAction)saveScreenshot {
    
    // Define entire screen
    CGSize size =  [[UIScreen mainScreen] bounds].size;
    //NSLog(@"Define Screen");
    
    // Create the screenshot
    UIGraphicsBeginImageContext(size);
    //NSLog(@"UIGraphicsBeginImageContext");
    
    // Put everything in the current view into the screenshot
    //[[self.view layer] renderInContext:UIGraphicsGetCurrentContext()];
    //[[self._webView layer] renderInContext:UIGraphicsGetCurrentContext()];
    [[self._webView layer] renderInContext:UIGraphicsGetCurrentContext()];
    //NSLog(@"renderInContext");
    
    // Save the current image context info into a UIImage
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Save the screenshot to the device's photo album
    UIImageWriteToSavedPhotosAlbum(newImage, self,
                                   @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

/*
- (void) saveScreenshot {
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    UIGraphicsEndImageContext();
}
*/

// callback for UIImageWriteToSavedPhotosAlbum
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (error) {
        // Handle if the image could not be saved to the photo album
    }
    else {
        // The save was successful and all is well
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ScreenShot" message:@"Captured"
                                                       delegate:self cancelButtonTitle:@"OK!" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

@end
