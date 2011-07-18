//
//  AlertClass.m
//  MyAlert
//
//  Created by Mike Seaby on 4/11/11.
//

#import "AlertClass.h"
#import "NKBridge.h"
#import "Nimble.h"


@implementation AlertClass
@synthesize _parameters;
@synthesize textField;

- (void)showAlert
{

    UIAlertView* alert = [[UIAlertView alloc] 
                          initWithTitle: [_parameters objectForKey:@"title"]
                          message:[_parameters objectForKey:@"message"]
                          delegate:self 
                          cancelButtonTitle:[_parameters objectForKey:@"cancel"]
                          otherButtonTitles:[_parameters objectForKey:@"ok"],nil];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 80.0, 260.0, 25.0)]; // Change 80 to 50 if no message
    [textField setBackgroundColor:[UIColor whiteColor]];
    [textField setPlaceholder:[_parameters objectForKey:@"placeholder"]];
    [textField becomeFirstResponder];
  
    [alert addSubview:textField];
    [alert show];
    [alert release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(buttonIndex==1) {
        NSString* jsCode = [NSString stringWithFormat:[_parameters objectForKey:@"jsFunction"],textField.text];
        //UIWebView* view = [[NKBridge sharedInstance] webViewForPage:@"prompt.html"];
		
		NSString* getWebPage = [self._parameters objectForKey:@"promptPage"];
        UIWebView* view = [[NKBridge sharedInstance] webViewForPage:getWebPage];
		
        [view performSelectorOnMainThread:@selector(stringByEvaluatingJavaScriptFromString:) withObject:jsCode waitUntilDone:YES];
    }
    
}

#pragma mark -
#pragma mark automatic setter methods

- (void)setNKParameters:(NSDictionary*)parameters
{
	self._parameters = parameters;
}

- (void)dealloc {
	self._parameters = nil;
    self.textField = nil;
    
    [_parameters release];
    [textField release];
    [super dealloc];
}

@end
