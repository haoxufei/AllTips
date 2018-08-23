//
//  AppRecord.h
//  ios-tips
//
//  Created by mac on 2018/8/10.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppRecord : NSObject

@property(nonatomic,strong)NSString *AppName;

@property(nonatomic,strong)NSString *imageUrlString;

@property(nonatomic,strong)NSString *artist;

@property(nonatomic,strong)UIImage *appIcon;

@end
