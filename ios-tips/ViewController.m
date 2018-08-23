//
//  ViewController.m
//  ios-tips
//
//  Created by mac on 2018/6/1.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "ViewController.h"
#import "VolumeViewController.h"
#import "NumbetFormatter.h"
#import "StackView.h"
#import "ImageViewController.h"
#import "RoundViewController.h"
#import "ShadowViewController.h"
#import "PageViewController.h"
#import "ScrTextViewController.h"
#import "PicViewController.h"
#import "ShowViewController.h"
#import "StepViewController.h"
#import "KVOViewController.h"
#import "KVCViewController.h"
#import "CityGroupViewController.h"
#import "jsonViewController.h"
#import "HeaderViewController.h"
#import "WeChatViewController.h"
#import "LazyTableViewController.h"
#import "MasonyViewController.h"
#import "DeepKVOViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *Numarray;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreatedTabview];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.Numarray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [self.Numarray objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            VolumeViewController *VolemeVC = [[VolumeViewController alloc]init];
            [self.navigationController pushViewController:VolemeVC animated:YES];
        }
            break;
        case 1:{
            NumbetFormatter *Nummatter = [[NumbetFormatter alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 2:{
            StackView *Nummatter = [[StackView alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 3:{
            ImageViewController *Nummatter = [[ImageViewController alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 4:{
            RoundViewController *Nummatter = [[RoundViewController alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 5:{
            ShadowViewController*Nummatter = [[ShadowViewController alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 6:{
            PageViewController *Nummatter = [[PageViewController alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 7:{
            ScrTextViewController *Nummatter = [[ScrTextViewController alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 8:{
            PicViewController *Nummatter = [[PicViewController alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 9:{
            ShowViewController *Nummatter = [[ShowViewController alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 10:{
            StepViewController *Nummatter = [[StepViewController alloc]init];
            [self.navigationController pushViewController:Nummatter animated:YES];
        }
            break;
        case 11:{
            KVOViewController *kvoVC = [[KVOViewController alloc]init];
            [self.navigationController pushViewController:kvoVC animated:YES];
        }
            break;
        case 12:{
            KVCViewController *kvcVC = [[KVCViewController alloc]init];
            [self.navigationController pushViewController:kvcVC animated:YES];
        }
            break;
        case 13:{
            CityGroupViewController *xictyVC = [[CityGroupViewController alloc]init];
            [self.navigationController pushViewController:xictyVC animated:YES];
        }
            break;
        case 14:{
            jsonViewController *jsonVC  = [[jsonViewController alloc] init];
            [self.navigationController pushViewController:jsonVC animated:YES];
        }
            break;
        case 15:{
            HeaderViewController *headerVC  = [[HeaderViewController alloc] init];
            [self.navigationController pushViewController:headerVC animated:YES];
        }
            break;
        case 16:{
            WeChatViewController *weChatVC = [[WeChatViewController alloc]init];
            [self.navigationController pushViewController:weChatVC animated:YES];
        }
            break;
        case 17:{
            LazyTableViewController *lazyVC= [[LazyTableViewController alloc]init];
            [self.navigationController pushViewController:lazyVC animated:YES];
        }
            break;
        case 18:{
            MasonyViewController *MasonyVC= [[MasonyViewController alloc]init];
            [self.navigationController pushViewController:MasonyVC animated:YES];
        }
            break;
        case 19:{
            DeepKVOViewController *DeepVC = [[DeepKVOViewController alloc]init];
            [self.navigationController pushViewController:DeepVC animated:YES];
        }
            break;
        default:
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)CreatedTabview{
    [self.navigationItem setTitle:@"ios知识集"];
    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.tableFooterView = [UIView new];
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableview];
    self.Numarray = [NSMutableArray arrayWithObjects:@"Volume",@"NumbetFormatter介绍",@"水平或者竖直布局的方案",@"改变图片的颜色",@"圆头像",@"shadow",@"滚动显示图片",@"滚动显示文字",@"饼图",@"筛选页",@"进度条",@"KVO",@"KVC",@"城市列表",@"今日天气",@"头部视图",@"微信悬浮窗",@"懒加载tabelview",@"Masony使用",@"kvo深入研究",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
