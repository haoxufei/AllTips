//
//  EOCParseOperation.h
//  ECETableView
//
//  Created by caoyl on 16-12-8.
//  Copyright (c) 2016年 @八点钟学院. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AppRecord;

@interface EOCParseOperation : NSOperation<NSXMLParserDelegate>
{
    BOOL isParseBegin;
    BOOL isElementShouldParse;
    NSArray *elementArr;
    NSMutableString *elementContent;
    AppRecord *appRecord;
}

@property(nonatomic, strong)NSData *data;
@property(nonatomic, strong) NSMutableArray *parseDataArr;
@end
