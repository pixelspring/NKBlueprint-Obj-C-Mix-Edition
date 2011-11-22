//
//  MyDatePickerController.m
//  code_mix
//
//  Created by Alexander Voloshyn on 05/08/09.
//  Copyright 2009 VolnaTech. All rights reserved.
//

#import "MyPickerController.h"


@implementation MyPickerController

@synthesize _parameters, _webView, _pageTitle, _lastReturnResult;

- (id)init
{
	if (self == [super init])
	{
		_components = [NSMutableArray new];
		[_components addObject:[NSMutableArray arrayWithObject:@""]];
	}
	return self;
}

- (void)showMyPicker
{	
	_picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 160, 0, 0)]; // 0, 250, 100, 100
	[_picker setFrame:CGRectMake(0, 210, 320, 162)]; //CONSOLE: invalid height value 164.0 pinned to 162.0 - so now changed to 162!
	_picker.dataSource = self;
	_picker.delegate = self;
	_picker.showsSelectionIndicator = YES;
	[_picker selectRow:1 inComponent:1 animated:YES]; // Set Selected Row
	[_picker selectRow:1 inComponent:0 animated:YES]; // Set Selected Row
    [_webView addSubview:_picker ];
	
	//[(UIView*)[[_picker subviews] objectAtIndex:2] setAlpha:0.1f];
	
	
	// ==================================================================================
	// Use this to place an image over the picker to give impression of a custom skin
	// ==================================================================================
	/*
	CGRect myImageRect = CGRectMake(0.0f, 210.0f, 320.0f, 162.0f);
	UIImageView *myImage = [[UIImageView alloc] initWithFrame:myImageRect];
	[myImage setImage:[UIImage imageNamed:@"pickover.png"]];
	myImage.opaque = YES; // explicitly opaque for performance
	[_webView addSubview:myImage];
	[myImage release];
	*/
	// ==================================================================================
	
	[_picker release];
}

- (void)clearAllComponents
{
	[_components release];
	_components = [NSMutableArray new];
	[_components addObject:[NSMutableArray arrayWithObject:@""]];	
	[_picker reloadAllComponents];
}

- (void)hideMyPicker
{
	[_picker removeFromSuperview];
	_picker = nil; // will be released automatically, removeFromSuperview decreased retainCount
}

- (void)getSelectedString
{
	NSMutableString* result = [NSMutableString string];
	for (int i=0; i<[_components count]; ++i)
	{
		int selectedRow = [_picker selectedRowInComponent:i];
		[result appendString:[[_components objectAtIndex:i] objectAtIndex:selectedRow]];
		if (i!=[_components count]-1)
		[result appendString:@" "]; // IMPORTANT! Divider used is blank space, change it to whatever is suitable
	}
	self._lastReturnResult = result;
}

- (NSString*)methodResult
{
	return self._lastReturnResult;
}

- (void)SetValueForRowInComponent
{	
	int component = [[_parameters objectForKey:@"component"] intValue];
	int row = [[_parameters objectForKey:@"rowIndex"] intValue];
	if (component>=[_components count])
	{
		[_components addObject:[NSMutableArray new]];
		component = [_components count]-1;
	}
	NSString* value = [_parameters objectForKey:@"value"];
	
	NSMutableArray* array = [_components objectAtIndex:component];
	if (row>=[array count])
		[array addObject:value];
	else {
		[array replaceObjectAtIndex:row withObject:value];
	}
	[_picker reloadComponent:component];
}

#pragma mark -
#pragma mark delegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [[_components objectAtIndex:component] objectAtIndex:row];
}

#pragma mark -
#pragma mark datasource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return [_components count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [[_components objectAtIndex:component] count];
}

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
	[_components release];
	[super dealloc];
}


@end
