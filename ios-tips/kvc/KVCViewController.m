//
//  KVCViewController.m
//  ios-tips
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KVCViewController.h"
#import "TRPerson.h"
#import "Address.h"
@interface KVCViewController ()

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    TRPerson *P = [[TRPerson alloc]initWithName:@"Tom" Withage:18];
    //点语法获取值
    NSLog(@"初始赋值name:%@,age:%d",P.name,P.age);
    //方法一kvc获取值
    NSString *name = [P valueForKey:@"name"];
    NSLog(@"kvcname:%@,age:%@",name,[P valueForKey:@"age"]);
    //获取一个没有的属性
    NSLog(@"没有属性的值%@",[P valueForKey:@"name1"]);
    //kvc赋值
    TRPerson *P2 = [[TRPerson alloc]init];
    [P2 setValue:@"boby" forKey:@"name"];
    [P2 setValue:nil forKey:@"age"];
    NSLog(@"kvc赋值name:%@,age:%@",[P2 valueForKey:@"name"],[P2 valueForKey:@"age"]);
    //kvc第二种赋值和取值
    TRPerson *P3 = [TRPerson new];
    P3.address = [[Address alloc]init];
    [P3 setValue:@"太原市小马花园" forKeyPath:@"address.simpleAddress"];
    [P3 setValue:@"一单元一号楼30层3001" forKeyPath:@"address.detailaddress"];
    NSLog(@"kvc方式二:%@,%@",[P3 valueForKeyPath:@"address.simpleAddress"],[P3 valueForKeyPath:@"address.detailaddress"]);
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
