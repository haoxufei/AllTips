//
//  Familty.m
//  ios-tips
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Familty.h"

@implementation Familty

-(instancetype)init{
    if (self = [super init]) {
        _person = [EcoPerson new];
        
        _eocArray = [NSMutableArray array];
    }
    return self;
}

/**
  默认返回yes是自动 no是非自动
 */
//+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
//    
//    if ([key isEqualToString:@"Name"]) {
//        
//        return NO;
//    }
//    return YES;
//    
//}

//-(void)setName:(NSString *)Name{
//    
//    [self willChangeValueForKey:@"Name"];
//    
//    _Name = @"name";
//    
//    [self didChangeValueForKey:@"Name"];
//}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key{
    
    NSSet *keyset = [super keyPathsForValuesAffectingValueForKey:key];
    
    if ([key isEqualToString:@"person"]) {
    
        NSSet *set =  [NSSet setWithObject:@"_person.age"];
        
        keyset = [keyset setByAddingObjectsFromSet:set];
    }
    
    return keyset;
    
}

@end
