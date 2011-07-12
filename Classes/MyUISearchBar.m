//
//  MyUISearchBar.m
//  SearchBar
//
//  Originally Created by Chris Kunicki on 21.9.09.
//  Overlay methods added by Florian Knorn
//  See http://www.nimblekit.com/forum/viewtopic.php?f=13&t=445 for more details
//

#import "MyUISearchBar.h"


@implementation MyUISearchBar

@synthesize _parameters, _webView, _pageTitle, _lastReturnResult;

- (void)showSearchBar
{	
	_searchBar = [[UISearchBar alloc] initWithFrame:[_webView bounds]];
	_searchBar.placeholder=@"Search For Stuff";         // Show some placeholder text in the searchbar text box
	//_searchBar.prompt=@"my prompt";                   // Comment this out to NOT show the prompt
    
    // ********************************************************************************************************
    // Optional Buttons and Stuff that can be shown. All default to "NO" if undefined.
    // ********************************************************************************************************
    //_searchBar.showsCancelButton = YES;               // Show a cancel button on the searchbar
    //_searchBar.showsBookmarkButton = YES;             // Show a bookmarks button on the searchbar
    //_searchBar.showsScopeBar = YES;                   // Show a scope bar
    // _searchBar.showsSearchResultsButton = YES;        // Show a search results button
    // ********************************************************************************************************
    
    _searchBar.barStyle=UIBarStyleBlackTranslucent;     // Make it black translucent (or change "Translucent" to "Opaque" if you like)
	[_searchBar sizeToFit];
    [_searchBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleWidth];     // Resize the searchbar when device rotated
    //_searchBar.tintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];           // Add Some Colour (if you don't use barStyle)
	_searchBar.delegate = self;
    [_webView addSubview:_searchBar];
    
	
	// ********************************************************************************************************
    // Overlay similar to native contacts app - Thanks Floz! 
    // ********************************************************************************************************
	// optional
	_searchBar.keyboardType = UIKeyboardTypeDefault;
	[[[_searchBar subviews] lastObject] setReturnKeyType: UIReturnKeyDone];
	
	// overlay
	overlay = [[[UIView alloc] initWithFrame:CGRectMake(0,44, _webView.bounds.size.width, _webView.bounds.size.height)] autorelease];
	overlay.backgroundColor = [UIColor blackColor];
	overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleWidth;
	overlay.alpha = 0.0;
	overlay.userInteractionEnabled = YES;
	[UIView setAnimationDuration:.5];
	
	// add events when overlay is tapped, swiped or panned in order to hide overlay and keyboard
	UITapGestureRecognizer *tgr = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)] autorelease];
	UIPanGestureRecognizer *pgr = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)] autorelease];
	UISwipeGestureRecognizer *sgr = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)] autorelease];
	[overlay addGestureRecognizer:tgr]; [overlay addGestureRecognizer:pgr]; [overlay addGestureRecognizer:sgr];
	
	[_webView addSubview:overlay];  
	[_webView bringSubviewToFront:overlay];
	_webView.autoresizesSubviews = YES;
	
	[_searchBar release];
}

- (void)fadeInOverlay {                                        // floz
	overlay.alpha = 0.0;
	[UIView beginAnimations:nil context:nil];  
	overlay.alpha = 0.67;
	[UIView commitAnimations];
}

- (void)fadeOutOverlay {                                       // floz
	overlay.alpha = 0.67;
	[UIView beginAnimations:nil context:nil];  
	overlay.alpha = 0.0;
	[UIView commitAnimations];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {  // floz
	[_searchBar setShowsCancelButton:YES animated:YES];
	[self fadeInOverlay];
	return YES;
} 

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {   // floz
	[_searchBar setShowsCancelButton:NO animated:YES];
	[_searchBar resignFirstResponder];
	[self fadeOutOverlay];
	return YES;  
} 

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar { // floz
	[_searchBar resignFirstResponder];
}

- (void)dismissKeyboard
{
	[_searchBar resignFirstResponder];
}

#pragma mark -
#pragma mark delegate methods

- (void)searchBar:(UISearchBar *)searchBarControl textDidChange:(NSString *)searchText
//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBarControl
{
    NSString *query = [_searchBar.text stringByReplacingOccurrencesOfString:@"\'" withString:@"\\\'"];
    [_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:[NSString stringWithFormat:@"searchUpdated('%@');", query] waitUntilDone:NO];
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:@"searchButtonClicked();" waitUntilDone:NO];	
}
/*
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_webView performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:[NSString stringWithFormat:@"searchButtonClicked(\"%@\");", _searchBar.text] waitUntilDone:NO];
    [_searchBar resignFirstResponder];
}
*/
#pragma mark -
#pragma mark automatic setter methods

- (void)setNKParameters:(NSDictionary*)parameters
{
	self._lastReturnResult = nil;
	self._parameters = parameters;
}

- (void)setNKCurrentPage:(NSString*)pageTitle
{
	self._pageTitle = pageTitle;
}

- (void)setNKWebView:(UIWebView*)webView
{
	self._webView = webView;
}

- (void) dealloc
{
	self._pageTitle = nil;
	self._parameters = nil;
	self._webView = nil;
	self._lastReturnResult = nil;
	[super dealloc];
}

@end
