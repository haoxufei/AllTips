//
//  ImageViewController.m
//  ios-tips
//
//  Created by mac on 2018/5/29.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ImageViewController.h"
#import "UIImage+There.h"
@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem setTitle:@"改变图片的颜色"];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 20, 30)];
    UIImageView *imageview1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 20, 30)];
    imageview.center = self.view.center;
    imageview1.frame = CGRectMake(imageview.frame.origin.x, imageview.frame.origin.y - 60, imageview.frame.size.width, imageview.frame.size.height);
    imageview1.image = [UIImage imageNamed:@"home_niaosuan"];
    imageview.image = [[UIImage imageNamed:@"home_niaosuan"]imageForthemeColor:[UIColor redColor]];
    [self.view addSubview:imageview1];
    [self.view addSubview:imageview];
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
