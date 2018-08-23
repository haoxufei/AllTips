//
//  ImageLoader.m
//  ios-tips
//
//  Created by mac on 2018/8/10.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ImageLoader.h"

static const CGFloat APPIconSize = 48.f;
@implementation ImageLoader{
    NSURLSessionDataTask *datatask;
}

-(void)StartLoadimage{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.apprecord.imageUrlString]];
    datatask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            
        }else{
            //赋值图片
            UIImage *image = [UIImage imageWithData:data];
            if (image.size.width != APPIconSize || image.size.height != APPIconSize) {
                UIGraphicsBeginImageContextWithOptions(CGSizeMake(APPIconSize, APPIconSize), YES, 0.f);
                [image drawInRect:CGRectMake(0.f, 0.f, APPIconSize, APPIconSize)];
                self.apprecord.appIcon = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
            }else{
                self.apprecord.appIcon = image;
            }

            
            if (self.completionBlock) {
                self.completionBlock();
            }
        }
    }];
    [datatask resume];
}

-(void)CancelLoadImage{
    [datatask cancel];
    datatask = nil;
    
}

@end
