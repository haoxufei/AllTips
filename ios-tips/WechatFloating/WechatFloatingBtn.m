//
//  WechatFloatingBtn.m
//  ios-tips
//
//  Created by mac on 2018/8/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "WechatFloatingBtn.h"
#import "EOCSemiCircleView.h"
#import "EOCNextViewController.h"
#import "Annimation.h"

#define fixspace  160.f

@interface WechatFloatingBtn ()<UINavigationControllerDelegate>

@end

@implementation WechatFloatingBtn{
    CGPoint lastpoint;
    CGPoint pointInself;
}
static WechatFloatingBtn *floatBtn = nil;
static EOCSemiCircleView * semicircile = nil;
+(void)show{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        floatBtn = [[WechatFloatingBtn alloc]initWithFrame:CGRectMake(10, 200, 60, 60)];
        semicircile = [[EOCSemiCircleView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height, fixspace, fixspace)];
    });
    if (!semicircile.superview) {
        [[UIApplication sharedApplication].keyWindow addSubview:semicircile];
        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:semicircile];
    }
    if (!floatBtn.superview) {
        //添加图片
        [[UIApplication sharedApplication].keyWindow addSubview:floatBtn];
        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:floatBtn];
    }
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //赋值图片
        self.layer.contents = (__bridge id)[UIImage imageNamed:@"FloatBtn"].CGImage;
    }
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    lastpoint = [touch locationInView:self.superview];
    pointInself = [touch locationInView:self];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint curpoint = [touch locationInView:self.superview];
    //四分之一展开
    if (CGRectEqualToRect(semicircile.frame, CGRectMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height, fixspace, fixspace))) {
        semicircile.frame = CGRectMake([UIScreen mainScreen].bounds.size.width -fixspace, [UIScreen mainScreen].bounds.size.height - fixspace, fixspace, fixspace);
    }

    //计算出floatBtnCenter坐标
    CGFloat centerX = curpoint.x + (self.frame.size.width/2 - pointInself.x);
    CGFloat centerY = curpoint.y + (self.frame.size.height/2 - pointInself.y);
    
    //限制center的范围
    CGFloat X = MAX(30, MIN([UIScreen mainScreen].bounds.size.width - 30, centerX));
    CGFloat Y = MAX(30, MIN([UIScreen mainScreen].bounds.size.height - 30, centerY));
    self.center = CGPointMake(X, Y);
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint curpoint = [touch locationInView:self.superview];
    
    //点击
    if (CGPointEqualToPoint(lastpoint, curpoint)) {
        UINavigationController *nanvi = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        nanvi.delegate = self;
        EOCNextViewController *nectVC = [[EOCNextViewController alloc]init];
        [nanvi pushViewController:nectVC animated:YES];
        return;
    }
    //四分之圆的收缩
    [UIView animateWithDuration:0.2f animations:^{
        CGFloat distens = sqrt(pow([UIScreen mainScreen].bounds.size.width - self.center.x, 2) + pow([UIScreen mainScreen].bounds.size.height - self.center.y, 2));
        if (distens <= fixspace - 30.f) {
            [self removeFromSuperview];
        }
    semicircile.frame =  CGRectMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height, fixspace, fixspace);
        
    }];

    
    //距离左右两侧的距离
    CGFloat leftMagin  = self.center.x;
    CGFloat rightMagin = [UIScreen mainScreen].bounds.size.width - leftMagin;
    if (leftMagin < rightMagin) {
        [UIView animateWithDuration:0.2f animations:^{
            self.center = CGPointMake(40, self.center.y);
        }];
    }else{
        [UIView animateWithDuration:0.2f animations:^{
            self.center = CGPointMake([UIScreen mainScreen].bounds.size.width - 40, self.center.y);
        }];
    }
}

//自定义专场动画
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        Annimation *annimation = [Annimation new];
        annimation.curframe =  self.frame;
        return annimation;
    }
       
    return nil;
}
@end

