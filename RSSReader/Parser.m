//
//  Parser.m
//  RSSReader
//
//  Created by Администратор on 11/13/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "Parser.h"

@implementation Parser

-(void) parse : (NSMutableData*) data : (NSMutableArray*) rssNews {

    TBXML *tbxml = [TBXML tbxmlWithXMLData:data];
    TBXMLElement * rootXMLElement = tbxml.rootXMLElement;
    
    if(rootXMLElement) {
        
        TBXMLElement *channel = [TBXML childElementNamed:@"channel" parentElement:rootXMLElement];
        
        if(channel) {
            
            
            TBXMLElement *item = [TBXML childElementNamed:@"item" parentElement:channel];
            
            while (item) {
                
                RSSEntry *entry = [[[RSSEntry alloc] init] autorelease];
                
                TBXMLElement *title = [TBXML childElementNamed:@"title" parentElement:item];
                TBXMLElement *link = [TBXML childElementNamed:@"link" parentElement:item];
                TBXMLElement *description = [TBXML childElementNamed:@"description" parentElement:item];
                TBXMLElement *pubDate = [TBXML childElementNamed:@"pubDate" parentElement:item];
                
                entry.articleTitle = [TBXML textForElement:title];
                entry.articleLink = [TBXML textForElement:link];
                entry.articleDescription = [TBXML textForElement:description];
                entry.articleDate = [TBXML textForElement:pubDate];
                
                [rssNews addObject:entry];
            
                
                item = [TBXML nextSiblingNamed:@"item" searchFromElement:item];
            }
        }
    }
}

@end
