

//
//  StepViewController.m
//  ios-tips
//
//  Created by mac on 2018/6/1.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "StepViewController.h"
#import "XFStepView.h"
@interface StepViewController ()
@property(nonatomic,strong)XFStepView *stepView;
@end

@implementation StepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _stepView = [[XFStepView alloc]initWithFrame:CGRectMake(0, 72, self.view.frame.size.width, 60) Titles:[NSArray arrayWithObjects:@"第一步",@"第二步",@"第三步",@"第四步",@"第五步",@"第六步",@"第七步",@"第八步",nil]];
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.stepView.frame) + 50, self.view.frame.size.width, 44)];
    [btn1 addTarget:self action:@selector(UpToStep:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"上一步" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIButton *bnt2 = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn1.frame)+10, self.view.frame.size.width, 44)];
    [bnt2 addTarget:self action:@selector(NextToStep:) forControlEvents:UIControlEventTouchUpInside];
    [bnt2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bnt2 setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [self.view addSubview:bnt2];
    [self.view addSubview:_stepView];
    
}
-(void)UpToStep:(UIButton *)sender{
    int step = _stepView.stepIndex;
    [_stepView setStepIndex:step - 1 Animation:YES];
}
-(void)NextToStep:(UIButton *)sender{
    int step = _stepView.stepIndex;
    [_stepView setStepIndex:step + 1 Animation:YES];
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
