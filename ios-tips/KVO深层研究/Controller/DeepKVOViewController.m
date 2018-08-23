//
//  DeepKVOViewController.m
//  ios-tips
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 mac. All rights reserved.
//
// https://gitee.com/iOSDaiMaGuanLi/iostips.git
#import "DeepKVOViewController.h"
#import "EcoPerson.h"
#import "Familty.h"

@interface DeepKVOViewController ()

@end

@implementation DeepKVOViewController

/*
 底层原理：
 利用运行时， 生成一个对象的子类，并生成子类对象，并替换原来对象的isa指针
 并且重写了set方法
 NSLog(@"before:%s",object_getClassName(fa));
 NSLog(@"before:%@",[DeepKVOViewController findSubClass:[fa class]]);
 NSLog(@"after:%s",object_getClassName(fa));
 NSLog(@"after:%@",[DeepKVOViewController findSubClass:[fa class]]);
 //通过kvc的方法修改了数组的isa指针
 NSMutableArray *tmpArray = [fa mutableArrayValueForKey:@"eocArray"];
 NSLog(@"tmpArray:%s",object_getClassName(tmpArray));
 NSLog(@"eocArray:%s",object_getClassName(fa.eocArray));
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    Familty *fa = [[Familty alloc]init];
    
    fa.Name = @"eco";
    
    [fa addObserver:self forKeyPath:@"person" options:NSKeyValueObservingOptionNew context:nil];
    
    
    fa.person.Age = @"11";


    [fa removeObserver:self forKeyPath:@"person"];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
   NSLog(@"%@",change);
    
}
//返回当前的子类
+ (NSArray*)findSubClass:(Class)defaultClass
{
    int count = objc_getClassList(NULL, 0);
    if (count <= 0) {
        return [NSArray array];
    }
    NSMutableArray *output = [NSMutableArray arrayWithObject:defaultClass];
    Class *classes = (Class*)malloc(sizeof(Class)*count);
    objc_getClassList(classes, count);
    for (int i = 0; i < count; i++) {
        if (defaultClass == class_getSuperclass(classes[i])) {
            [output addObject:classes[i]];
        }
    }
    free(classes);
    return output;
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
