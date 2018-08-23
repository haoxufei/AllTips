//
//  RoundViewController.m
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "RoundViewController.h"
#import "UIView+Extension.h"
@interface RoundViewController ()

@end

@implementation RoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"圆角头像";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *image = [[UIImageView alloc] init];
    CGSize frame = self.view.frame.size;
    [image setBackgroundColor:[UIColor yellowColor]];
    image.frame = CGRectMake(0, 64, 84, 44);
    [image Round:1 borderColoer:[UIColor redColor]];
    [self.view addSubview:image];
    
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(10, 128, frame.width - 20, 44);
    [btn RoundRectCornerRadius:22 borderWidth:1 borderColoer:[UIColor redColor]];
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn];
    
    UIImageView *image1 = [[UIImageView alloc] init];
    [image1 setBackgroundColor:[UIColor yellowColor]];
    image1.frame = CGRectMake(0, CGRectGetMaxY(btn.frame) + 20, 44, 44);
    [image1 Round];
    [self.view addSubview:image1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
