//
//  PiclabelView.h
//  ios-tips
//
//  Created by mac on 2018/5/31.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PiclabelView : UIView
/**
 *  Pie
 *
 *  @param frame      frame
 *  @param dataItems  数据源
 *  @param colorItems 对应数据的pie的颜色，如果colorItems.count < dataItems 或
 *                      colorItems 为nil 会随机填充颜色
 *
 */
- (id)initWithFrame:(CGRect)frame
          dataItems:(NSArray *)dataItems
         colorItems:(NSArray *)colorItems;
- (void)stroke;
@end
