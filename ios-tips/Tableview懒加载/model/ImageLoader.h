//
//  ImageLoader.h
//  ios-tips
//
//  Created by mac on 2018/8/10.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppRecord.h"

typedef void(^imageCompletionBlock)();

@interface ImageLoader : NSObject

@property (nonatomic,strong)AppRecord *apprecord;

@property (nonatomic,strong)imageCompletionBlock completionBlock;

-(void)StartLoadimage;
-(void)CancelLoadImage;

@end
