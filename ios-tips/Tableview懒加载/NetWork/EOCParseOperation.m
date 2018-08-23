//
//  EOCParseOperation.m
//  ECETableView
//
//  Created by caoyl on 16-12-8.
//  Copyright (c) 2016年 @八点钟学院. All rights reserved.
//

#import "EOCParseOperation.h"
#import "AppRecord.h"

@implementation EOCParseOperation

- (void)main
{
    elementArr = @[@"im:name", @"im:image", @"im:artist"];
    elementContent = [NSMutableString string];
    _parseDataArr = [NSMutableArray array];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:_data];
    parser.delegate = self;
    [parser parse];
    
}

#pragma mark - NSXMLParser delegate method
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"entry"]) {
        
        isParseBegin = YES;
        appRecord = [[AppRecord alloc] init];
        
    }
    
    if (isParseBegin && [elementArr containsObject:elementName]) {  //如果当前的xml节点element是我们想要的
        
        isElementShouldParse = YES;
        
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (isElementShouldParse) {  //该节点正是我们需要解析的
        
        [elementContent appendString:string];
        
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
        if (isElementShouldParse) {
            
            NSString *tmpElementContent = [elementContent stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [elementContent setString:@""];
            
            if ([elementName isEqualToString:@"im:name"]) {
                
                appRecord.AppName = tmpElementContent;
                
            } else if ([elementName isEqualToString:@"im:image"]) {
                
                appRecord.imageUrlString = tmpElementContent;
                
            } else if ([elementName isEqualToString:@"im:artist"]) {
                
                appRecord.artist = tmpElementContent;
                
            }
            
        }
    
    if ([elementName isEqualToString:@"entry"]) {
        
        [_parseDataArr addObject:appRecord];
        
    }
    
}

- (void)dealloc
{
    NSLog(@"parse dealloc");
}
@end
