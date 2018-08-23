//
//  Annimation.m
//  ios-tips
//
//  Created by mac on 2018/8/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Annimation.h"
#import "AnnimationView.h"
@implementation Annimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 1.f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //transitionContext :fromView fromViewontroller ToView ToViewConteroller containerView
    
    UIView *containerView = transitionContext.containerView;
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [containerView addSubview:toView];
    
    AnnimationView *annimationView = [[AnnimationView alloc]initWithFrame:toView.bounds];
    [containerView addSubview:annimationView];
    
    //截屏
    UIGraphicsBeginImageContext(toView.frame.size);
    [toView.layer  renderInContext:UIGraphicsGetCurrentContext()];
    annimationView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    toView.hidden = YES;
    
   //annimationView:他是从floatingBtn当前的frame 展开到toview.frame
    
    [annimationView StaterAnnimationWithView:toView fromRect:self.curframe ToRect:toView.frame];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [transitionContext completeTransition:YES];//移除fromView fromcontroller
    });
    
}
@end
