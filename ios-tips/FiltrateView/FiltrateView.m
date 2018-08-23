//
//  FiltrateView.m
//  ios-tips
//
//  Created by mac on 2018/5/31.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FiltrateView.h"
#import <Masonry.h>
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0  blue:b/255.0  alpha:1.0]
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
@interface FiltrateView()
@property(nonatomic,strong)NSMutableArray *Items1;
@property(nonatomic,strong)NSMutableArray *Items2;
@property(nonatomic,strong)NSMutableArray *Items3;
@property(nonatomic,strong)UIView *BackgroundView;

@end

@implementation FiltrateView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8];
        self.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        [self SetUI];
        
    }
    return self;
}
-(void)SetUI{
    self.Items1 = [NSMutableArray arrayWithObjects:@"一心",@"二心",@"三心",@"四心",@"五心",@"六心",@"七心",@"八心",@"九心",@"十心",nil];
    self.Items2 = [NSMutableArray arrayWithObjects:@"手机单",@"电脑单",nil];
    self.Items3 = [NSMutableArray arrayWithObjects:@"有保证金",@"无保证金",nil];
    UILabel *Titlelab = [self CreateLabel:20 textColor:RGB(40, 146, 255) Labeltext:@"筛选"];
    UILabel *Titlelab2 = [self CreateLabel:16 textColor:RGB(53, 53, 53)Labeltext:@"小号"];
    UILabel *Titlelab3 = [self CreateLabel:16 textColor:RGB(53, 53, 53)Labeltext:@"设备"];
    UILabel *Titlelab4 = [self CreateLabel:16 textColor:RGB(53, 53, 53)Labeltext:@"保证金"];
    UIButton *Cancel = [self CreateButton:@"取消"];
    [Cancel addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    UIButton *xuze = [self CreateButton:@"筛选"];
    [xuze addTarget:self action:@selector(xuzeBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.BackgroundView.frame = CGRectMake((SCREENWIDTH -280)/2, (SCREENHEIGHT - 377)/2, 280, 377);
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePopupView:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:gesture];
    [self addSubview:self.BackgroundView];
    
    [self.BackgroundView addSubview:Titlelab];
    [self.BackgroundView addSubview:Titlelab2];
    [self.BackgroundView addSubview:Titlelab3];
    [self.BackgroundView addSubview:Titlelab4];
    [self.BackgroundView addSubview:Cancel];
    [self.BackgroundView addSubview:xuze];
    [Titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@25);
        make.top.equalTo(@20);
    }];
    [Titlelab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@21);
        make.top.equalTo(Titlelab.mas_bottom).offset(28);
    }];
    for (int i = 0; i < self.Items1.count; i ++) {
        UIButton *btn = [self CreateSelectButton];
        [self.BackgroundView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i <= 4){
                    make.left.equalTo(@(21 + i *49));
                    make.top.equalTo(Titlelab2.mas_bottom).offset(11);
                }else{
                   make.left.equalTo(@(21 + (i - 5) *49));
                   make.top.equalTo(Titlelab2.mas_bottom).offset(11+25+12);
                }
                make.height.equalTo(@25);
                make.width.equalTo(@40);
            }];
        [btn setTitle:[NSString stringWithFormat:@"%@",self.Items1[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(VerietiesButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [Titlelab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@21);
        make.top.equalTo(Titlelab2.mas_bottom).offset(50 +11 +12 +16);
    }];
    for (int i = 0; i < self.Items2.count; i ++) {
        UIButton *btn = [self CreateSelectButton];
        [self.BackgroundView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@ (21 + i *59));
            make.top.equalTo(Titlelab3.mas_bottom).offset(11);
            make.height.equalTo(@25);
            make.width.equalTo(@50);
        }];
        [btn setTitle:[NSString stringWithFormat:@"%@",self.Items2[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(Clickequipment:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i + 200;
        
    }
    [Titlelab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@21);
        make.top.equalTo(Titlelab3.mas_bottom).offset(11 +25 +16);
    }];
    for (int i = 0; i < self.Items3.count; i ++) {
        UIButton *btn = [self CreateSelectButton];
        [self.BackgroundView addSubview:btn];
        [btn setTitle:[NSString stringWithFormat:@"%@",self.Items3[i]] forState:UIControlStateNormal];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(21 + i *69));
            make.top.equalTo(Titlelab4.mas_bottom).offset(11);
            make.width.equalTo(@60);
            make.height.equalTo(@25);
        }];
        btn.tag = i + 300;
        [btn addTarget:self action:@selector(ClickBaoZhangJin:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    [xuze mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Titlelab4.mas_bottom).offset(11 + 25 +31);
        make.right.equalTo(@-31);
    }];
    [Cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(xuze.mas_left).offset(-47);
        make.top.equalTo(Titlelab4.mas_bottom).offset(11 + 25 +31);
    }];
    
}

-(UILabel *)CreateLabel:(CGFloat)font textColor:(UIColor *)color Labeltext:(NSString *)text{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}
-(UIButton *)CreateButton:(NSString *)Title{
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitleColor:RGB(40, 146, 255) forState:UIControlStateNormal];
    [btn setTitle:Title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    return btn;
}
-(UIButton *)CreateSelectButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:RGB(40, 146, 255) forState:UIControlStateSelected];
    [btn setTitleColor:RGB(153, 153, 153) forState:UIControlStateNormal];
    btn.layer.borderWidth = 1.0;
    btn.layer.cornerRadius = 4.0;
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.layer.borderColor = RGB(153, 153, 153).CGColor;
    return btn;
}
-(UIView *)BackgroundView{
    if (!_BackgroundView) {
        _BackgroundView = [[UIView alloc]init];
        _BackgroundView.backgroundColor = [UIColor whiteColor];
        _BackgroundView.layer.masksToBounds = YES;
        _BackgroundView.layer.cornerRadius = 4.0;
    }
    return _BackgroundView;
}
#pragma  -- MARK 点击事件
-(void)cancelClick{
    [self removeFromSuperview];
}
-(void)xuzeBtn{
    
}
-(void)VerietiesButtonClick:(UIButton *)sender{
    if (sender.selected == YES) {
        sender.layer.borderColor = RGB(153, 153, 153).CGColor;
        sender.layer.cornerRadius = 4.0f;
        sender.selected = NO;
    }else{
        sender.layer.borderColor = RGB(40, 146, 255).CGColor;
        sender.layer.cornerRadius = 4.0f;
        sender.selected = YES;
    }
}
-(void)Clickequipment:(UIButton *)sender{
    if (sender.selected == YES) {
        sender.layer.borderColor = RGB(153, 153, 153).CGColor;
        sender.layer.cornerRadius = 4.0f;
        sender.selected = NO;
    }else{
        sender.layer.borderColor = RGB(40, 146, 255).CGColor;
        sender.layer.cornerRadius = 4.0f;
        sender.selected = YES;
    }
}
-(void)ClickBaoZhangJin:(UIButton *)sender{
    if (sender.selected == YES) {
        sender.layer.borderColor = RGB(153, 153, 153).CGColor;
        sender.layer.cornerRadius = 4.0f;
        sender.selected = NO;
    }else{
        sender.layer.borderColor = RGB(40, 146, 255).CGColor;
        sender.layer.cornerRadius = 4.0f;
        sender.selected = YES;
    }
}
-(void)hidePopupView:(UITapGestureRecognizer *)ges{
    [self removeFromSuperview];
}
@end
