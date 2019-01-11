//
//  PageViewController.m
//  ios-tips
//
//  Created by mac on 2018/5/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PageViewController.h"
#import "NewPagedFlowView.h"
#import "PGIndexBannerSubiew.h"
#define Width [UIScreen mainScreen].bounds.size.width
@interface PageViewController ()<NewPagedFlowViewDataSource,NewPagedFlowViewDelegate>
/**
 *  图片数组
 */
@property (nonatomic, strong) NSMutableArray *imageArray;
@end

@implementation PageViewController
- (NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"NewPagedFlowView";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    for (int index = 0; index < 5; index++) {
        NSString *strName = [NSString stringWithFormat:@"Yosemite%d.jpg",index];
        UIImage *image = [UIImage imageNamed:strName];
        [self.imageArray addObject:image];
    }
    
    [self setupUI];
}
- (void)setupUI {
    NewPagedFlowView *PagedFlowView = [[NewPagedFlowView alloc]initWithFrame:CGRectMake(0, 72, Width, Width * 9 / 16)];
    PagedFlowView.delegate = self;
    PagedFlowView.dataSource  = self;
    PagedFlowView.minimumPageAlpha = 0.1f;
    PagedFlowView.isCarousel = YES;
    PagedFlowView.orientation = NewPagedFlowViewOrientationHorizontal;
    PagedFlowView.isOpenAutoScroll = YES;
//    UIPageControl *pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(0, PagedFlowView.frame.size.height - 32, Width, 8)];
//    PagedFlowView.pageControl = pagecontrol;
//    [PagedFlowView addSubview:pagecontrol];
    [PagedFlowView reloadData];
    [self.view addSubview:PagedFlowView];
}
-(CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView{
     return CGSizeMake(Width - 60, (Width - 60) * 9 / 16);
}
-(void)didScrollToPage:(NSInteger)pageNumber inFlowView:(NewPagedFlowView *)flowView{
    
}
-(void)didSelectCell:(PGIndexBannerSubiew *)subView withSubViewIndex:(NSInteger)subIndex{
    
}
-(NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView{
    return  self.imageArray.count;
}
-(PGIndexBannerSubiew *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    PGIndexBannerSubiew *banner = [flowView dequeueReusableCell];
    if (!banner) {
        banner = [[PGIndexBannerSubiew alloc] init];
        banner.tag = index;
        banner.layer.cornerRadius = 4;
        banner.layer.masksToBounds = YES;
    }
    banner.mainImageView.image = self.imageArray[index];
    return banner;
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
