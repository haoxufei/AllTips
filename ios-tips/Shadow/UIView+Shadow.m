//
//  UIView+Shadow.m
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView (Shadow)
-(void)ShadowColor:(UIColor *)shadowColor ShadowOpacity:(CGFloat)Opacity ShadowRadius:(CGFloat)Radius ShadowOff:(CGSize )shadowOff{
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = Opacity;
    self.layer.shadowRadius = Radius;
    self.layer.shadowOffset = CGSizeMake(shadowOff.width, shadowOff.height);
}
@end
