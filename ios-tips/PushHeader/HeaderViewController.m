//
//  HeaderViewController.m
//  ios-tips
//
//  Created by mac on 2018/8/7.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HeaderViewController.h"
#import "EOCCustomNavBar.h"
static const CGFloat headHeight = 160;
static const CGFloat ratio = 0.8;
#define SCREENSIZE [UIScreen mainScreen].bounds.size
#define GREENCOLOR [UIColor colorWithRed:87/255.0 green:173/255.0 blue:104/255.0 alpha:1.0]
@interface HeaderViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HeaderViewController{
    EOCCustomNavBar *navBar;
    UIImageView *bgview;
    CGRect originalFrame;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //背景图片
    bgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, ratio *self.view.frame.size.width)];
    bgview.image = [UIImage imageNamed:@"bg-mine"];
    originalFrame = bgview.frame;
    [self.view addSubview:bgview];
    
    //导航啦
    navBar = [[EOCCustomNavBar alloc]init];
    navBar.title = @"郝旭飞";
    navBar.leftImage = @"Mail";
    navBar.rightImage = @"Setting";
    navBar.titleColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    UITableView *tableview= [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENSIZE.width, SCREENSIZE.height - 64) style:UITableViewStylePlain];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.showsVerticalScrollIndicator = NO;
    tableview.delegate = self;
    tableview.dataSource = self;
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, headHeight)];
    headerView.backgroundColor = [UIColor clearColor];
    tableview.tableHeaderView = headerView;
    
    [self.view addSubview:tableview];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"头部视图";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat yOffset = scrollView.contentOffset.y;  //往上滑动，offset是增加的，往下滑动，offset是减少的
    if (yOffset < headHeight) {   //当我滑动到导航栏底部之前
        
        CGFloat colorAlpha = yOffset/headHeight;
        navBar.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:colorAlpha];
        navBar.leftImage = @"Mail";
        navBar.rightImage = @"Setting";
        navBar.titleColor = [UIColor whiteColor];
        
    } else {  //超过导航栏底部了
        
        navBar.backgroundColor = [UIColor whiteColor];
        navBar.leftImage = @"Mail-click";
        navBar.rightImage = @"Setting-click";
        navBar.titleColor = GREENCOLOR;
        
    }
    
    //往上移动效果、处理放大效果
    if (yOffset > 0) {    //往上移动

        bgview.frame = ({

            CGRect frame = originalFrame;
            frame.origin.y = originalFrame.origin.y-yOffset;
            frame;

        });

    } else {  //往下移动

        // 复合语句
        bgview.frame = ({

            CGRect frame = originalFrame;
            frame.size.height = originalFrame.size.height - yOffset;
            frame.size.width = frame.size.height/ratio;
            frame.origin.x = originalFrame.origin.x - (frame.size.width-originalFrame.size.width)/2;
            frame;

        });

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
