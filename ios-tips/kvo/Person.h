//
//  Person.h
//  ios-tips
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface Person : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)NSUInteger age;

@property(nonatomic,strong)Account *acconunt;

-(void)SetObserver;

@end
