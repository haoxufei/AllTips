//
//  NumbetFormatter.m
//  ios-tips
//
//  Created by mac on 2018/5/22.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NumbetFormatter.h"

@interface NumbetFormatter ()

@end

@implementation NumbetFormatter

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"NumbetFormatter介绍"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSNumberFormatter *Numformatter = [[NSNumberFormatter alloc]init];
    NSNumber *number = [NSNumber numberWithDouble:1234];
    Numformatter.numberStyle =  NSNumberFormatterNoStyle;//去掉小数点
   // Numformatter.numberStyle = NSNumberFormatterDecimalStyle;//以国际话格式输出 保留三位小数 第四位小数四舍五入 12,345.656
   // Numformatter.numberStyle = NSNumberFormatterPercentStyle; ///以百分制形式输出  整个数字乘以保留2为小数,第三位小数四舍五入,然后乘以100,同时在最后加上百分号
    //转换成字符串
    //Numformatter.numberStyle = NSNumberFormatterSpellOutStyle;
    //Numformatter.positivePrefix = @"/";//前缀
   // Numformatter.positiveSuffix = @"/";//后缀
    Numformatter.groupingSize = 2;
    NSString *strOfFormatter = [Numformatter stringFromNumber:number];
    NSLog(@"输入字符串:%@",strOfFormatter);
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
