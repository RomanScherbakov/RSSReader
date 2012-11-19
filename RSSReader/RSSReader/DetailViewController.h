//
//  DetailViewController.h
//  RSSReader
//
//  Created by Администратор on 11/11/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate> {
    
    UIWebView *_webView;
    NSURLRequest *_request;
}

@property (strong, nonatomic) id detailItem;

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@property (nonatomic, retain) NSURLRequest *request;

@end
