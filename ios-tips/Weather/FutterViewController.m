//
//  FutterViewController.m
//  ios-tips
//
//  Created by mac on 2018/7/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FutterViewController.h"
#import "FutterModel.h"
@interface FutterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *Header;
@property (strong, nonatomic) IBOutlet UILabel *datelab1;
@property (strong, nonatomic) IBOutlet UILabel *daylab1;
@property (strong, nonatomic) IBOutlet UILabel *nightlab1;
@property (strong, nonatomic) IBOutlet UILabel *dawnlab1;


@property (strong, nonatomic) IBOutlet UILabel *datelab2;
@property (strong, nonatomic) IBOutlet UILabel *daylab2;
@property (strong, nonatomic) IBOutlet UILabel *nightlab2;
@property (strong, nonatomic) IBOutlet UILabel *dawnlab2;

@property (strong, nonatomic) IBOutlet UILabel *datelab3;
@property (strong, nonatomic) IBOutlet UILabel *daylab3;
@property (strong, nonatomic) IBOutlet UILabel *nightlab3;
@property (strong, nonatomic) IBOutlet UILabel *dawnlab3;

@property (strong, nonatomic) IBOutlet UILabel *datelab4;
@property (strong, nonatomic) IBOutlet UILabel *daylab4;
@property (strong, nonatomic) IBOutlet UILabel *nightlab4;
@property (strong, nonatomic) IBOutlet UILabel *dawnlab4;

@property (strong, nonatomic) IBOutlet UILabel *datelab5;
@property (strong, nonatomic) IBOutlet UILabel *daylab5;
@property (strong, nonatomic) IBOutlet UILabel *nightlab5;
@property (strong, nonatomic) IBOutlet UILabel *dawnlab5;

@end

@implementation FutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"未来天气"];
    [self ConfigTableview];
    [self ConfigHeaderView];
}
-(void)ConfigHeaderView{
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor whiteColor];
    tableview.tableFooterView = [UIView new];
    tableview.tableHeaderView = self.Header;
    tableview.tableHeaderView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height+60);
    [self.view addSubview:tableview];
}
-(void)ConfigTableview{
    for (int i = 0; i < self.Arrayfu.count; i ++) {
        FutterModel *model = [self.Arrayfu objectAtIndex:i];
        if (i == 0) {
            self.datelab1.text = [NSString stringWithFormat:@"时间:%@ 农历:%@ 星期:%@",model.date_fu,model.nongli,model.week_fu];
            self.dawnlab1.text = [model.dawnArray componentsJoinedByString:@" "];
            self.daylab1.text = [model.dayArray componentsJoinedByString:@" "];
            self.nightlab1.text = [model.nightArray componentsJoinedByString:@" "];
            
        }else if (i == 1){
            self.datelab2.text = [NSString stringWithFormat:@"时间:%@ 农历:%@ 星期:%@",model.date_fu,model.nongli,model.week_fu];
            self.dawnlab2.text = [model.dawnArray componentsJoinedByString:@" "];
            self.daylab2.text = [model.dayArray componentsJoinedByString:@" "];
            self.nightlab2.text = [model.nightArray componentsJoinedByString:@" "];
        }else if (i == 2){
            self.datelab3.text = [NSString stringWithFormat:@"时间:%@ 农历:%@ 星期:%@",model.date_fu,model.nongli,model.week_fu];
            self.dawnlab3.text = [model.dawnArray componentsJoinedByString:@" "];
            self.daylab3.text = [model.dayArray componentsJoinedByString:@" "];
            self.nightlab3.text = [model.nightArray componentsJoinedByString:@" "];
        }else if (i == 3){
            self.datelab4.text = [NSString stringWithFormat:@"时间:%@ 农历:%@ 星期:%@",model.date_fu,model.nongli,model.week_fu];
            self.dawnlab4.text = [model.dawnArray componentsJoinedByString:@" "];
            self.daylab4.text = [model.dayArray componentsJoinedByString:@" "];
            self.nightlab4.text = [model.nightArray componentsJoinedByString:@" "];
        }else if (i == 4){
            self.datelab5.text = [NSString stringWithFormat:@"时间:%@ 农历:%@ 星期:%@",model.date_fu,model.nongli,model.week_fu];
            self.dawnlab5.text = [model.dawnArray componentsJoinedByString:@" "];
            self.daylab5.text = [model.dayArray componentsJoinedByString:@" "];
            self.nightlab5.text = [model.nightArray componentsJoinedByString:@" "];
        }
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
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
