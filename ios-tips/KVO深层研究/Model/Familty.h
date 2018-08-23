//
//  Familty.h
//  ios-tips
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EcoPerson.h"
@interface Familty : NSObject

@property(nonatomic,strong)NSString *Name;

@property(nonatomic,strong)EcoPerson *person;

@property(nonatomic,strong)NSMutableArray *eocArray;

@end
