//
//  STViewController.m
//  ios-tips
//
//  Created by mac on 2018/8/9.
//  Copyright © 2018年 mac. All rights reserved.
//
/*
 静态库和动态库的区别
 1、静态库:连接时会被完整的复制到可执行的文件中 被多次实用多分拷贝
 2、动态库是:链接不会赋值 程序运行时有系统动态加载到内存 系统只会加载一次 节省内存
 */
/**
 模拟器和真机静态库的合并方法
 1.首先分别获取到真机(libEOClib.a)和模拟器(libEOClibR.a)的静态库
 2.然后用终端输入 lipo -create libEOClib.a libEOClibR.a output test.a(你要合并的静态库名称)
 3. 查看你合并后静态库支持 lipo -info test.a ( x86_64(支持模拟器) arm64（支持真机))
 */
/**
 静态库中有分类（categroy）
 Other Linker Flags
 -Objc 所有OC链接文件
 -all_load 所有链接文件
 -force_load 指定文件
 */
#import "STViewController.h"
#import "EOClib.h"
#import <EOCframe/EOCObject.h>
@interface STViewController ()

@end

@implementation STViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [EOClib Method];
    [EOCObject TestMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
