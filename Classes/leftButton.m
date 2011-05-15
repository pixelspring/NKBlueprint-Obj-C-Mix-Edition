//
//  leftButton.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 16/03/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "leftButton.h"


@implementation leftButton

- (void)addLeftButton {
	UINavigationController *controller = [[NSClassFromString(@"NKBridge") sharedInstance]
	navigationControllerForPage:@"main.html"];
	UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Button"
	style:UIBarButtonItemStylePlain target:self action:@selector(buttonClicked:)];
	controller.visibleViewController.navigationItem.leftBarButtonItem = button;
	
}

@end
