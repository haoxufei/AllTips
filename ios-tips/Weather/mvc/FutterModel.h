//
//  FutterModel.h
//  ios-tips
//
//  Created by mac on 2018/7/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FutterModel : NSObject
/*未来五天的天气情况*/
@property(nonatomic,copy) NSString *week_fu;/*星期*/
@property(nonatomic,copy) NSString *nongli;/*农历*/
@property(nonatomic,copy) NSString *date_fu;/*时间*/
@property(nonatomic,strong) NSArray *dawnArray;/*黎明*/
@property(nonatomic,strong) NSArray *dayArray;/*白天*/
@property(nonatomic,strong) NSArray *nightArray;/*晚上*/
@end
