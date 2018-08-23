//
//  Mvcmodel.m
//  ios-tips
//
//  Created by mac on 2018/7/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mvcmodel.h"

@implementation Mvcmodel
+(instancetype)getWeatherData:(NSDictionary *)dic_w{
    return [[self alloc]initWithWeather:dic_w];
}
-(instancetype)initWithWeather:(NSDictionary *)dic_d{
    if (self = [super init]) {
        NSDictionary *data_dic = [dic_d objectForKey:@"result"][@"data"][@"realtime"];
        self.city_name = [data_dic objectForKey:@"city_name"];
        self.date = [data_dic objectForKey:@"date"];
        self.time = [data_dic objectForKey:@"time"];
        self.week = [data_dic objectForKey:@"week"];
        self.moon = [data_dic objectForKey:@"moon"];
        
        NSDictionary *weather_dic = [data_dic objectForKey:@"weather"];
        self.temperature = [weather_dic objectForKey:@"temperature"];
        self.humidity = [weather_dic objectForKey:@"humidity"];
        self.info = [weather_dic objectForKey:@"info"];
        self.img = [weather_dic objectForKey:@"img"];
        
        NSDictionary *wind_dic = [data_dic objectForKey:@"wind"];
        self.direct = [wind_dic objectForKey:@"direct"];
        self.power = [wind_dic objectForKey:@"power"];
        self.offset = [wind_dic objectForKey:@"offset"];
        self.windspeed = [wind_dic objectForKey:@"windspeed"];
        
        NSDictionary *life_dic =[dic_d objectForKey:@"result"][@"data"][@"life"][@"info"];
        NSArray *kongtiaoArray = [life_dic objectForKey:@"kongtiao"];
        self.kongtiao = [kongtiaoArray componentsJoinedByString:@" "];
        
        NSArray *guominArray = [life_dic objectForKey:@"guomin"];
        self.guomin = [guominArray componentsJoinedByString:@" "];
        
        NSArray *shushiduArray = [life_dic objectForKey:@"shushidu"];
        self.shushidu = [shushiduArray componentsJoinedByString:@" "];
        
        NSArray *chuangyiArray = [life_dic objectForKey:@"chuanyi"];
        self.chuanyi = [chuangyiArray componentsJoinedByString:@" "];
        
        NSArray *diaoyuArray = [life_dic objectForKey:@"diaoyu"];
        self.diaoyu = [diaoyuArray componentsJoinedByString:@" "];
        
        NSArray *ganmaoArray = [life_dic objectForKey:@"ganmao"];
        self.ganmao = [ganmaoArray componentsJoinedByString:@" "];
        
        NSArray *ziwaixianArrray = [life_dic objectForKey:@"ziwaixian"];
        self.ziwaixian = [ziwaixianArrray componentsJoinedByString:@" "];
        
        NSArray *xicheArray = [life_dic objectForKey:@"xiche"];
        self.xiche = [xicheArray componentsJoinedByString:@" "];
        
        NSArray *yongdongArray = [life_dic objectForKey:@"yundong"];
        self.yundong = [yongdongArray componentsJoinedByString:@" "];
        
        NSArray *daisanArray = [life_dic objectForKey:@"daisan"];
        self.daisan = [daisanArray componentsJoinedByString:@" "];
       //未来几天的天气
        NSArray *fu_weather = [dic_d objectForKey:@"result"][@"data"][@"weather"];
        NSMutableArray *MuArray_fu = [NSMutableArray array];
        for (int i = 0; i < fu_weather.count; i ++) {
            FutterModel *model = [FutterModel new];
            model.date_fu = [fu_weather[i] objectForKey:@"date"];
            model.week_fu = [fu_weather[i] objectForKey:@"week"];
            model.nongli = [fu_weather[i] objectForKey:@"nongli"];
            NSDictionary *fu_info = [fu_weather[i] objectForKey:@"info"];
            NSArray *dawnArray = [fu_info objectForKey:@"dawn"];
            NSArray *dayArray = [fu_info objectForKey:@"day"];
            NSArray *nightArray = [fu_info objectForKey:@"night"];
            model.dawnArray = dawnArray;
            model.dayArray = dayArray;
            model.nightArray = nightArray;
            [MuArray_fu addObject:model];
        }
        self.futterArray = [MuArray_fu copy];
    }
    return self;
}
@end
