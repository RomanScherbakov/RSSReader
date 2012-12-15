//
//  DetailViewController.m
//  RSSReader
//
//  Created by Администратор on 11/11/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "DetailViewController.h"
#import "AddThis.h"


@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

@synthesize webView = _webView;
@synthesize request = _request;

- (void)dealloc
{
    [_webView release];
    [_detailItem release];
    [_masterPopoverController release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];

        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.request = [self.detailItem request];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"New";
    
    [self.webView loadRequest:self.request];
    
    [_webView setScalesPageToFit:YES];
    
    [self configureView];
    
    [AddThisSDK setAddThisPubId:@"ra-50bd01ce50ef44c8"];
    [AddThisSDK setAddThisApplicationId:@"50bd214511c51365"];
    
    //facebook
    [AddThisSDK setFacebookAPIKey:@"142639829216575"];
	[AddThisSDK setFacebookAuthenticationMode:ATFacebookAuthenticationTypeDefault];
    
    //twitter
    [AddThisSDK setTwitterConsumerKey:@"ERuxzaMaikQEIUGq3gP5nw"];
    [AddThisSDK setTwitterConsumerSecret:@"k3J7h40aHUvYQQsMCG6Xh7tjMsTHqoiEodc4I7bFRw0"];
    [AddThisSDK setTwitterCallBackURL:@"http://addthis.com/mobilesdk/twittertesting"];
    [AddThisSDK setTwitterAuthenticationMode:ATTwitterAuthenticationTypeDefault];
}

- (IBAction)facebookButtonClicked:(id)sender {
	//share to facebook
    NSString *workStr = [NSString stringWithString:[[_request URL] absoluteString]];
	[AddThisSDK shareURL:workStr
			 withService:@"facebook"
				   title:@""
			 description:@""];
}

- (IBAction)twitterButtonClicked:(id)sender {
    //share to twitter
    NSString *workStr = [NSString stringWithString:[[_request URL] absoluteString]];
	[AddThisSDK shareURL:workStr
			 withService:@"twitter"
				   title:@""
			 description:@""];
}

- (IBAction)emailButtonClicked:(id)sender {
	//share to native email
    NSString *workStr = [NSString stringWithString:[[_request URL] absoluteString]];
	[AddThisSDK shareURL:workStr
			 withService:@"email"
				   title:@""
			 description:@""];
}

- (void)didInitiateShareForService:(NSString *)serviceCode {
	NSLog(@"Share started for service - %@",serviceCode);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
