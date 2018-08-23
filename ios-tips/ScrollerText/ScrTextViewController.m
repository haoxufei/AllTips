//
//  ScrTextViewController.m
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ScrTextViewController.h"
#import <SDCycleScrollView.h>
@interface ScrTextViewController ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>

@end

@implementation ScrTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titleArray = [NSArray arrayWithObjects:@"还有两个小时就下班了",@"今天是星期三",@"明天就是星期四",@"还有三天就是六一儿童节", nil];
    UIScrollView *scroll=[[UIScrollView alloc]init];
    
    scroll.frame=CGRectMake(0, 64, self.view.frame.size.width, 30);
    
    scroll.delegate=self;
    
    scroll.pagingEnabled= NO;
    
    //是否显示水平方向上的指示器滚动条
    
    scroll.showsHorizontalScrollIndicator  = YES;
    
    //是否显示竖直方向上的指示器滚动条
    
    scroll.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scroll];
    for (int i=0; i< titleArray.count;i++){
        SDCycleScrollView *SDScrollview=[SDCycleScrollView cycleScrollViewWithFrame:scroll.bounds delegate:self placeholderImage:[UIImage imageNamed:@"750-400"]];
        /** 只展示文字轮播 */
        SDScrollview.onlyDisplayText=YES;
        /** 是否自动滚动,默认Yes */
        SDScrollview.autoScroll=YES;
        //轮播时间
        
        SDScrollview.autoScrollTimeInterval =2;
        
        //字体高度
        
        SDScrollview.titleLabelHeight= 100;
        
        //字体颜色
        
        SDScrollview.titleLabelTextColor=[UIColor yellowColor];
        
        //背景颜色
        
        SDScrollview.titleLabelBackgroundColor=[UIColor grayColor];
        
        //字体大小
        
        SDScrollview.titleLabelTextFont=[UIFont systemFontOfSize:14];
        
        //字体数组
        
        SDScrollview.titlesGroup= titleArray;
        
        //上下滚动
    SDScrollview.scrollDirection=UICollectionViewScrollDirectionVertical;
        
        [scroll addSubview:SDScrollview];
        
        scroll.contentSize=CGSizeMake(0,i*60);
    }
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
