//
//  PicViewController.m
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PicViewController.h"
#import "PicView.h"
#import "PiclabelView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface PicViewController ()
@property (nonatomic, strong) PiclabelView *pie;
@end

@implementation PicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PicView * pieView = [[PicView alloc]initWithFrame:CGRectMake(50, 72, 300, 300)];

    pieView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
   [self.view addSubview:pieView];
   _pie = [[PiclabelView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(pieView.frame) +20, 200, 200) dataItems:@[@2, @3, @2.5,@1,@1.5] colorItems:@[[UIColor redColor], [UIColor greenColor], [UIColor blueColor],[UIColor purpleColor],[UIColor brownColor]]];
    [self.view addSubview:_pie];
    [_pie stroke];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_pie stroke];
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
