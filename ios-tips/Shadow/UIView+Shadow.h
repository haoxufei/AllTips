//
//  UIView+Shadow.h
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shadow)
/**
 shadowColoer 阴影的颜色
 Opacity 阴影的透明度
 Radius 阴影的圆角
 shadowOff 阴影偏移量
 */
-(void)ShadowColor:(UIColor *)shadowColor ShadowOpacity:(CGFloat)Opacity ShadowRadius:(CGFloat)Radius ShadowOff:(CGSize)shadowOff;
@end
