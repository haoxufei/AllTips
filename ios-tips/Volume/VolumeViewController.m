//
//  VolumeViewController.m
//  ios-tips
//
//  Created by mac on 2018/5/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "VolumeViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
@interface VolumeViewController ()
@property(nonatomic,strong)MPVolumeView *Volume;
@property(nonatomic,strong)UISlider *volumeSlider;
@property(nonatomic,assign)CGFloat volumeValue;
@end

@implementation VolumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SettingVolume];
}

-(void)SettingVolume{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.volumeSlider = [[UISlider alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 20)];
    [self.view addSubview:self.volumeSlider];
    self.Volume = [[MPVolumeView alloc]init];
    self.Volume.showsRouteButton = NO;
    self.Volume.showsVolumeSlider = YES;
    [self.Volume sizeToFit];
    [self.Volume setFrame:CGRectMake(100,200, 10, 10)];
    [self.view addSubview:self.Volume];
    [self.Volume userActivity];
    for (UIView *view in [self.Volume subviews]) {
        if ([[view.class description] isEqualToString:@"MPVolumeSlider"]) {
            _volumeSlider = (UISlider*)view;
            break;
        }
    }
    [_volumeSlider setValue:0.2];
    _volumeValue = _volumeSlider.value;
    
    //设置展示音量条的值
    _volumeSlider.value = _volumeValue;
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
