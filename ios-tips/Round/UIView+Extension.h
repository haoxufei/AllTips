//
//  UIView+Extension.h
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
//设置圆形图片
-(void)Round;
-(void)Round:(CGFloat)borderWith borderColoer:(UIColor *)borderColoer;
//圆角矩形
-(void)RoundRectCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderwidth borderColoer:(UIColor*)borderColoer;
@end
