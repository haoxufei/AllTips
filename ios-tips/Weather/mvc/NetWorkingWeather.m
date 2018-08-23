//
//  NetWorkingWeather.m
//  ios-tips
//
//  Created by mac on 2018/7/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NetWorkingWeather.h"

@implementation NetWorkingWeather
+(void)FetchWeatherData:(NSString *)urlStr Success:(void(^)(NSArray *dataArray))success Fial:(void(^)(NSError *error))fial{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"key"] = APPKEY;
    dic[@"cityname"] = @"太原";
    AFHTTPSessionManager *SessionMag = [AFHTTPSessionManager manager];
    [SessionMag POST:urlStr parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *reason = [responseObject objectForKey:@"reason"];
        if ([reason isEqualToString:@"查询成功!"]) {
           NSArray *dataArray = [WeathManger getManagerWeather:responseObject];
            success(dataArray);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fial(error);
    }];
}
@end
