//
//  WeathManger.h
//  ios-tips
//
//  Created by mac on 2018/7/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mvcmodel.h"
@interface WeathManger : NSObject

+(NSArray *)getManagerWeather:(NSDictionary *)data_dic;
@end
