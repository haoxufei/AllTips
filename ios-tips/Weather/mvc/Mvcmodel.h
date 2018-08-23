//
//  Mvcmodel.h
//  ios-tips
//
//  Created by mac on 2018/7/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FutterModel.h"
@interface Mvcmodel : NSObject
@property (nonatomic,copy) NSString *city_name;/*城市*/
@property (nonatomic,copy) NSString *date;/*日期*/
@property (nonatomic,copy) NSString *time;/*更新时间*/
@property (nonatomic,copy) NSString *week;
@property (nonatomic,copy) NSString *moon;
@property (nonatomic,copy) NSString *temperature;/*温度*/
@property (nonatomic,copy) NSString *humidity;/*湿度*/
@property (nonatomic,copy) NSString *info;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *direct;/* 台风*/
@property (nonatomic,copy) NSString *power;/* 几级*/
@property (nonatomic,copy) NSString *offset;
@property (nonatomic,copy) NSString *windspeed;
@property (nonatomic,copy) NSString *chuanyi;/*穿衣指数*/
@property (nonatomic,copy) NSString *ganmao;/*感冒指数*/
@property (nonatomic,copy) NSString *kongtiao;/*空调指数*/
@property (nonatomic,copy) NSString *xiche;/*洗车指数*/
@property (nonatomic,copy) NSString *yundong; /*运动指数*/
@property (nonatomic,copy) NSString *ziwaixian; /*紫外线*/
@property (nonatomic,copy) NSString *guomin; /*过敏*/
@property (nonatomic,copy) NSString *shushidu; /*舒适度*/
@property (nonatomic,copy) NSString *diaoyu; /*钓鱼*/
@property (nonatomic,copy) NSString *daisan; /*带伞*/
@property (nonatomic,strong) NSArray *futterArray;/*未来几天的天气数据*/
+(instancetype)getWeatherData:(NSDictionary *)dic_w;

@end
