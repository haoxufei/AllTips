//
//  UIView+Extension.m
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
-(void)RoundRectCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderwidth borderColoer:(UIColor *)borderColoer{
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderwidth;
    self.layer.borderColor = borderColoer.CGColor;
    self.layer.masksToBounds = YES;
}
-(void)Round:(CGFloat)borderWith borderColoer:(UIColor *)borderColoer{
    [self RoundRectCornerRadius:self.bounds.size.width*0.5 borderWidth:borderWith borderColoer:borderColoer];
}
-(void)Round{
    assert(self.bounds.size.width == self.bounds.size.height);
    [self Round:3 borderColoer:[UIColor blackColor]];
}
@end
