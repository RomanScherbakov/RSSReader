//
//  DownloadData.m
//  RSSReader
//
//  Created by Администратор on 11/11/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "DownloadData.h"

@implementation DownloadData

@synthesize rssData = _rssData;
@synthesize connection = _connection;
@synthesize delegate = _delegate;

- (void)dealloc {
    self.rssData = nil;
    self.connection = nil;
    [_delegate release];
    [super dealloc];
}

+ (id)startDownload :(NSString*)url delegate:(id)delegate {
    
    //Dlog(@"In startDownload");
    DownloadData *request = [[DownloadData alloc] init];
    request.delegate = [delegate retain];
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *downloadUrl = [NSURL URLWithString:url];
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:downloadUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0f];
    
    request.connection = [[[NSURLConnection alloc] initWithRequest:theRequest delegate:request] autorelease];
    
    if(request.connection) {
        request.rssData = [[NSMutableData data] retain];
    }
    else {
        NSLog(@"Error!");
        [request.connection cancel];
    }
    return [request autorelease];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    NSLog(@"IN didReceiveData");
    [_rssData appendData:data];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    NSLog(@"IN didReceiveResponse");
    [_rssData setLength:0];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSString *dataString = [[NSString alloc] initWithData:_rssData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",dataString);
    
    SEL successSelector;
    
    successSelector = @selector(DownloadData:);
        
    if ([_delegate respondsToSelector:successSelector]) {
        [_delegate performSelector:successSelector withObject:self];
    }
    
    [dataString release];
    [_rssData release];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    [_rssData release];
    NSString *errorString = [[NSString alloc] initWithFormat:@"Connection failed! Error - %@ %@ %@",
                             [error localizedDescription],
                             [error description],
                             [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]];
    NSLog(@"%@",errorString);
    
}

@end
