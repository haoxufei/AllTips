//
//  KVOViewController.m
//  ios-tips
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KVOViewController.h"
#import "Person.h"
#import "Account.h"
@interface KVOViewController ()

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *P = [[Person alloc]init];
    P.acconunt  = [[Account alloc]init];
    P.acconunt.balance = 100.0;
    [P SetObserver];
    P.acconunt.balance = 200.0;
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
