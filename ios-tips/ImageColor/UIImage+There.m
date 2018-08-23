//
//  UIImage+There.m
//  ios-tips
//
//  Created by mac on 2018/5/29.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIImage+There.h"

@implementation UIImage (There)
-(UIImage *)imageForthemeColor:(UIColor *)color{
    return [self imageForThemeColor:color blenMode:kCGBlendModeOverlay];
}
-(UIImage *)imageForThemeColor:(UIColor *)color blenMode:(CGBlendMode)blenmode{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [color setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    [self drawInRect:bounds blendMode:blenmode alpha:1.0];
    if (blenmode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  image;
}
@end
