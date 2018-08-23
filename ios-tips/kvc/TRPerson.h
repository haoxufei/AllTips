//
//  TRPerson.h
//  ios-tips
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
@interface TRPerson : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int age;
@property(nonatomic,strong)Address *address;
-(instancetype)initWithName:(NSString *)name Withage:(int)age;
@end
