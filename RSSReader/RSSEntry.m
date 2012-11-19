//
//  RSSEntry.m
//  RSSReader
//
//  Created by Администратор on 11/11/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "RSSEntry.h"

@implementation RSSEntry

@synthesize articleTitle = _articleTitle;
@synthesize articleDate = _articleDate;
@synthesize articleLink = _articleLink;
@synthesize articleDescription = _articleDescription;
@synthesize articleImageLink = _articleImageLink;


- (void)dealloc {
    
    _articleTitle = nil;
    _articleLink = nil;
    _articleDate = nil;
    _articleDescription = nil;
    _articleImageLink = nil;
    [super dealloc];
}

@end


