//
//  AnnimationView.m
//  ios-tips
//
//  Created by mac on 2018/8/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AnnimationView.h"

@interface AnnimationView ()<CAAnimationDelegate>


@end

@implementation AnnimationView{
    CAShapeLayer *shaplayer;
    UIView *toview;
}

-(void)StaterAnnimationWithView:(UIView *)theview fromRect:(CGRect)fromRect ToRect:(CGRect)torect{
    toview = theview;
    //mask 和floatingBtn大小一样mask
    shaplayer = [CAShapeLayer layer];
    shaplayer.path = [UIBezierPath bezierPathWithRoundedRect:fromRect cornerRadius:30.f].CGPath;
    self.layer.mask = shaplayer;
    CABasicAnimation *anmi = [CABasicAnimation animationWithKeyPath:@"path"];
    anmi.toValue = (__bridge id)[UIBezierPath bezierPathWithRoundedRect:torect cornerRadius:30.f].CGPath;
    anmi.duration = 0.5f;
    //保持原来的位置
    anmi.fillMode = kCAFillModeForwards;
    //执行完不移除
    anmi.removedOnCompletion = NO;
    anmi.delegate = self;
    [shaplayer addAnimation:anmi forKey:nil];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    toview.hidden = NO;
    [shaplayer removeAllAnimations];//动画移除
    [self removeFromSuperview];//图片移除
}

@end
