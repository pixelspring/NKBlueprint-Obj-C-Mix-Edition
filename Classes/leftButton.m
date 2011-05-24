//
//  leftButton.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 16/03/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "leftButton.h"

UIBarButtonItem *button;
UINavigationController *controller;
UIAlertView *alert;

@implementation leftButton

- (void)addLeftButton {
	controller = [[NSClassFromString(@"NKBridge") sharedInstance]
	navigationControllerForPage:@"main.html"];
    
	button = [[UIBarButtonItem alloc]
    initWithTitle:@"Button"
	style:UIBarButtonItemStylePlain 
    
    target:self action:@selector(buttonClicked:)];
    
    //button =  UIBarButtonSystemItemDone;
    
	controller.visibleViewController.navigationItem.leftBarButtonItem = button;
    
    // ********************************************************************************************************
    // You can add your title like the first line, or use system defined options:
    // ********************************************************************************************************
    // initWithTitle:@"Button"
    /* OR
     initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
     initWithBarButtonSystemItem:UIBarButtonSystemItemDone
     initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
     initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
     initWithBarButtonSystemItem: UIBarButtonSystemItemSave
     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
     initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
     initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
     initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
     initWithBarButtonSystemItem:UIBarButtonSystemItemReply
     initWithBarButtonSystemItem:UIBarButtonSystemItemAction
     initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
     initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
     initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
     initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
     initWithBarButtonSystemItem:UIBarButtonSystemItemStop
     initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
     initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
     initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
     initWithBarButtonSystemItem:UIBarButtonSystemItemPause
     initWithBarButtonSystemItem:UIBarButtonSystemItemRewind
     initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
     initWithBarButtonSystemItem:UIBarButtonSystemItemUndo          // iOS 3.0 and later
     initWithBarButtonSystemItem:UIBarButtonSystemItemRedo          // iOS 3.0 and later
     initWithBarButtonSystemItem:UIBarButtonSystemItemPageCurl      // iOS 4.0 and later
     */
	
}

// Called when left button pressed
- (void) buttonClicked:(id)sender{
	button = (UIBarButtonItem *)sender;
	
    alert = [[UIAlertView alloc] initWithTitle:@"Left Bar Button!" message:@"You Pressed It!"
                                                   delegate:self cancelButtonTitle:@"OK!" otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    // ********************************************************************************************************
    // TODO: Add method to return button press to javascript
    // ********************************************************************************************************
}

@end
