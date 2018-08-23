//
//  NetWorkingWeather.h
//  ios-tips
//
//  Created by mac on 2018/7/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeathManger.h"
#import <AFNetworking.h>
#define APPKEY @"542d4211156a0e3861513d1ba5401f31"
@interface NetWorkingWeather : NSObject

/**
 天气接口

 @param urlStr 请求的url
 @param success 成功
 @param fial 失败
 */
+(void)FetchWeatherData:(NSString *)urlStr Success:(void(^)(NSArray *dataArray))success Fial:(void(^)(NSError *error))fial;
                                                    
@end
