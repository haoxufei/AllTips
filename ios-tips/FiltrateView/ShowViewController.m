//
//  ShowViewController.m
//  ios-tips
//
//  Created by mac on 2018/5/31.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ShowViewController.h"
#import "FiltrateView.h"
@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    FiltrateView *show = [[FiltrateView alloc]initWithFrame:CGRectMake(0, -64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:show];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"SHOW" style:UIBarButtonItemStyleDone target:self action:@selector(SHOVIEW)];
    
}
-(void)SHOVIEW{
   __block FiltrateView *show;
    [UIView animateWithDuration:0.1 animations:^{
        show = [[FiltrateView alloc]initWithFrame:CGRectMake(0, -64, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:show];
        show.alpha = 0;
    } completion:^(BOOL finished) {
        show.alpha = 1;
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
