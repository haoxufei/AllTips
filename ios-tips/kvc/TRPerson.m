//
//  TRPerson.m
//  ios-tips
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TRPerson.h"

@implementation TRPerson
-(instancetype)initWithName:(NSString *)name Withage:(int)age{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}

-(id)valueForUndefinedKey:(NSString *)key{
    return @"没有当前的这个key";
}
//C语言的基本数据类型赋值为nil时 自动调用下面的方法,需要强制赋值一个值
-(void)setNilValueForKey:(NSString *)key{
    if ([key isEqualToString:@"age"]) {
        [self setValue:@18 forKey:@"age"];
    }
}
@end
