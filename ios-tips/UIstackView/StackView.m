//
//  StackView.m
//  ios-tips
//
//  Created by mac on 2018/5/29.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "StackView.h"
#import <Masonry.h>
@interface StackView ()
@property(nonatomic,strong)UIStackView *stackView;
@end

@implementation StackView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem setTitle:@"水平或者竖直布局"];
    [self HorizontalView];
    [self HorizontalViewSecond];
}
-(void)HorizontalView{
    NSMutableArray *stackViews = [NSMutableArray array];
    for (NSInteger i = 0; i <4; i ++) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
        [stackViews addObject:view];
    }
    self.stackView = [[UIStackView alloc]initWithArrangedSubviews:stackViews];
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution = UIStackViewDistributionFillEqually;
    self.stackView.spacing = 0;
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.frame = CGRectMake(0, 64, self.view.frame.size.width, 200);
    [self.view addSubview:self.stackView];
}
-(void)HorizontalViewSecond{
    NSMutableArray *views  = [NSMutableArray array];
    UIView *masonryView = [[UIView alloc]init];
    masonryView.frame = CGRectMake(0, CGRectGetMaxY(self.stackView.frame), self.view.frame.size.width, 200);
    [self.view addSubview:masonryView];
    for (int i = 0;  i < 4;  i ++) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor colorWithRed:arc4random() %256/255.0 green:arc4random() %256/255.0 blue:arc4random() %256/255.0 alpha:1.0];
        [masonryView addSubview:view];
        [views addObject:view];
    }
    [views mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
 //   __weak typeof (self)weakself = self;
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(masonryView);
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
