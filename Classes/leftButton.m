//
//  leftButton.m
//  ObjC-Mix
//
//  Created by Mike Seaby on 16/03/2011.
//  Copyright 2011 Mike Seaby. All rights reserved.
//

#import "leftButton.h"
#import "NKBridge.h"

@implementation leftButton

@synthesize webView, currentPage;

- (void)addLeftButton {
	UINavigationController *controller = [[NKBridge sharedInstance] navigationControllerForPage:self.currentPage];
	
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Button" style:UIBarButtonItemStylePlain target:self action:@selector(buttonClicked:)];
    
	//    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"imagename.png"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonClicked:)]; // in case you want image there
	
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

- (void)removeLeftButton {
    UINavigationController *controller = [[NKBridge sharedInstance] navigationControllerForPage:self.currentPage];
	controller.visibleViewController.navigationItem.leftBarButtonItem = nil;
}

- (void)setNKWebView:(UIWebView*)view {
    self.webView = view;
}

- (void)setNKCurrentPage:(NSString*)page {
    self.currentPage = page;
}

- (void) buttonClicked:(id)sender{
	
    [self.webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:[NSString stringWithFormat:@"leftButtonClicked()"] waitUntilDone:NO];
}

@end
