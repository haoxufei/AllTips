//
//  ShadowViewController.m
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ShadowViewController.h"
#import "UIView+Shadow.h"
#import "UIView+Extension.h"
@interface ShadowViewController ()

@end

@implementation ShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"shadow";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIView *shadowView = [[UIView alloc]init];
    shadowView.frame = CGRectMake(0, 0, self.view.frame.size.width - 20, 80);
    //shadowView.backgroundColor = [UIColor yellowColor];
    shadowView.center = self.view.center;
    //其实从偏移量上可以看出来，即使偏移量为(0,0)时，围绕view的四周依然能看到一定阴影
    [shadowView ShadowColor:[UIColor blackColor] ShadowOpacity:0.8 ShadowRadius:6 ShadowOff:CGSizeMake(0, 0)];
    //设置shadow 和 圆角
    UIView *subview = [[UIView alloc]initWithFrame:shadowView.bounds];
    [subview RoundRectCornerRadius:4 borderWidth:0 borderColoer:nil];
    subview.backgroundColor = [UIColor yellowColor];
    [shadowView addSubview:subview];
    [self.view addSubview:shadowView];
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
