//
//  jsonViewController.m
//  ios-tips
//
//  Created by mac on 2018/7/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "jsonViewController.h"
#import "NetWorkingWeather.h"
#import "Mvcmodel.h"
#import "FutterViewController.h"
@interface jsonViewController ()
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *WeatherLabel;
@property (strong, nonatomic) IBOutlet UILabel *WindLabel;
@property (strong, nonatomic) IBOutlet UILabel *LifeLabel;

@end

@implementation jsonViewController{
    Mvcmodel *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"天气"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"未来天气" style:UIBarButtonItemStyleDone target:self action:@selector(FutterWeather)];
    NSString *UrlStr = [NSString stringWithFormat:@"http://op.juhe.cn/onebox/weather/query"];
    [NetWorkingWeather FetchWeatherData:UrlStr Success:^(NSArray *dataArray) {
        self->model =  [dataArray firstObject];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.date.text = [NSString stringWithFormat:@"时间:%@ %@ 农历:%@ 星期:%@",self->model.date,self->model.time,self->model.moon,self->model.week];
            self.WindLabel.text = [NSString stringWithFormat:@"温度:%@ 湿度:%@,%@",self->model.temperature,self->model.humidity,self->model.info];
            self.WindLabel.text = [NSString stringWithFormat:@"%@ %@",self->model.direct,self->model.power];
            self.LifeLabel.text = [NSString stringWithFormat:@"穿衣指数:%@\r\n感冒指数:%@\r\n空调指数:%@\r\n洗车指数:%@\r\n运动指数:%@\r\n紫外线指数:%@\r\n过敏指数:%@\r\n带伞指数:%@",self->model.chuanyi,self->model.ganmao,self->model.kongtiao,self->model.xiche,self->model.yundong,self->model.ziwaixian,self->model.guomin,self->model.daisan];
        });
    } Fial:^(NSError *error) {
        NSLog(@"错误信息:%@",error);
    }];
}
-(void)FutterWeather{
    FutterViewController *futterVC = [[FutterViewController alloc]init];
    futterVC.Arrayfu = model.futterArray;
    [self.navigationController pushViewController:futterVC animated:YES];
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
