//
//  wood.m
//  Custom Fonts
//
//  Created by Mike Seaby on 27/01/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "wood.h"

//****************************************************************
// Globally Add Image To UINavController
//****************************************************************

@implementation UINavigationBar (CustomBackground)

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"wbg.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	
}

@end



//****************************************************************
// Globally Add Image To UITabBar 
// !!! Only shows on Device, not Simulator !!!
//****************************************************************

@implementation UITabBar (CustomBackground)

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"wbg.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];	
}

@end



//****************************************************************
// Background for UISearchBar (translucent)
//****************************************************************

@implementation UISearchBar (CustomBackground)

- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"wbg.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end



//****************************************************************
// New iOS 5 custom background methods 
//****************************************************************

/*
@interface myNavigationBar : UINavigationBar <UINavigationBarDelegate> {
}
@end

@implementation myNavigationBar

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect 
{
    // ColorSync manipulated image
    UIImage *imageBackground = [UIImage imageNamed: @"wbg.png"];
    [imageBackground drawInRect: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) ];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
}

@end
*/