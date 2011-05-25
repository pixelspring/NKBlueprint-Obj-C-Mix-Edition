//
//  MyUISearchBar.h
//  SearchBar
//
//  Originally Created by Chris Kunicki on 21.9.09..
//  See http://www.nimblekit.com/forum/viewtopic.php?f=13&t=445 for more details
//

#import <Foundation/Foundation.h>


@interface MyUISearchBar : NSObject <UISearchBarDelegate> {	
	NSDictionary* _parameters;
	UIWebView* _webView;
	NSString* _pageTitle;
	NSString* _lastReturnResult;
	UISearchBar* _searchBar;
	NSMutableArray* _components;
	UIView *overlay;
}

- (void)showSearchBar;
- (void)fadeOutOverlay;
- (void)fadeInOverlay;
- (void)dismissKeyboard;

@property (retain) NSDictionary* _parameters;
@property (retain) UIWebView* _webView;
@property (retain) NSString* _pageTitle;
@property (retain) NSString* _lastReturnResult;


@end
