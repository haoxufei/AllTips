//
//  PicView.m
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PicView.h"

@implementation PicView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    NSArray *data = @[@10,@30,@40,@20];
    //1.获取图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //2.拼接路径
    CGPoint center = CGPointMake(125, 125);
    CGFloat raudis = 120;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat EndA = 0;
    for (NSNumber *numbet in data) {
        //2.拼接路径
        startA = EndA;
        angle = numbet.intValue/100.0 *M_PI *2;
        EndA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:raudis startAngle:startA endAngle:EndA clockwise:YES];
        [path addLineToPoint:center];
        [[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1] set];
        //把路径添加到上下文
        CGContextAddPath(ref, path.CGPath);
        //把路径添加到上下文
        CGContextFillPath(ref);
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGFloat a = arc4random_uniform(6);
    
    NSLog(@"随机数 -- %f",a);
    
    [self setNeedsDisplay];
}
@end
