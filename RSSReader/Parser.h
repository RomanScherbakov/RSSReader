//
//  Parser.h
//  RSSReader
//
//  Created by Администратор on 11/13/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadData.h"
#import "TBXML.h"
#import "RSSEntry.h"

@interface Parser : NSObject

-(void) parse : (NSMutableData*) data : (NSMutableArray*) rssNews;

@end
