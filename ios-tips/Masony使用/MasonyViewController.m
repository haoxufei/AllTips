//
//  MasonyViewController.m
//  ios-tips
//
//  Created by mac on 2018/8/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "MasonyViewController.h"
#import <Masonry.h>
@interface MasonyViewController ()

@end

@implementation MasonyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //1.view屏幕居中 宽高300,300
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view1];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    /**
     1.mas_makeConstraints 只负责添加新的约束 Autolayout中不能同时存在两条针对于同一对象的的约束 否则报错
     2.mas_updateConstraints 针对上面的情况 会更新Block中出现的约束 确保不会出现两个相同的约束
     3.mas_remakeConstraints 会清除之前所有的约束 仅保留最新的约束
     mas_equalTo 除了支持Nsnumber数值类型外 还支持CGpoint CGsize UIedgeinsets
     */
    // 2.view2略小于supervew 15
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view2];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(15);
//        make.top.equalTo(self.view).with.offset(15);
//        make.right.equalTo(self.view).with.offset(-15);
//        make.bottom.equalTo(self.view).with.offset(-15);
        //等价
//        make.left.top.bottom.and.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(15, 15, 15, 15));
        //等价
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(15, 15, 15, 15));
    }];
    UIView *view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor redColor];
    [self.view addSubview:view3];
    
    UIView *view4 = [[UIView alloc]init];
    view4.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view4];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(view4.mas_left).with.offset(-15);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view4);
    }];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.left.equalTo(view3.mas_right).with.offset(15);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.height.equalTo(view3);
        make.width.equalTo(view3);
    }];
    
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
