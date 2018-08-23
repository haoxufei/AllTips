//
//  WeChatViewController.m
//  ios-tips
//
//  Created by mac on 2018/8/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "WeChatViewController.h"
#import "EOCNextViewController.h"
#define SCREENSIZE [UIScreen mainScreen].bounds.size


@interface UINavigationController (EOC)

@end

@implementation UINavigationController (EOC)

- (UIViewController *)childViewControllerForStatusBarStyle {
    
    if (self.navigationController.topViewController == self.childViewControllers[0]) {
        return self.childViewControllers[0];
    }
    
    return self.childViewControllers.lastObject;
    
}

@end

@interface WeChatViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *table;

@end

@implementation WeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self customNavigationBar];
    
    [self.view addSubview:self.table];

}
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
    
}
#pragma mark - 自定义导航栏
- (void)customNavigationBar {
    
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, [UIScreen mainScreen].bounds.size.width, 64.f)];
    navView.backgroundColor = [UIColor colorWithRed:74.f/255.f green:74.f/255.f blue:74.f/255.f alpha:1.f];
    
    [self.view addSubview:navView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"晚上八点半";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EOCNextViewController *nextViewCtrl = [EOCNextViewController new];
    [self.navigationController pushViewController:nextViewCtrl animated:YES];
}
#pragma mark - UITableView getter method
- (UITableView *)table {
    
    if (!_table) {
        
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 64.f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        
    }
    
    return _table;
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
