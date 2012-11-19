//
//  DownloadData.h
//  RSSReader
//
//  Created by Администратор on 11/11/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadData : NSObject<NSURLConnectionDelegate>{
    
    id _delegate;
    NSMutableData *_rssData;
    NSURLConnection *_connection;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) NSMutableData *rssData;
@property (nonatomic, retain) NSURLConnection *connection;

+ (id) startDownload :(NSString*)url delegate:(id)delegate;

@end
