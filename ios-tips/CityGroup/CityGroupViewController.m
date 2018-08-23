//
//  CityGroupViewController.m
//  ios-tips
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "CityGroupViewController.h"
#import "DataManager.h"
#import "CityGroup.h"
@interface CityGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSArray *cityArray;

@end

@implementation CityGroupViewController
- (NSArray *)cityArray{
    if (!_cityArray) {
        _cityArray = [DataManager getAllCityGroup];
    }
    return _cityArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"城市列表"];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.tableFooterView = [UIView new];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cityArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CityGroup *CityGroups = self.cityArray[section];
    return CityGroups.cities.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CityGroup *city = self.cityArray[section];
    return city.title;
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.cityArray valueForKey:@"title"];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabcell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tabcell"];
    }
    CityGroup *citys = self.cityArray[indexPath.section];
    cell.textLabel.text = citys.cities[indexPath.row];
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
