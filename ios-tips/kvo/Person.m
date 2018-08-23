//
//  Person.m
//  ios-tips
//
//  Created by mac on 2018/7/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)SetObserver{
    
    [self.acconunt addObserver:self forKeyPath:@"balance" options:NSKeyValueObservingOptionNew context:nil];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (object == self.acconunt && [keyPath isEqualToString:@"balance"]) {
        NSLog(@"Person账户:%f",self.acconunt.balance);
    }
}
-(void)dealloc{
    [self.acconunt removeObserver:self forKeyPath:@"balance" context:nil];
}
@end
