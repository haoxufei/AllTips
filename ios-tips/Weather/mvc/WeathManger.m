//
//  WeathManger.m
//  ios-tips
//
//  Created by mac on 2018/7/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "WeathManger.h"

@implementation WeathManger
+ (NSArray *)getManagerWeather:(NSDictionary *)data_dic{
    NSMutableArray *Muarray = [NSMutableArray array];
    Mvcmodel *model = [Mvcmodel getWeatherData:data_dic];
    [Muarray addObject:model];
    return [Muarray copy];
}
@end
