//
//  MyMeetingVC.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "MyMeetingVC.h"
#import "topScrollView.h"

@interface MyMeetingVC()
@property (nonatomic, strong)topScrollView *top;
@end

@implementation MyMeetingVC

#pragma lazy

#pragma mark - lifeCycle
- (instancetype)initWithTitle:(NSString *)title
{
    MyMeetingVC *vc = [[MyMeetingVC alloc]init];
    vc.titleString = title;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化
    [self setup];
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //获取数据
    [self loadData];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //刷新视图
    [self resetSubViews];

}

#pragma mark - private api
//初始化
- (void)setup
{
    NSArray *arr = @[@"会议通知",@"会议管理",@"会议室预定"];
    topScrollView *top = [[topScrollView alloc]initWithTitles:arr];
    self.top = top;

    [self.view addSubview:top];

}

//获取数据
- (void)loadData
{
    
}

//刷新视图
- (void)resetSubViews
{
    
}
#pragma mark - public api

#pragma mark - appleDelegate

#pragma mark - customDelegate

#pragma mark - property



@end
