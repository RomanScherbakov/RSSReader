//
//  MasterViewController.h
//  RSSReader
//
//  Created by Администратор on 11/11/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parser.h"
#import "DetailViewController.h"

//@class DetailViewController;

@interface MasterViewController : UITableViewController {
    
    Parser *_parser;
    NSMutableArray *_news;
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic, retain) NSMutableArray *news;

@end
