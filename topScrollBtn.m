//
//  topScrollBtn.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "topScrollBtn.h"

CGFloat const btnHeight = 44;

@implementation topScrollBtn

#pragma lazy

#pragma mark - lifeCycle

#pragma mark - private api
//初始化
- (void)setup
{
    
}

//获取数据
- (void)loadData
{
    
}

#pragma mark - public api
//刷新视图
- (void)resetSubViews
{
    
}

+ (instancetype)buttonWithTitle:(NSString *)title
{
    topScrollBtn *btn = [topScrollBtn buttonWithType:UIButtonTypeCustom];
    btn.y = 0;
    btn.height = 44;
    btn.width = SIZEWIDTH * 0.25;
    [btn setTitleColor:ALColor(31.0, 178.0, 138.0) forState:UIControlStateNormal];
    [btn setBackgroundColor:ALColor(234.0, 234.0, 234.0)];
    [btn setTitle:title forState:UIControlStateNormal];
    
    return btn;
}

#pragma mark - property

@end
