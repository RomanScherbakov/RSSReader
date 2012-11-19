//
//  RSSEntry.h
//  RSSReader
//
//  Created by Администратор on 11/11/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSEntry : NSObject {
    
    NSString *_articleTitle;
    NSString *_articleDate;
    NSString *_articleLink;
    NSString *_articleDescription;
    NSString *_articleImageLink;
    
}

@property (nonatomic, retain) NSString *articleTitle;
@property (nonatomic, retain) NSString *articleDate;
@property (nonatomic, retain) NSString *articleLink;
@property (nonatomic, retain) NSString *articleDescription;
@property (nonatomic, retain) NSString *articleImageLink;

@end
