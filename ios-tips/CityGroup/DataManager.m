//
//  DataManager.m
//  ios-tips
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

static NSArray *_cityGroupArray = nil;
+(NSArray *)getAllCityGroup{
    if (!_cityGroupArray) {
        _cityGroupArray = [[self alloc]getCiryGroups];
    }
    return _cityGroupArray;
}
-(NSArray *)getCiryGroups{
    NSString *plist = [[NSBundle mainBundle]pathForResource:@"cityGroups.plist" ofType:nil];
    NSArray *cityGroups = [NSArray arrayWithContentsOfFile:plist];
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic  in cityGroups) {
        CityGroup *model = [CityGroup new];
        [model setValuesForKeysWithDictionary:dic];
        [array addObject:model];
    }
    return [array copy];
}
@end
